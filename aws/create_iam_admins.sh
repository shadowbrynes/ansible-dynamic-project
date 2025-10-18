#!/bin/bash
# Create admin group, attach AdministratorAccess, create users, add to group, and create access keys.
set -e
GROUP_NAME="police-admins"
USERS=("devadmin" "opsadmin")

aws iam create-group --group-name "$GROUP_NAME" || true
aws iam attach-group-policy --group-name "$GROUP_NAME" --policy-arn arn:aws:iam::aws:policy/AdministratorAccess || true

for u in "${USERS[@]}"; do
  aws iam create-user --user-name "$u" || true
  aws iam add-user-to-group --user-name "$u" --group-name "$GROUP_NAME" || true
  # create login profile (console password) -- change password on first login
  aws iam create-login-profile --user-name "$u" --password 'ChangeMeNow123!' --password-reset-required || true
  # create programmatic access key (prints to stdout)
  aws iam create-access-key --user-name "$u" || true
done

echo "IAM group and users created/ensured. Review output for access keys and next steps."
