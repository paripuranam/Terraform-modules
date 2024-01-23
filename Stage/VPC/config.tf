terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "lockbucket312421114025"
    key            = "stage/vpc/terraform.tfstate"
    region         = "us-east-1"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-locks-table"
    encrypt        = true
  }
}