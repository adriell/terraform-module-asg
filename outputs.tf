
output "launch_configuration_id" {
    description = "ID do launch configuration"
    value       = aws_launch_configuration.default.id
}

output "launch_configuration_name" {
    description = "Nome do launch configuration"
    value       = aws_launch_configuration.default.name
}

output "autoscaling_group_id" {
    description = "ID do Auto Scaling Group"
    value       = aws_autoscaling_group.default.id
}

output "autoscaling_group_name" {
    description = "Nome do auto Scaling Group"
    value       = aws_autoscaling_group.default.name
}

output "autoscaling_group_arn" {
    description = "ARN AutoScaling Group"
    value       = aws_autoscaling_group.default.arn
}