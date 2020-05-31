variable "name" {
    description = "Nome do LC e do ASG"
    type        = string
}

variable "ami" {
  description = "ID da AMI usada para provisionar a instância"
  type        = string
}

variable "instance_type" {
  description = "Tipo (classe) da instância"
  type        = string
  default     = "t3.micro"
}

variable "security_group" {
  description = "Lista com IDs dos security groups que serão vinculados à instância"
  type        = list(string)
  default     = null
}

variable "user_data" {
  description = "User data utilizado ao provisionar a instância"
  type        = string
  default     = null
}

variable "key_name" {
  description = "Nome do Key Pair a ser usado para a instância"
  type        = string
  default     = ""
}

variable "iam_instance_profile" {
  description = "Instance Profile do IAM vinculado à instância"
  type        = string
  default     = ""
}

variable "ebs_optimized" {
  description = "Controla se a instância será provisionada como EBS-optimized"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Map de tags da instância e dos volumes"
  type        = map(string)
  default     = {}
}

variable "min_size" {
    description = "Quantidade mínima de instancias no ASG"
    type        = number
    default     = 2
}

variable "max_size" {
    description = "Quantidade máxima no ASG"
    type        = number
    default     = 4
}

variable "desired_capacity" {
    description = "Quantidade desejada de instancias no ASG"
    type        = number
    default     = 2
}

variable "vpc_zone_identifier" {
    description = "Lista de subnets ID para provisionar os recursos"
    type        = list(string)
}

variable "health_check_type" {
    description = "Tipo de health check, podendo ser ELB e EC2"
    type        = string
    default     = "ELB"
}

variable "health_check_grace_period" {
    description = "Tipo de health check, podendo ser ELB e EC2"
    type        = number
    default     = 300
}

variable "termination_policies" {
    description = "Uma lista de policies que decide como as instancias no ASG podem ser terminadas. Os valores são: OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, Default"
    type        = list(string)
    default     = ["Default"]
}

variable "suspended_processes" {
  description = "Uma lista de processos para suspender do ASG. Os valores são: Terminate, HealthCheck, ReplaceUnhealthy, AZRebalance, AlarmNotification, ScheduledActions, AddToLoadBalancer. Note that if you suspend either the Launch or Terminate process types, it can prevent your autoscaling group from functioning properly."
  type        = list(string)
  default     = []
}


variable "target_group_arns" {
    description = "Lista de ARN dos targets group."
    type        = list(string)
}

variable "enabled_metrics" {
  description = "Uma lista de metricas para coletar. Os valores permitidos são: GroupMinSize, GroupMaxSize, GroupDesiredCapacity, GroupInServiceInstances, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances"
  type        = list(string)
  default = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]
}

#variable "scaling_adjustment" {
#    description = "Numero de instancias para escalar"
#    type        = number
#    default     = 1
#}

#variable "adjustment_type" {
#    description = "Tipo de capacidade do ASG. Os valores validos são: ChangeInCapacity, ExactCapacity e PercentChangeInCapacity"
#    type        = string
#    default     = "PercentChangeInCapacity"
#}

#variable "cooldown" {
#    description = "Tempo em segundos após o dimensionamento e antes que o próximo dimensionamento possa ser iniciado"
#    type        = number
#    default     = 300
#}
variable "policy_type" {
    description = "Tipo de policy. Pode ser: SimpleScaling, StepScaling, TargetTrackingScaling"
    type        = string
    default     = "TargetTrackingScaling"
}

variable "predefined_metric_type" {
    description = "Tipo de métrica de autoscaling"
    type        = string
    default     = "ASGAverageCPUUtilization"
}

variable "target_value" {
    description = "Valor do target para metrica"
    type        = string
    default     = "60.0"
}