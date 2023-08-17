# lambda/lambda.tf

# Archive the Lambda source code
data "archive_file" "example_function_zip" {
  type        = "zip"
  source_dir  = "${path.root}/../lambdas/example_function/"
  output_path = "${path.module}/lambdas/example_function/example_function.zip"
}


# IAM role for the Lambda function
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_example_function"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })
}

# Attach the AmazonDynamoDBFullAccess policy to the Lambda IAM role
resource "aws_iam_role_policy_attachment" "lambda_dynamodb_access" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

# Define the Lambda function
resource "aws_lambda_function" "example_function_lambda" {
  function_name    = "example_function"
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.8"
  role             = aws_iam_role.iam_for_lambda.arn
  filename         = data.archive_file.example_function_zip.output_path
  source_code_hash = data.archive_file.example_function_zip.output_base64sha256

  environment {
    variables = {
      DYNAMODB_TABLE_NAME = var.dynamodb_table_name
    }
  }
}
