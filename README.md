# WSB Lambda Power

## About

---
Project contains Lambda, which is calculating the power of number. It can be activated via request GET HTTP with query parameters `/power?number=<integer>&power=<integer>`
```
GET HTTP /power?number=2&power=3

RESPONSE
200 "Content-Type": "application/json" 
{"result": 8}
```

## Deployment

---
To build project use `make init`

Source code should be zipped and uploaded to S3 Bucket 
To check whether it is there use `make check-lambda-code` and look for `app.zip`

When the code is provided use `make apply` to build AWS resources.

You can retrieve function name for CLI calls with `make function-name` or url to API Gateway to f.e. curl Lambda with `make lambda-base-url`

In order to validate working of lambda use `make invoke-lambda number=<int> power=<int>` (f.e. `make invoke-lambda number=2 power=3`) to call it directly.

To destroy project use `make destroy`

## Requirements

---
| Name                                                                      | Version  |
|---------------------------------------------------------------------------|----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws)                   | >= 3.48  |
| <a name="requirement_aws_vault"></a> [aws_vault](#requirement\_aws_vault) | >= 6.0   |

## Providers

---
| Name                                                          | Version  |
|---------------------------------------------------------------|----------|
| <a name="provider_aws"></a> [aws](#provider\_aws)             | >= 3.48  |
| <a name="provider_random"></a> [random](#provider\_random)    | >= 3.1.0 |
| <a name="provider_archive"></a> [archive](#provider\_archive) | >= 2.2.0 |


## Resources

---
| Name                                                                                                                                               | Type |
|----------------------------------------------------------------------------------------------------------------------------------------------------|------|
| [random_pet.lambda_bucket_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet)                                | resource |
| [aws_s3_bucket.lambda_bucket](https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/latest)                                    | resource |
| [aws_s3_bucket.lambda_bucket](https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/latest)                                    | resource |
| [aws_s3_bucket_object.lambda_power](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object)                  | resource |
| [aws_lambda_function.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function)                             | resource |
| [aws_cloudwatch_log_group.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group)                   | resource |
| [aws_iam_role.lambda_exec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                   | resource |
| [aws_iam_role_policy_attachment.lambda_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_apigatewayv2_api.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_api)                        | resource |
| [aws_apigatewayv2_stage.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_stage)                   | resource |
| [aws_apigatewayv2_integration.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_integration)          | resource |
| [aws_apigatewayv2_route.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_route)                      | resource |
| [aws_cloudwatch_log_group.api_gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group)               | resource |
| [aws_lambda_permission.api_gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission)                     | resource |
| [archive_file.lambda_power](#)                                                                                                                     | data source |