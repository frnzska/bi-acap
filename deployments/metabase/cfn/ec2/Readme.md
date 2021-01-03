Infa for Metabase instance with Athena [Driver](https://github.com/dacort/metabase-athena-driver).



Setup instance with: 

1. `$ bash infra_do.sh create sshkey2use`

2. Get public ip of instance, connect via Browser http://public-ip:3000 and create a admin user.

3. Update Stack to allow access from everywhere with: `$ bash infra_do.sh update`