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
  account       = var.SNOWFLAKE_ACCOUNT
  region        = var.SNOWFLAKE_REGION
  username      = var.SNOWFLAKE_USER
  private_key   = var.SNOWFLAKE_PRIVATE_KEY
  authenticator = var.SNOWFLAKE_AUTHENTICATOR
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
variable "SNOWFLAKE_AUTHENTICATOR" {
  description = "Authenticator for Snowflake"
  type        = string
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_database" "demo_db2" {
  name    = "DEMO_DB2"
  comment = "Database for Snowflake Terraform demo2"
}

