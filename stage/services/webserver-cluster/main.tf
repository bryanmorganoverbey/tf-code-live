provider "aws" {
  region = "us-west-1"
}
module "webserver_cluster" {
  source                 = "github.com/bryanmorganoverbey/tf-code-modules//services/webserver-cluster?ref=v0.0.1"
  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "remote-state-for-terraform-up-and-running-bryan"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate"
  instance_type          = "t2.micro"
  min_size               = 2
  max_size               = 2
}