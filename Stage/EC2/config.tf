terraform {
  backend "s3" {
    bucket = "lockbucket312421114025"
    key = "stage/vpc/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "terraform-locks-table"
    encrypt = true
  }
}