output "ec2_transit_gateway_arn" {
    description = "EC2 Transit Gateway Amazon Resource Name (ARN)"
    value       = element(concat(aws_ec2_transit_gateway.tgw.*.arn, [""]), 0)
}
output "aws_ec2_transit_gateway_route_table" {
  description = "Identifier of the default association route table"
  value       = element(concat(aws_ec2_transit_gateway_route_table.tgw_route_table.[*].arn, [""]), 0)
}
output "ec2_transit_gateway_id" {
  description = "EC2 Transit Gateway identifier"
  value       = element(concat(aws_ec2_transit_gateway.tgw.*.id, [""]), 0)
}
output "ec2_transit_gateway_owner_id" {
  description = "Identifier of the AWS account that owns the EC2 Transit Gateway"
  value       = element(concat(aws_ec2_transit_gateway.tgw.*.owner_id, [""]), 0)
}
output "ec2_transit_gateway_route_table_default_association_route_table" {
  description = "Boolean whether this is the default association route table for the EC2 Transit Gateway"
  value       = element(concat(aws_ec2_transit_gateway_route_table.tgw_route_table.*.default_association_route_table, [""]), 0)
}
# aws_ram_resource_share
output "ram_resource_share_id" {
  description = "The Amazon Resource Name (ARN) of the resource share"
  value       = element(concat(aws_ram_resource_share.tgw_ram.*.id, [""]), 0)
}
