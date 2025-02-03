module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  monitoring             = false
  vpc_security_group_ids = ["sg-06f76a53f08a418d4"]
  subnet_id              = "subnet-024323b388ab68f2c"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "Teste pipeline"
  }
}

terraform {
  backend "s3" {
    bucket = "teste-repo-fullcycle-sidartaoss"'
    key    = "teste"
    region = "sa-east-1"
  }
}
