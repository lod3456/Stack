resource "aws_route53_health_check" "health_check" {
  type             = "HTTP"
  resource_path    = "/"
  fqdn             = "your-application-domain.com"
  failure_threshold = 3
  request_interval  = 30
}

resource "aws_route53_traffic_policy" "policy" {
  name     = "weighted-traffic-policy"
  document = <<EOF
{
  "DNSConfig": {
    "type": "weighted",
    "weightedTargets": [
      {
        "weight": 50,
        "healthCheckId": "${aws_route53_health_check.health_check.id}",
        "region": "us-east-1"
      },
      {
        "weight": 50,
        "healthCheckId": "${aws_route53_health_check.health_check.id}",
        "region": "us-west-2"
      }
    ]
  }
}
EOF
}
