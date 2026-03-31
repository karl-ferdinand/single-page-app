data "aws_iam_policy_document" "lambda_trust_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com", "edgelambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "archive_file" "lambda_file" {
  type        = "zip"
  source_file = "lambda.py"
  output_path = "lambda.zip"
}

resource "aws_iam_role" "lambda_execution_role" {
  name               = "single-page-app-lamba-execution-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_trust_policy.json
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "lambda_function" {
  region        = "us-east-1"
  filename      = "lambda.zip"
  function_name = var.function_name
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "lambda.lambda_handler"
  publish       = true

  source_code_hash = data.archive_file.lambda_file.output_base64sha256

  runtime = "python3.14"

  depends_on = [aws_iam_role_policy_attachment.lambda_policy_attachment]
}
