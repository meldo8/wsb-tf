output "lambda_bucket_name" {
  description = "Name of the S3 bucket used to store function code."

  value = aws_s3_bucket.lambda_bucket.id
}

output "function_name" {
  description = "Lambda function name"
  value = aws_lambda_function.app.function_name
}

output "base_url" {
  description = "Lambda invoke url"
  value = aws_apigatewayv2_stage.lambda.invoke_url
}