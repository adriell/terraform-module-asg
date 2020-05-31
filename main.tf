resource "aws_launch_configuration" "default" {
    name_prefix          = "${var.name}-lc"
    image_id             = var.ami
    instance_type        = var.instance_type
    security_groups      = var.security_group
    iam_instance_profile = var.iam_instance_profile
    key_name             = var.key_name
    ebs_optimized        = var.ebs_optimized
    user_data            = var.user_data
    lifecycle {
        create_before_destroy = true
    }
}


resource "aws_autoscaling_group" "default" {
    name_prefix               = "${var.name}-asg"
    launch_configuration      = aws_launch_configuration.default.name
    min_size                  = var.min_size
    max_size                  = var.max_size
    desired_capacity          = var.desired_capacity
    vpc_zone_identifier       = var.vpc_zone_identifier
    health_check_type         = var.health_check_type
    health_check_grace_period = var.health_check_grace_period
    termination_policies      = var.termination_policies
    suspended_processes       = var.suspended_processes
    target_group_arns         = var.target_group_arns
    enabled_metrics           = var.enabled_metrics
    tags = [
    {
      key                 = "Name"
      value               = "${var.name}-asg"
      propagate_at_launch = true
    },
    {
      key                 = "Env"
      value               = "Dev"
      propagate_at_launch = true
    },
  ]
    lifecycle {
        create_before_destroy = true
    }
}


resource "aws_autoscaling_policy" "default" {
    name                   = "${var.name}-policy"
  #  scaling_adjustment     = var.scaling_adjustment
   # adjustment_type        = var.adjustment_type
   # cooldown               = var.cooldown
    autoscaling_group_name = aws_autoscaling_group.default.name
    policy_type            = var.policy_type

    target_tracking_configuration {
        predefined_metric_specification {
            predefined_metric_type = var.predefined_metric_type
        }

        target_value = var.target_value
    }
    lifecycle {
        create_before_destroy = true
    }
}




