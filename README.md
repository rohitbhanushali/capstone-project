# Uber Clone - AWS Infrastructure with Terraform

![Project Architecture](https://github.com/user-attachments/assets/551d03fe-206c-4038-ba8f-98d9efa3ea70)

## Project Overview

This project implements a scalable and highly available Uber clone application infrastructure on AWS using Terraform. The infrastructure is designed to support a modern ride-sharing platform with high availability, security, and fault tolerance.

## Infrastructure Tree

```
capstone-project/
├── terraform/                      # Terraform infrastructure code
│   ├── environments/               # Environment-specific configurations
│   │   ├── dev/                   # Development environment
│   │   │   ├── main.tf           # Main configuration
│   │   │   ├── variables.tf      # Environment variables
│   │   │   └── terraform.tfvars  # Variable values
│   │   ├── staging/              # Staging environment
│   │   └── prod/                 # Production environment
│   ├── modules/                   # Reusable Terraform modules
│   │   ├── networking/           # Network infrastructure
│   │   │   ├── main.tf          # VPC, subnets, etc.
│   │   │   ├── variables.tf     # Module variables
│   │   │   └── outputs.tf       # Module outputs
│   │   ├── database/            # Database infrastructure
│   │   │   ├── main.tf         # RDS configuration
│   │   │   ├── variables.tf    # Module variables
│   │   │   └── outputs.tf      # Module outputs
│   │   ├── compute/             # Compute resources
│   │   │   ├── main.tf         # EC2, ASG configuration
│   │   │   ├── variables.tf    # Module variables
│   │   │   └── outputs.tf      # Module outputs
│   │   └── security/            # Security configurations
│   │       ├── main.tf         # Security groups, IAM
│   │       ├── variables.tf    # Module variables
│   │       └── outputs.tf      # Module outputs
│   └── scripts/                 # Helper scripts
│       ├── init.sh             # Initialization script
│       └── deploy.sh           # Deployment script
├── uber-clone/                  # Application code
├── .gitignore                  # Git ignore file
├── README.md                   # Project documentation
└── versions.tf                 # Terraform version constraints
```

### Directory Structure Explanation

#### environments/
- Contains environment-specific configurations
- Each environment (dev/staging/prod) has its own variables and state
- Allows for different configurations per environment

#### modules/
- **networking/**: VPC, subnets, NAT gateways, route tables
- **database/**: RDS instances, read replicas, parameter groups
- **compute/**: EC2 instances, Auto Scaling Groups, Load Balancers
- **security/**: Security groups, IAM roles, policies

#### scripts/
- Helper scripts for common operations
- Deployment and initialization scripts
- Environment setup utilities

## Infrastructure Architecture

### Key Components
- **Multi-AZ Deployment**: Public and private subnets across multiple availability zones
- **Network Security**:
  - Internet Gateway for controlled public access
  - NAT Gateways for private subnet internet access
  - Security Groups for strict network policies
- **Database Layer**:
  - RDS with Read Replica for high availability
  - Private subnet deployment for enhanced security
- **Application Layer**:
  - Scalable application servers in private subnets
  - Load balancing for traffic distribution

### Infrastructure as Code Benefits
- **Automation**: Eliminates manual infrastructure provisioning
- **Consistency**: Ensures identical environments across deployments
- **Version Control**: Track infrastructure changes
- **Rapid Recovery**: Quick infrastructure restoration
- **Cost Optimization**: Efficient resource utilization

## Prerequisites

- AWS Account with appropriate permissions
- Terraform v1.0.0 or later
- AWS CLI configured with credentials
- Basic understanding of AWS services and Terraform

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/capstone-project.git
   cd capstone-project
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Review the execution plan:
   ```bash
   terraform plan
   ```

4. Apply the infrastructure:
   ```bash
   terraform apply
   ```

## Infrastructure Components

### Network Layer
- VPC with CIDR block
- Public and private subnets across multiple AZs
- Internet Gateway and NAT Gateways
- Route tables and security groups

### Database Layer
- RDS instance with read replica
- Private subnet deployment
- Automated backups and snapshots

### Application Layer
- Auto Scaling Groups
- Load Balancers
- Application servers in private subnets

## Resource Breakdown

### Development Environment
| Resource Type | Configuration | Purpose |
|--------------|---------------|----------|
| VPC | CIDR: 10.0.0.0/16 | Main network for all resources |
| Public Subnets | 2 AZs, CIDR: 10.0.1.0/24, 10.0.2.0/24 | For internet-facing resources |
| Private Subnets | 2 AZs, CIDR: 10.0.3.0/24, 10.0.4.0/24 | For application and database servers |
| RDS Instance | t3.micro, MySQL 8.0 | Main database for development |
| EC2 Instances | t3.micro, 2 instances | Application servers |
| Security Groups | Custom rules for each service | Network access control |
| IAM Roles | Custom policies | Service permissions |

### Staging Environment
| Resource Type | Configuration | Purpose |
|--------------|---------------|----------|
| VPC | CIDR: 10.1.0.0/16 | Main network for all resources |
| Public Subnets | 2 AZs, CIDR: 10.1.1.0/24, 10.1.2.0/24 | For internet-facing resources |
| Private Subnets | 2 AZs, CIDR: 10.1.3.0/24, 10.1.4.0/24 | For application and database servers |
| RDS Instance | t3.small, MySQL 8.0 | Main database for staging |
| EC2 Instances | t3.small, 2 instances | Application servers |
| Security Groups | Custom rules for each service | Network access control |
| IAM Roles | Custom policies | Service permissions |

### Production Environment
| Resource Type | Configuration | Purpose |
|--------------|---------------|----------|
| VPC | CIDR: 10.2.0.0/16 | Main network for all resources |
| Public Subnets | 3 AZs, CIDR: 10.2.1.0/24, 10.2.2.0/24, 10.2.3.0/24 | For internet-facing resources |
| Private Subnets | 3 AZs, CIDR: 10.2.4.0/24, 10.2.5.0/24, 10.2.6.0/24 | For application and database servers |
| RDS Instance | t3.medium, MySQL 8.0 | Main database for production |
| EC2 Instances | t3.medium, 3 instances | Application servers |
| Security Groups | Custom rules for each service | Network access control |
| IAM Roles | Custom policies | Service permissions |

## Security Features

- Network isolation using private subnets
- Security groups for controlled access
- Encrypted data at rest and in transit
- IAM roles and policies
- Regular security updates and patches

## Monitoring and Maintenance

- CloudWatch integration for monitoring
- Automated backup systems
- Health checks and alerts
- Performance metrics tracking

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

Your Name - [@yourtwitter](https://twitter.com/yourtwitter)
Project Link: [https://github.com/yourusername/capstone-project](https://github.com/yourusername/capstone-project) 
