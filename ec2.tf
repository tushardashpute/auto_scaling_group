# ec2.tf inside modules/ec2 folder

resource "aws_instance" "VM-in-new-vpc" {
  ami                    = "ami-08f3d892de259504d" #id of desired AMI
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.ec2.id]   
  #Env  = var.env
  key_name = "ec2_rds"
  tags =  {
    Name = "${var.env}_ec2_key"
  }
}
