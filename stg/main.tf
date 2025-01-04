terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "tetran"

    workspaces {
      name = "gh-tfc-sf_stg"
    }
  }
}

provider "snowflake" {
  password = var.SNOWFLAKE_PRIVATE_KEY
}

variable "SNOWFLAKE_PRIVATE_KEY" {
  description = "Private key for Snowflake"
  type        = string
  sensitive   = true
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_database" "demo_db2" {
  name    = "DEMO_DB2"
  comment = "Database for Snowflake Terraform demo2"
}

