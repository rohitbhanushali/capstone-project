# Environment
environment = "staging"
aws_region  = "ap-south-1"

# Networking
vpc_cidr           = "10.1.0.0/16"
availability_zones = ["ap-south-1a", "ap-south-1b"]

# Database
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_name             = "uberclone_staging"
db_username         = "admin"
db_password         = "CHANGE_ME_IN_STAGING"  # Change this in production!

# Compute
ami_id          = "ami-0c55b159cbfafe1f0"  # Ubuntu 22.04 LTS
instance_type   = "t2.micro"
key_name        = "staging-key"  # Create this key pair in AWS
desired_capacity = 2
max_size        = 4
min_size        = 1 