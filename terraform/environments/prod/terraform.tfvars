# Environment
environment = "prod"
aws_region  = "ap-south-1"

# Networking
vpc_cidr           = "10.2.0.0/16"
availability_zones = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]  # Using 3 AZs for high availability

# Database
db_instance_class    = "db.t3.micro"
db_allocated_storage = 30
db_name             = "uberclone_prod"
db_username         = "admin"
db_password         = "CHANGE_ME_IN_PROD"  # Change this in production!

# Compute
ami_id          = "ami-0c55b159cbfafe1f0"  # Ubuntu 22.04 LTS
instance_type   = "t2.micro"
key_name        = "prod-key"  # Create this key pair in AWS
desired_capacity = 2
max_size        = 4
min_size        = 2  # Higher minimum for better availability 