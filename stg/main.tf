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
  role        = "SYSADMIN"
  account     = var.SNOWFLAKE_ACCOUNT
  region      = var.SNOWFLAKE_REGION
  username    = var.SNOWFLAKE_USER
  private_key = var.SNOWFLAKE_PRIVATE_KEY
}
variable "SNOWFLAKE_ACCOUNT" {
  description = "Account ID for Snowflake"
  type        = string
}

variable "SNOWFLAKE_REGION" {
  description = "Region for Snowflake"
  type        = string
}

variable "SNOWFLAKE_USER" {
  description = "Username for Snowflake"
  type        = string
}

variable "SNOWFLAKE_PRIVATE_KEY" {
  description = "Private key for Snowflake"
  type        = string
  sensitive   = true
}

resource "snowflake_database" "demo_db2" {
  name    = "DEMO_DB2"
  comment = "Database for Snowflake Terraform demo2"
}

resource "snowflake_database" "demo_db3" {
  name    = "DEMO_DB3"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_database" "demo_db4" {
  name    = "DEMO_DB4"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_database" "demo_db5" {
  name    = "DEMO_DB5"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_database" "demo_db6" {
  name    = "DEMO_DB6"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_database" "demo_db7" {
  name    = "DEMO_DB7"
  comment = "Database for Snowflake Terraform demo"
}


