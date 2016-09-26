Setting up terraform for remote state information

- Clone this repo to your local machine
- From this directory run:
    terraform remote config -backend=s3 -backend-config="bucket=rrusso-terraform-remote-state" -backend-config="key=tf/sandbox/us-east-1.tf" -backend-config="region=us-east-1"
