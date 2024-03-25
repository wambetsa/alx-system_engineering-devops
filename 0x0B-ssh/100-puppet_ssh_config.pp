#!/usr/bin/env bash
# Setting up my client config file

exec { 'echo "PasswordAuthentication no\nIdentityFile ~/.ssh/school" >> /etc/ssh/ssh_config':
        path    => '/bin/'
}

