# AWS CloudFront 缓存清除工具（含打包文件）

该项目提供一个简单的 PowerShell 工具，用于批量清除 AWS CloudFront 的缓存（Invalidation）。适合需要手动或批量刷新 CDN 内容的开发者。

## 📁 使用步骤

1. **编辑 `.env` 文件**，填入你的 AWS 凭证：

   ```env
   AWS_ACCESS_KEY_ID=你的访问密钥
   AWS_SECRET_ACCESS_KEY=你的密钥
   AWS_DEFAULT_REGION=ap-east-1
   ```

2. **运行脚本**  
   双击 `run.bat`，或在命令提示符中执行以下命令：

   ```bat
   run.bat
   ```

3. **输入 CloudFront 分发 ID**  
   当提示时，输入一个或多个 CloudFront Distribution ID（多个 ID 使用英文逗号 , 分隔）

4. 脚本将自动为每个 Distribution 创建路径为 `/*` 的失效请求，以清除所有缓存内容。

---

## 📦 附加：打包工具包

你也可以下载预先打包好的版本，方便分发或离线使用：

- `cloudfront-invalidator.zip`：包含主脚本、环境变量模板和中英文说明文档

---

# AWS CloudFront Invalidation Tool (with packaged version)

This project provides a simple PowerShell tool for invalidating one or more AWS CloudFront distributions. Useful for developers who want to manually or batch clear CDN content.

## 📁 Steps to Use

1. **Edit the `.env` file** and fill in your AWS credentials:

   ```env
   AWS_ACCESS_KEY_ID=your-access-key
   AWS_SECRET_ACCESS_KEY=your-secret-key
   AWS_DEFAULT_REGION=ap-east-1
   ```

2. **Run the script**  
   Double-click `run.bat` or execute it in the command prompt:

   ```bat
   run.bat
   ```

3. **Enter your CloudFront Distribution ID(s)**  
   When prompted, input one or more CloudFront distribution IDs (comma-separated if multiple)

4. The script will automatically create an invalidation request for the path `/*` on each provided distribution.

---

## 📦 Optional: Downloadable Package

You can also download a ready-to-use zip version of the tool:

- `cloudfront-invalidator.zip`: includes the main script, `.env` template, and both English and Simplified Chinese guides.
