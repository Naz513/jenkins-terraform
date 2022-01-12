variable "instance_type_env" {
  description = "Map for Instance types based on the Environment"
  type        = map(string)
  default = {
    "dev"  = "t2.micro"
    "test" = "t2.medium"
    "prod" = "t2.large"
  }
}

variable "instance_type" {
  description = "Enter one of the following: dev, test, or prod"
}