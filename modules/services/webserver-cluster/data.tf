data "aws_vpc" "my_vpc" {
  default = true
}

data "aws_subnets" "my_subnets"{
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.my_vpc.id]
  }
}

# data "terraform_remote_state" "rds_db" {
#   backend = "s3"

#   config = {
#     region = "us-east-1"
#     bucket = var.rds_db_remote[0]
#     key = var.rds_db_remote[1]
#   }
# }
