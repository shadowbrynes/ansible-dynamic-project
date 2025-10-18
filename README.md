# Ansible Dynamic Project (Generated)

Contains roles for:
- Vault basics (vault password file)
- User management (create users, groups, authorized keys)
- Password authentication (enable SSH password auth)
- Jenkins installation
- Docker installation
- Nginx installation
- System preparation (update & upgrade)

## Usage (quick)
1. Create and activate Python venv:
   ```bash
   python3 -m venv ansible-env
   source ansible-env/bin/activate
   pip install -r requirements.txt
   ansible-galaxy collection install -r requirements.yml
   ```
2. Configure AWS credentials:
   ```bash
   aws configure
   ```
3. Verify dynamic inventory:
   ```bash
   ansible-inventory -i inventory_aws_ec2.yml --list
   ```
4. Run playbook (example):
   ```bash
   ansible-playbook -i inventory_aws_ec2.yml playbook.yml --private-key ~/Downloads/godwin01.pem
   ```

## Notes
- Vault password file created at `vault/vault_pass.txt` — change and secure it.
- You must ensure your keypair `godwin01.pem` is present locally at `~/Downloads/godwin01.pem` or update ansible.cfg.

## Git push helper
`push_to_github.sh` is included to help you initialize and push to GitHub.
