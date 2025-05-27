# Uber Clone Infrastructure

This directory contains the Terraform configuration for deploying the Uber Clone application infrastructure on AWS.

## Infrastructure Overview

The infrastructure is organized into three environments:
- Development (dev)
- Staging (staging)
- Production (prod)

Each environment includes:
- VPC with public and private subnets
- RDS MySQL database
- EC2 instances in an Auto Scaling Group
- Security groups and IAM roles
- KMS encryption

## Resource Planning (Development Environment)

### Resource Breakdown

| Resource Category | Resource Type | Quantity | Specifications | Free Tier Eligible |
|------------------|---------------|-----------|----------------|-------------------|
| **Networking** |
| VPC | 1 | 1 | CIDR: 10.0.0.0/16 | Yes |
| Public Subnets | 2 | 2 | One per AZ (ap-south-1a, ap-south-1b) | Yes |
| Private Subnets | 2 | 2 | One per AZ (ap-south-1a, ap-south-1b) | Yes |
| Internet Gateway | 1 | 1 | Attached to VPC | Yes |
| NAT Gateway | 1 | 1 | For private subnet internet access | No |
| Route Tables | 2 | 2 | Public and Private | Yes |
| **Database** |
| RDS Instance | 1 | 1 | db.t3.micro | Yes |
| Storage | 20 GB | 1 | Allocated storage | Yes |
| **Compute** |
| EC2 Instances | 1-2 | Variable | t2.micro | Yes |
| Auto Scaling Group | 1 | 1 | Min: 1, Max: 2, Desired: 1 | Yes |
| **Security** |
| Security Groups | 3 | 3 | VPC, RDS, EC2 | Yes |
| IAM Role | 1 | 1 | EC2 instance profile | Yes |
| KMS Key | 1 | 1 | For encryption | Yes |
| **Load Balancer** |
| Application Load Balancer | 1 | 1 | Internet-facing | No |

### Cost Considerations

1. **Free Tier Eligible Resources:**
   - t2.micro EC2 instances (750 hours/month)
   - db.t3.micro RDS instance (750 hours/month)
   - 20GB RDS storage
   - Basic networking components

2. **Non-Free Tier Resources:**
   - NAT Gateway (approximately $0.045 per hour)
   - Application Load Balancer (approximately $16.20 per month)
   - Additional EC2 instances beyond free tier
   - Additional RDS storage beyond free tier

### Monthly Cost Estimate
- Free Tier: $0 (for first 12 months)
- After Free Tier: ~$20-25/month (estimated)

### Resource Limits
1. VPC: 5 per region (well within limits)
2. EC2: 20 instances per region (well within limits)
3. RDS: 40 instances per region (well within limits)
4. Security Groups: 2500 per region (well within limits)

## Prerequisites

1. Install required tools:
   - Terraform (>= 1.0.0)
   - AWS CLI
   - Bash shell (for scripts)

2. Configure AWS credentials:
   ```bash
   aws configure
   ```

3. Create EC2 key pairs:
   - dev-key
   - staging-key
   - prod-key

## Directory Structure

```
terraform/
├── environments/
│   ├── dev/
│   ├── staging/
│   └── prod/
├── modules/
│   ├── networking/
│   ├── database/
│   ├── compute/
│   └── security/
├── scripts/
│   ├── init.sh
│   └── deploy.sh
└── versions.tf
```

## Deployment

### Initialization

1. Make scripts executable:
   ```bash
   chmod +x scripts/*.sh
   ```

2. Initialize Terraform:
   ```bash
   ./scripts/init.sh dev
   ```

### Deployment

1. Deploy to an environment:
   ```bash
   ./scripts/deploy.sh dev
   ```

2. Review the plan and confirm deployment.

## Environment-Specific Configurations

### Development
- Single AZ deployment
- Minimal resources
- Suitable for testing

### Staging
- Two AZ deployment
- Mirrors production setup
- Used for pre-production testing

### Production
- Three AZ deployment
- Enhanced security
- High availability configuration

## Security Notes

1. Change default passwords in terraform.tfvars
2. Use AWS Secrets Manager for sensitive data
3. Regularly rotate access keys
4. Monitor AWS CloudTrail logs

## Maintenance

1. Regular updates:
   - AMI updates
   - Security patches
   - Terraform version updates

2. Backup procedures:
   - RDS snapshots
   - EBS snapshots
   - Configuration backups

## Troubleshooting

Common issues and solutions:
1. Permission denied: Check AWS credentials
2. State lock: Check for concurrent operations
3. Resource limits: Check AWS service quotas

## Contributing

1. Follow the branching strategy
2. Update documentation
3. Test changes in dev environment
4. Submit pull requests

## License

[Your License Here] 