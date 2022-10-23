resource "aws_iam_role" "AwsBeanstalkCustomRole" {
  name = "Aws_Beanstalk_Role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "sts:AssumeRole"
        ],
        "Principal" : {
          "Service" : [
            "elasticbeanstalk.amazonaws.com"
          ]
        }
      }
    ]
  })
  managed_policy_arns = ["arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier","arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth"]

}
resource "aws_iam_instance_profile" "beanstalk_instance_profile" {
  name = "beanstalkinstanceprofile"
  role = aws_iam_role.AwsBeanstalkCustomRole.name
}

