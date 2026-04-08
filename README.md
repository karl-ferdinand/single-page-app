# single-page-app
CI/CD pipeline to deploy AWS infrastructure hosting single page app. App will return different outputs in the browser depending on the operating system of the user.

## AWS Resources Deployed
- **S3**: Stores relevant single page app HTML files.
- **CloudFront**: Distribution to serve relevant HTML file.
- **Lambda**: Python Lambda function to serve different HTML file depending on user's operating system.
- **CloudWatch**: Alarms to monitor 5xx errors on CloudFront and Lambda execution errors.
- **SNS**: Notifies email address when an alarm is triggered.

## AWS Provider Regions Used
- **ap-southeast-2**: S3, CloudFront.
- **us-east-1**: CloudWatch, Lambda and SNS.

## Toolings Used
- **GitHub Actions**: Builds CI/CD pipeline to deploy AWS infrastructure.
- **Terraform**: Automates AWS infrastructure deployment.
- **Python**: Lambda function to process incoming CloudFront request.

## Sample App Output
Access CloudFront at this domain: [d37q5v94kvzh82.cloudfront.net](https://d37q5v94kvzh82.cloudfront.net/). Use different operating systems to test different outputs.
![Sample app output](/documentation/sample-output.png)
