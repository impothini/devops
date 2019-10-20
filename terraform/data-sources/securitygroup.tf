data "aws_ip_ranges" "usa_ec2_instances" {
	regions = [ "us-east-1" ]
	services = [ "ec2" ]
}
resource "aws_security_group" "usa_traffic_only" {
	name="usa_traffic_only"
	ingress {
  		from_port       = 443
 		to_port         = 443
 		protocol        = "tcp"
  		cidr_blocks = ["99.166.69.161/32"]
	}
	tags = {
   		CreateDate = "${data.aws_ip_ranges.usa_ec2_instances.create_date}"
    		SyncToken  = "${data.aws_ip_ranges.usa_ec2_instances.sync_token}"
		name = "usa_traffic_only"
  		}
}
