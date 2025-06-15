variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-020cba7c55df1f615"
}


variable "default_instance_type" {
  description = "The default instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}


variable "medium_instance_type" {
  description = "The default instance type for the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "default_region" {
  description = "The default AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}