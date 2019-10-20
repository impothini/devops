terraform {
	backend "s3" {
		bucket="terraform-backend-05f91"
		key = "terraform/backend"
		region = "us-east-2"
	}
}
