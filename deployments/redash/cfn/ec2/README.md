Used pre-packed Ami from Redash, this can also be done by own setup (https://github.com/getredash/setup) on for example 
a arm-based processesor instance such as t4g.small to save maybe around 2-3 Euros more a month. 

costs:
- instance type t3a.small (2 GIB, EBS, 0,0204 USD (~0,0172 Euro) per hour eu-west-1)

purely subjective feeling of usage: sweet, fluently


1. Setup instance with:
`$ bash infra_do.sh create ursshkey2use`
bash infra_do.sh create sshkey2use
2. Open public ip of instance in Browser and create a admin user.

3. Update Stack to allow access from everywhere with:
`$ bash infra_do.sh update`
