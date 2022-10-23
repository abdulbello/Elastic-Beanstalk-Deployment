#resource "aws_s3_bucket" "default" {
#    bucket = aws_s3_bucket.app_version_bucket.id

#}

#resource "aws_s3_bucket_object" "default" {

#    bucket = aws_s3_bucket.default.id
#    key = "test-flask-app-bucket"
#    source = var.bucket_local_file_source
#}

data "aws_s3_bucket" "flask_app_bucket" {
  bucket = aws_s3_bucket.app_version_bucket.id
}

data "aws_s3_bucket_object" "bucket_object_reference" {
  bucket = data.aws_s3_bucket.flask_app_bucket.id
  key    = "test-app-flask-bucket"
}

resource "aws_elastic_beanstalk_application" "flask_application" {
  name = var.app_name
}

resource "aws_elastic_beanstalk_application_version" "application_version" {
  name        = "version 1.0"
  application = aws_elastic_beanstalk_application.flask_application.name
  description = "application version created by Terraform"
  bucket      = data.aws_s3_bucket.flask_app_bucket.id
  key         = "test-app-flask-bucket"

}


resource "aws_elastic_beanstalk_configuration_template" "configuration_template" {
  name                = var.eb_config_template_name
  application         = aws_elastic_beanstalk_application.flask_application.id
  solution_stack_name = var.solution_stack
}


resource "aws_elastic_beanstalk_environment" "eb-environemnt" {
  name                = var.environment_name
  application         = aws_elastic_beanstalk_application.flask_application.id
  solution_stack_name = var.solution_stack
  cname_prefix        = var.c_name_prefix
  tier                = var.environment_tier
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_instance_profile.arn
  }
  depends_on = [
    aws_iam_instance_profile.beanstalk_instance_profile
  ]
}

