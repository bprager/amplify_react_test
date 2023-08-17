# main.tf

module "dynamodb" {
  source = "./dynamodb"
}

module "lambda" {
  source              = "./lambda"
  dynamodb_table_name = module.dynamodb.table_name
}
