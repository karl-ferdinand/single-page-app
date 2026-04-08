# single-page-app
CI/CD pipeline to deploy AWS infrastructure hosting single page app.

## AWS Resources Deployed
- **S3**: Stores relevant HTML file.
- **CloudFront**: Distribution to serve relevant HTML file.
- **Lambda@Edge**: Python Lambda function to serve different HTML file depending on user's operating system.
- **CloudWatch**: Alarms to monitor 5xx errors on CloudFront and Lambda execution errors.
- **SNS**: Notifies email address when an alarm is triggered.

## Toolings Used
- **GitHub Actions**: Builds CI/CD pipeline to deploy AWS infrastructure.
- **Terraform**: Automates AWS infrastructure deployment.
- **Python**: Lambda function to process incoming CloudFront request.
