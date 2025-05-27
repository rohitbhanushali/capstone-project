environment         = "dev"
aws_region         = "us-east-1"
vpc_cidr           = "10.0.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b"]

# Database configuration
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_name             = "uberclone"
db_username         = "admin"
db_password         = "your-secure-password-here" # Change this!

# Compute configuration
ami_id           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
instance_type    = "t3.micro"
key_name         = "your-key-pair-name"    # Change this!
desired_capacity = 2
max_size         = 4
min_size         = 1 