variable "my_port" {
    description = "std port"
    type = list(number)
    default = [ 80,8080,35250 ]
}

variable "asg_name" {
  description = "Name for ASG, will also be used to name ALB, SG and other dependent resources."
  type = string
}

variable "asg_db_name" {
  description = "Name for the DynamoDB table used for locking. Creates a new table."
  type = string
}

# variable "bucket_data" {
#   description = "Enter the name and key of bucket and terraform state file, as a list"
#   type = list(string)
# }

# variable "rds_db_remote" {
#   description = "Enter the name and key of the .tfstate file for the rds db."
#   type = list(string)
# }

variable "custom_tags" {
  type = map(string)
  default = {}
}

variable "enable_autoscaling" {
  type = bool
  description = "Set to true if you wish to enable autoscaling"
}