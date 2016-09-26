Structure

- deployment: Contains orchestration start points across various accounts and regions
- modules: Contains the base calls out to the generic terraform modules for this application

Getting Started

- Clone this repository to your local machine
- Setup your AWS credentials file.  That file should contain a profile for each AWS account you want to manage.
    - ~/.aws/credentials:
        [profile_name]
        aws_access_key_id = XXXX
        aws_secret_access_key = XXXX
- Setup remote state for each deployment endpoint you wish to me able to manage (See README in the region directories)
