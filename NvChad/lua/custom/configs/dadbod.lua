vim.g.dbs = {
  kind = 'postgres://postgres:'.. os.getenv("PASS_POSTGRES_LOCAL") .. '@localhost:5432/postgres',
  dev = 'postgres://aguser:'.. os.getenv("PASS_POSTGRES_DEV") .. '@agdb.crcoashwhukc.us-east-1.rds.amazonaws.com:5432/agdb',
  customade = 'postgres://postgres:'.. os.getenv("PASS_POSTGRES_CMD") .. '@ag-db-prod.clyk7jconbz5.us-east-1.rds.amazonaws.com:5432/ag_db_prod',
  chanteclair = 'postgres://aguser:'.. os.getenv("PASS_POSTGRES_CHA") .. '@agdb.ckmllr0wqj0r.us-east-1.rds.amazonaws.com:5432/agdb'
}
