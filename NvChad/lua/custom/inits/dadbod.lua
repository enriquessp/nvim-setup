local getDatabasePass = function (env)
  local handle = io.popen("pass show agentguru/dbs/"..env)
  local pass_dev = handle:read("*a")
  handle:close()
  return pass_dev
end

vim.g.dbs = {
  kind = 'postgres://postgres:'.. getDatabasePass("local") .. '@localhost:5432/postgres',
  dev = 'postgres://aguser:'.. getDatabasePass("dev") .. '@agdb.crcoashwhukc.us-east-1.rds.amazonaws.com:5432/agdb',
  customade = 'postgres://postgres:'.. getDatabasePass("customade") .. '@ag-db-prod.clyk7jconbz5.us-east-1.rds.amazonaws.com:5432/ag_db_prod',
  chanteclair = 'postgres://aguser:'.. getDatabasePass("chanteclair") .. '@agdb.ckmllr0wqj0r.us-east-1.rds.amazonaws.com:5432/agdb'
}
