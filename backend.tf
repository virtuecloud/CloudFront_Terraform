terraform {
  backend "s3" {
    bucket = "xyz"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}