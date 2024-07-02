terraform {
  backend "s3" {
    bucket         = "rudi-backend"
    key            = "eip/terraform.tfstate"
    region         = "us-east-1"
    # dynamodb_table = terraform-locks
  }
}
