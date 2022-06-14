terraform {
  required_providers {
    snowflake = {
      source  = "JBRUGOS/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "JBRUGOS"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "demo_db_two" {
  name    = "DEMO_DB_TWO"
  comment = "Database for Snowflake Terraform demo"
}
resource "snowflake_schema" "demo_schema_two" {
  database = snowflake_database.demo_db_two.name
  name     = "DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}

