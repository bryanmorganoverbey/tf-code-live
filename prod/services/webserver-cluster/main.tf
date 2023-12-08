provider "aws" {
  region = "us-west-1"
}

module "webserver_cluster" {
  source                 = "github.com/bryanmorganoverbey/tf-code-modules//services/webserver-cluster?ref=v0.0.2"
  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "remote-state-for-terraform-up-and-running-bryan"
  db_remote_state_key    = "prod/data-stores/mysql/terraform.tfstate"
  instance_type          = "t2.micro"
  min_size               = 1
  max_size               = 10
  enable_autoscaling     = true
  custom_tags = {
    Owner     = "bryan overbey"
    ManagedBy = "terraform"
  }
}

