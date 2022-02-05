.PHONY: init
init:
	@aws-vault exec PROJECT-ENVIRONMENT -- terraform init

.PHONY: destroy
destroy:
	@aws-vault exec PROJECT-ENVIRONMENT -- terraform destroy

.PHONY: apply
apply:
	@aws-vault exec PROJECT-ENVIRONMENT -- terraform apply

.PHONY: check-lambda-code
check-lambda-code:
	@aws-vault exec PROJECT-ENVIRONMENT -- aws s3 ls $(terraform output -raw lambda_bucket_name)

.PHONY: function-name
function-name:
	@terraform output -raw function_name

.PHONY: lambda-base-url
lambda-base-url:
	@terraform output -raw base_url

.PHONY: invoke-lambda
invoke-lambda:
	@aws-vault exec PROJECT-ENVIRONMENT -- aws lambda invoke --region=us-east-1 --function-name=$(terraform output -raw function_name) --cli-binary-format raw-in-base64-out --payload '{"queryStringParameters": {"number": $(number), "power": $(power)}}' response.json