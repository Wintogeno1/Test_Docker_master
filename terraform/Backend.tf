resource "aws_s3_bucket" "terraform_state_s3" {
  #make sure you give unique bucket name
  bucket = "terraform-aws-muneeb" 
  
# Enable versioning to see full revision history of our state files
  versioning {
         enabled = true
        }

# Enable server-side encryption by default
server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_acl" "terraform_state_bucket_acl" {
  bucket = aws_s3_bucket.terraform_state_s3.id
  acl = "private"
}

resource "aws_dynamodb_table" "terraform_locks" {
# Give unique name for dynamo table name
  name         = "tf-up-and-run-locks"
 
  read_capacity  = 3
  write_capacity = 3
  hash_key     = "LockID"
        attribute {
         name = "LockID"
         type = "S"
      }
}

terraform {
  backend "s3" {
    bucket         = "terraform-aws-muneeb"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "tf-up-and-run-locks"
  }
}




