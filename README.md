### EXTRA 8-step Explanation:

1. SSH into the Ubuntu instance.
2. Download Nginx packages on the Ubuntu instance.
3. Use `scp` to copy the private key from your laptop to the Ubuntu instance.
4. Use `scp` and the private key to copy the Nginx packages to the Amazon Linux instance.
5. SSH from the Ubuntu instance into the Amazon Linux instance and install Nginx.
