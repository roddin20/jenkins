'Setup:

- Ensure that ansible is installed on your system
- Clone this repo to a valid working location
- Create a directory to hold your galaxy roles
    mkdir ~/.ansible_roles
- Add the line to ~/.ansible.cfg
    [defaults]
    roles_path = ~/.ansible_roles
    host_key_checking = False
- Pull the necessary galaxy roles:
    ansible-galaxy install -r galaxy_roles.yml --force


Running Ansible:

- 
