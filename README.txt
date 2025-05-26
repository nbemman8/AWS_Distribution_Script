AWS CloudFront 缓存清除工具（含打包文件）

该工具可用于批量清除 AWS CloudFront 分发的缓存内容，适用于需要手动或批量刷新 CDN 的开发者。

【使用步骤】：
1. 编辑 .env 文件，填写你的 AWS 凭证：
   AWS_ACCESS_KEY_ID=你的访问密钥
   AWS_SECRET_ACCESS_KEY=你的密钥
   AWS_DEFAULT_REGION=ap-east-1

2. 运行脚本：
   双击 run.bat，或在命令行执行：
   run.bat

3. 输入 CloudFront 分发 ID（多个用英文逗号分隔）
   例如：ABCDEFG,HIJKLM,MNOPQR

4. 脚本会为每个分发创建一个路径为 /* 的失效请求，从而清除所有缓存内容。

提示：如果脚本在执行 Set-ExecutionPolicy 命令时报错，请手动执行以下命令，并选择“是（Yes）”：
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force


-----------------------------------------------------------------------

AWS CloudFront Invalidation Tool (with packaged zip)

This tool lets you invalidate (clear cache for) one or more AWS CloudFront distributions. Ideal for developers needing to manually refresh CDN content.

[Steps to Use]:
1. Edit the .env file and provide your AWS credentials:
   AWS_ACCESS_KEY_ID=your-access-key
   AWS_SECRET_ACCESS_KEY=your-secret-key
   AWS_DEFAULT_REGION=ap-east-1

2. Run the script:
   Double-click run.bat or execute:
   run.bat

3. Enter CloudFront Distribution ID(s) (comma-separated if multiple)
   Example: ABCDEFG,HIJKLM,MNOPQR

4. The script will create invalidation requests for the path /* for each provided distribution.

Note: If the script fails at Set-ExecutionPolicy, run the following manually and choose Yes:
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
