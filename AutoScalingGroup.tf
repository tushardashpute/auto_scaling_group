resource "aws_launch_configuration" "as_conf" {
    name_prefix = "as_conf-"
    image_id = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    security_groups = [aws_security_group.ec2.id] 
    user_data = file("insert-data-into-customers.py")
    lifecycle {
        create_before_destroy = true
    }

    root_block_device {
        volume_type = "gp2"
        volume_size = "8"
    }
}

resource "aws_autoscaling_group" "asg" {
  name                 = "terraform-asg"
  launch_configuration = aws_launch_configuration.as_conf.name
  min_size             = 2
  max_size             = 3
  vpc_zone_identifier = [aws_subnet.subnet.id, aws_subnet.subnet1.id]
  health_check_grace_period = 300
  health_check_type = "EC2"
  desired_capacity = 2
  force_delete = true

  lifecycle {
    create_before_destroy = true
  }

  tag {
        key = "Name"
        value = "ASG Instance"
        propagate_at_launch = true
    }
}

resource "aws_autoscaling_schedule" "scaleup" {
  scheduled_action_name  = "scaleup"
  min_size               = 2
  max_size               = 3
  desired_capacity       = 3
  start_time             = var.scaleup_start_time
  end_time               = var.scaleup_end_time
  recurrence             = var.scaleup_recurrence
  autoscaling_group_name = aws_autoscaling_group.asg.name
}