output "db_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.main.endpoint
}

output "db_name" {
  description = "The name of the database"
  value       = aws_db_instance.main.db_name
}

output "db_username" {
  description = "The master username for the database"
  value       = aws_db_instance.main.username
}

output "replica_endpoint" {
  description = "The connection endpoint for the RDS read replica (if exists)"
  value       = var.environment == "prod" ? aws_db_instance.replica[0].endpoint : null
} 