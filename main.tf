terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "eb_app_module" {
  source = "./eb_app_module"

  #input variables
  app_name                 = "ebeanstalk_app"
  environment_name         = "EBenv"
  c_name_prefix            = ""#Enter a name to prefix your app URL 
  environment_tier         = "WebServer"
  region                   = "us-east-1"
  eb_config_template_name  = "eb_config_template_custom"
  solution_stack           = "64bit Amazon Linux 2 v3.4.0 running Python 3.8"
  local_file_source = "" #Specify a local bucket
  bucket_name              = "" #Input s3 bucket name

}