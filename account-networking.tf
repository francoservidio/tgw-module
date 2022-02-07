resource "aws_ec2_transit_gateway" "tgw" {
  count = var.create_tgw ? 1 : 0

  description = var.tgw_gateway_description

  amazon_side_asn                 = var.tgw_amazon_side_asn
  auto_accept_shared_attachments  = var.tgw_auto_accept_shared_attachments
  default_route_table_association = var.tgw_default_route_table_association
  default_route_table_propagation = var.tgw_default_route_table_propagation
  dns_support                     = var.tgw_dns_support

  vpn_ecmp_support = var.tgw_vpn_ecmp_support
  tags             = var.tgw_tags
}

# Creates a Transit gateway route table and associates with the Transit Gateway
resource "aws_ec2_transit_gateway_route_table" "tgw_route_table" {
  for_each = var.tgw_tags_name_rt
  transit_gateway_id = aws_ec2_transit_gateway.tgw[0].id

  tags = {
    Name = each.key
  }
}
##########################
# Resource Access Manager
##########################
resource "aws_ram_resource_share" "tgw_ram" {
  count = var.create_tgw && var.share_tgw ? 1 : 0

  name                      = var.ram_name
  allow_external_principals = var.ram_allow_external_principals

  tags = {
      "Name" = var.ram_name
    }
}
resource "aws_ram_resource_association" "tgw_ram_association" {
  count = var.create_tgw && var.share_tgw ? 1 : 0

  resource_arn       = aws_ec2_transit_gateway.tgw[0].arn
  resource_share_arn = aws_ram_resource_share.tgw_ram[0].id
}
resource "aws_ram_resource_share_accepter" "this" {
  count = !var.create_tgw && var.share_tgw ? 1 : 0

  share_arn = var.ram_resource_share_arn
}


