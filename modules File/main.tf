provider "aws" {
  region = "us-east-1"
}

module "web-server" {
  source = "../modules/services/webserver-cluster"
  asg_db_name = "Lock-file"
  asg_name = "DB-ASG"
  custom_tags = {
    "owner" = "Pari"
    "managed by" = "Terraform"
  }
  enable_autoscaling = false

}