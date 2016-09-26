app_name = "rrusso-jenkins"
profile = "sandbox"

region = "us-east-1"
availability_zones = [ "us-east-1b", "us-east-1c" ]

vpc_cidr = "10.200.0.0/16"
subnets = [ "10.200.0.0/20", "10.200.16.0/20" ]

ssh_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAn/+AvzYQJnsWHSISMu9c42b27Hdo47QYPUxw8H3IaX0Pkv/dgz4aTLXOqN4EvvKUDccjFaGWTlgGwdWPiTFhprCE4H3Q5vPO+5N6C/Z/65Sl1251mgdLs4fesHeXiPxwEkwmg43uH4bMJ1sPUXMZ1tuToxujHS5UQk2mOiiWNoLmf4sOZo+Ii4OktQdM8aicwjjEMOGHpb35GlZlxjLnoOImDHW8aqhsDev+V9TGpr5M2Abpya/phPGP/QH3YpFOV+qYR7SBr0Q1w8OfgkJPFwkHXSSHtG61Ncc/MEg2prWYkQ/XWHcwzxq/LgddCdR/nF4xXKDAEZdT9HS3U+ED"
