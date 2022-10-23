variable "app_name" {
  type        = string
  description = "Elastic Beanstalk Application Name"
  default     = "eb_app"
}

variable "environment_name" {
  type        = string
  description = "Elastic Beanstalk Environment Name"
  default     = "eb_env"
}

variable "c_name_prefix" {
  description = "CName prefix to add to the base elastic Beanstalk URL"
  type        = string
  default     = "flask_app"
}

variable "environment_tier" {
  description = "EB environment Tier"
  type        = string
  default     = "WebServer"
}

variable "region" {
  description = "Specifies the region you want the resources to be deployed to"
  type        = string
  default     = "us-east-1" #deploys by deafult to US-East-1
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "flask_app_bucket"
}

variable "eb_config_template_name" {
  description = "Elastic Beanstalk Configuration Template"
  type        = string
  default     = "eb_config_template_custom"

}

variable "eb_aplication_version" {
  description = "EB application version"
  type        = string
  default     = "1.0"
}

variable "solution_stack" {
  description = "Solution Stack to build application on"
  type        = string
  default     = "64bit Amazon Linux 2 v3.4.0 running Python 3.8"

}

variable "local_file_source" {
  description = "path to file to be uploaded to the bucket"
  type        = string
  default     = "/"
}