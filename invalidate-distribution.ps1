try {
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force -ErrorAction Stop
}
catch {
    Write-Host "Failed to set execution policy. Script may not run correctly."
}

$envFile = Join-Path $PSScriptRoot ".env"

if (!(Test-Path $envFile)) {
    Write-Host ".env file not found at $envFile"
    exit 1
}

Get-Content $envFile | ForEach-Object {
    if ($_ -match "^\s*([^#=\s]+)\s*=\s*(.*)$") {
        $key = $matches[1].Trim()
        $val = $matches[2].Trim().Trim('"').Trim("'")
        [System.Environment]::SetEnvironmentVariable($key, $val, "Process")
    }
}
Write-Host "Environment variables loaded from .env"

$accessKey = $env:AWS_ACCESS_KEY_ID
$secretKey = $env:AWS_SECRET_ACCESS_KEY
$region = $env:AWS_DEFAULT_REGION

if ([string]::IsNullOrWhiteSpace($accessKey) -or `
        [string]::IsNullOrWhiteSpace($secretKey) -or `
        [string]::IsNullOrWhiteSpace($region)) {
    Write-Host "One or more AWS credentials are missing in the .env file."
    exit 1
}


aws configure set aws_access_key_id $accessKey
aws configure set aws_secret_access_key $secretKey
aws configure set region $region
Write-Host "AWS CLI configured"

$input = Read-Host "Enter CloudFront Distribution ID(s) (comma-separated if multiple)"
if ([string]::IsNullOrWhiteSpace($input)) {
    Write-Host "No distribution ID(s) entered. Exiting."
    exit 1
}

$distributionIds = $input.Split(',') | ForEach-Object { $_.Trim() }

foreach ($id in $distributionIds) {
    Write-Host "Creating invalidation for Distribution ID: $id"
    $result = aws cloudfront create-invalidation `
        --distribution-id $id `
        --paths "/*"

    if ($LASTEXITCODE -eq 0) {
        Write-Host "Invalidation request submitted for $id"
    }
    else {
        Write-Host "Failed to create invalidation for $id"
    }
}