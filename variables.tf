variable "resource_prefix" {
  type        = "string"
  description = "Naming prefix to use for resources to be provisioned"
}

variable "acm_certificate_domain" {
  type        = "string"
  description = "The domain of the certificate to be registered with the ALB listener"
}

variable "ecs_cluster_id" {
  type = "string"
}

variable "ecs_cluster_name" {
  type        = "string"
  description = "Only needed if enable_monitoring = 1"
  default     = ""
}

variable "enable_monitoring" {
  default = 0
}

variable "monitoring_slack_webhook_url" {
  type    = "string"
  default = ""
}

variable "monitoring_slack_channel" {
  type    = "string"
  default = ""
}

variable "web_image" {
  type        = "string"
  description = "Name of Docker image to be pushed to ECR. It should not include the tag."
}

variable "web_version" {
  type        = "string"
  description = "Tag of Docker image that should be used when publishing to ECR and referencing from ECS Task Definition. Incrementing this value will trigger a docker push to the ECR repository."
}

variable "reverse_proxy_version" {
  type        = "string"
  description = "Tag of reverse_proxy Docker image that will be used to pull from GitLab and push to ECR. Incrementing this will trigger a docker push to the ECR repository."
}

variable "log_retention_in_days" {
  type        = "string"
  description = "Number of days CloudWatch logs for all ECS task containers should be retained."
  default     = "30"
}

variable "app_domain" {
  type        = "string"
  description = "The domain at which the application will be registered"
}

variable "route53_hosted_zone_id" {
  type        = "string"
  description = "The Hosted Zone ID at which the app_domain will be registered"
}

variable "xray_cpu" {
  type    = "string"
  default = "64"
}

variable "web_cpu" {
  type    = "string"
  default = "64"
}

variable "reverse_proxy_cpu" {
  type    = "string"
  default = "64"
}

variable "reverse_proxy_cert_country" {
  type        = "string"
  default     = ""
  description = "Subject Attribute C for self-signed SSL cert generated by nginx_reverse_proxy"
}

variable "reverse_proxy_cert_state" {
  type        = "string"
  default     = ""
  description = "Subject Attribute ST for self-signed SSL cert generated by nginx_reverse_proxy"
}

variable "reverse_proxy_cert_locality" {
  type        = "string"
  default     = ""
  description = "Subject Attribute L for self-signed SSL cert generated by nginx_reverse_proxy"
}

variable "reverse_proxy_cert_organization" {
  type        = "string"
  default     = ""
  description = "Subject Attribute O for self-signed SSL cert generated by nginx_reverse_proxy"
}

variable "reverse_proxy_cert_organizational_unit" {
  type        = "string"
  default     = ""
  description = "Subject Attribute OU for self-signed SSL cert generated by nginx_reverse_proxy"
}

variable "reverse_proxy_cert_email_address" {
  type        = "string"
  default     = ""
  description = "Subject Attribute emailAddress for self-signed SSL cert generated by nginx_reverse_proxy"
}

variable "xray_memory" {
  type    = "string"
  default = "128"
}

variable "web_memory" {
  type    = "string"
  default = "128"
}

variable "web_container_definition" {
  type = "string"
}

variable "reverse_proxy_memory" {
  type    = "string"
  default = "128"
}

variable "task_count" {
  type    = "string"
  default = 1
}

variable "alb_internal" {
  type    = "string"
  default = 1
}

variable "alb_listener_default_action" {
  type        = "string"
  default     = "forward"
  description = "Only forward and redirect are currently supported"
}

variable "alb_allowed_ingress_cidr_blocks" {
  type        = "list"
  default     = ["10.0.0.0/8"]
  description = "[Optional] CIDR block allowed to access load balancer. Defaults to 10.0.0.0/8."
}

variable "alb_default_target_group_arn" {
  type        = "string"
  default     = ""
  description = "[Optional] ARN of the default target group for the load balancer. Defaults to the target group created by this module."
}

variable "alb_subnets_private" {
  type        = "list"
  description = "List of Ids of subnets in which load balancer will be hosted if alb_internal = true. App will be hosted in private subnets."
}

variable "alb_subnets_public" {
  type        = "list"
  description = "List of Ids of subnets in which load balancer will be hosted if alb_internal = false"
}

variable "alb_listener_default_redirect_host" {
  type        = "string"
  description = "Host to which request will be redirected (only used if alb_listener_default_action is redirect)"
}

variable "alb_listener_default_redirect_port" {
  type        = "string"
  description = "Port used when redirecting request from ALB (only used if alb_listener_default_action is redirect)"
}

variable "alb_listener_default_redirect_protocol" {
  type        = "string"
  description = "Protocol used when redirecting request from ALB (only used if alb_listener_default_action is redirect)"
}

variable "alb_listener_default_redirect_status_code" {
  type        = "string"
  description = "Status code used when redirecting request from ALB (only used if alb_listener_default_action is redirect)"
}

variable "vpc_id" {
  type        = "string"
  description = "ID of VPC in which all infrastucture will be provisioned"
}

variable "app_port" {
  type    = "string"
  default = 443
}

variable "app_healthcheck_endpoint" {
  type        = "string"
  default     = "/health-check"
  description = "[Optional] Endpoint that the Application Load Balancer will use to ensure a task is healthy. Defaults to /health-check"
}
