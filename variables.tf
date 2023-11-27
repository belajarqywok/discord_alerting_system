# Region
variable "region" {
  type = string
  default = "asia-southeast2"
  description = "Region <type: String>"
}

# Zone
variable "zone" {
  type = string
  default = "asia-southeast2-a"
  description = "Zone <type: String>"
}

# Project ID
variable "project_id" {
  type = string
  default = "petdoc-capstone-project"
  description = "Project ID <type: String>"
}


# Discord Bot Name
variable "discord_bot_name" {
  type = string
  default = "Mamank Garox"
  description = "Discord Bot Name <type: String>"
}

# Discord Bot Avatar
variable "discord_bot_avatar" {
  type = string
  default = "https://qph.cf2.quoracdn.net/main-qimg-c2108cee7b7917f80d8f6182a7a0a8ee-lq"
  description = "Discord Bot Avatar <type: String>"
}

# Discord ID (SENSITIVE)
variable "discord_id" {
  type = string
  sensitive = true
  description = "Discord ID <type: String>"
}

# Discord Token (SENSITIVE)
variable "discord_token" {
  type = string
  sensitive = true
  description = "Discord Token <type: String>"
}

# Discord Team Tag
variable "discord_team_tag" {
  type = string
  default = "@everyone \n@Cloud Engineer \n@ML Engineer \n@Mobile Engineer "
  description = "Discord Team Tag <type: String>"
}
