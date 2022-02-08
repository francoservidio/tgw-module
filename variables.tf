variable "create_tgw" {
  description = "Create a transit gateway or not"
  default     = false
}
variable "tgw_gateway_description" {
  description = "Description of the Gateway"
  default     = ""
}
variable "tgw_amazon_side_asn" {
  description = "ASN of AWS Side of a BGP Session"
  default     = "64512"
}
variable "tgw_auto_accept_shared_attachments" {
  description = "Whether resource requests are automatically accepted"
  default     = "disable"
}
variable "tgw_default_route_table_association" {
  description = "Whether resource attachments are automatically associated with the default association route table"
  default     = "disable"
}
variable "tgw_default_route_table_propagation" {
  description = "Whether resource attachments automatically propagate routes to the default propagation route table"
  default     = "disable"
}
variable "tgw_dns_support" {
  description = "Whether DNS support is enabled"
  default     = "enable"
}
variable "tgw_vpn_ecmp_support" {
  description = "Whether VPN Equal Cost Multipath protocol is enabled"
  default     = "disable"
}
variable "tgw_tags" {
  description = "Key Value Tags for the EC2 Transit Gateway"
  default     = {}

  type = map(string)
}
variable "tgw_tags_name_rt" {
  description = "Name Tag for the EC2 Transit Gateway Route Table"
  default     = []
}
variable "share_tgw" {
  description = "Whether to share your transit gateway with other accounts"
  type        = bool
  default     = false
}
variable "ram_name" {
  description = "The name of the resource share of TGW"
  type        = string
  default     = ""
}
variable "ram_allow_external_principals" {
  description = "Indicates whether principals outside your organization can be associated with a resource share."
  type        = bool
  default     = false
}
variable "ram_resource_share_arn" {
  description = "ARN of RAM resource share"
  type        = string
  default     = ""
}
variable "ram_principals" {
  description = "The principal to associate with the resource share"
  default     = []
}
variable "ram_principals_share_profile" {
  description = "The principal profile to assume role and accept invitation"
  default     = []
}
