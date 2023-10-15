# Creates Elastic cache cluster
resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "roboshop-{var.ENV}-redis"
  engine               = "redis"
  node_type            = "cache.t3.small"
  num_cache_nodes      = 1
  parameter_group_name = aws_elasticache_parameter_group.default.name
  subnet_group_name    = aws_elasticache_subnet_group.redis.name
  security_group_ids   = [aws_security_group.allows.redis.id] 
  engine_version       = "6.2"
  port                 = 6379
}

resource "aws_elasticache_parameter_group" "default" {
  name   = "roboshop-{var.ENV}-redis-pg"
  family = "redis6.2"
}

  



#resource "aws_docdb_cluster" "docdb" {
#  cluster_identifier      = "roboshop-${var.ENV}-docdb"
# engine                  = "docdb"
#  master_username         = "admin1"
#  master_password         = "roboshop1"
#  preferred_backup_window = "07:00-09:00"
#  skip_final_snapshot     = true                       # in a production value will be false
#  db_subnet_group_name    = aws_docdb_subnet_group.docdb.name
#  vpc_security_group_ids  = [aws_security_group.allows.docdb.id]
#}

# Creates DOCDB Instances and adds to the cluster
#resource "aws_docdb_cluster_instance" "cluster_instances" {
#  count              = 1
#  identifier         = "roboshop-${var.ENV}-docdb"
#  cluster_identifier = aws_docdb_cluster.docdb.id
#  instance_class     = "db.t3.medium"
#}

# Creates DocDB Subnet Group
#resource "aws_docdb_subne_group" "docdb" {
#  name       = "roboshop-${var.ENV}-docdb-subnet-group"
#  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS 

#  tags = {
#    Name = "roboshop-${var.ENV}-docdb-subnet-group"
#  }
#}

resource "aws_elasticache_subnet_group" "redis" {
  name         = roboshop-$(var.ENV)-redis-subnet-group
  subnet_ids   = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS
  tags = {
    Name = "roboshop-${var.ENV}-redis-subnet-group"
  }

}

