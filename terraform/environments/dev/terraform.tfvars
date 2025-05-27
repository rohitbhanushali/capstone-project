environment        = "dev"
aws_region         = "ap-south-1"
vpc_cidr           = "10.0.0.0/16"
availability_zones = ["ap-south-1a", "ap-south-1b"]

# Database configuration
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_name              = "uberclone"
db_username          = "admin"
db_password          = "your-secure-password-here" # Change this to a secure password

# Compute configuration
ami_id           = "ami-0a0c8eebcdd6dcbd0" # Ubuntu 22.04 LTS AMI in ap-south-1
instance_type    = "t2.micro"
key_name         = "your-key-pair-name" # Create this in AWS Console
desired_capacity = 1
max_size         = 2
min_size         = 1 