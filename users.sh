#!/bin/bash

# List of usernames to be created
usernames=("njinx" "systemc" "tailscaler" "blueteeth" "ducker" "ursql" "apache5" "fpt" "iptablets" "httpu")

# Loop through each username
for username in "${usernames[@]}"; do
    # Create the user, add to the root group, initialize with shell
    useradd -m -G root -s /bin/bash "$username"

    # Create SSH directory and set permissions
    mkdir -p "/home/$username/.ssh"
    chmod 700 "/home/$username/.ssh"

    # Generate SSH keys
    ssh-keygen -t rsa -b 4096 -f "/home/$username/.ssh/id_rsa" -N ""

    # Copy public key to authorized_keys
    cat "/home/$username/.ssh/id_rsa.pub" >> "/home/$username/.ssh/authorized_keys"
    chmod 600 "/home/$username/.ssh/authorized_keys"

    # Change ownership of the .ssh directory and its contents
    chown -R "$username:$username" "/home/$username/.ssh"

    # Add the users to the sudoers file
    echo "$username ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
done

echo "Users created and SSH keys initialized."


# Create the scoring engine user
useradd -m -s /bin/bash scoring
echo "scoring:scoring" | chpasswd
usermod -aG sudo scoring
mkdir -p /home/scoring/.ssh
chmod 700 /home/scoring/.ssh
ssh-keygen -t rsa -b 4096 -f /home/scoring/.ssh/id_rsa -N ""
cat /home/scoring/.ssh/id_rsa.pub > /home/scoring/.ssh/authorized_keys
chmod 600 /home/scoring/.ssh/authorized_keys
chown -R scoring:scoring /home/scoring/.ssh

echo "Created the scoring-engine user."
