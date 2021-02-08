## variables.tf of module
variable "subnet" {
  default = "10.0.0.0/24"
}
variable "subnet1" {
  default = "10.0.1.0/24"
}
variable "cidr_block" {
  default = "10.0.0.0/16"
}
variable "env" {
  default = "RDS_EC2"
}

variable "ami" {
  description = "AMI Instance ID"
  default = "ami-08f3d892de259504d"
}

variable "instance_type" {
  description = "Type of instance"
  default = "t2.micro"
}

variable "key_name" {
  description = "key name for the instance"
  default = "ec2_rds"
}

variable "scaleup_start_time" {
  description = "start time for scheduling autoscaling"
  default = "2021-02-08T11:55:00Z"
}

variable "scaleup_recurrence" {
  description = "recurrence for scheduling autoscaling"
  default = "55 11 * * *"
}

variable "scaleup_end_time" {
  description = "start time for scheduling autoscaling"
  default = "2021-02-08T11:59:00Z"
}

variable "scaledown_recurrence" {
  description = "recurrence for scheduling autoscaling"
  default = "59 11 * * *"
}