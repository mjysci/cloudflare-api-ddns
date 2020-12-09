Cloudflare API v4 Dynamic DNS Update in Bash, without unnecessary requests  
Now the script also supports v6(AAAA DDNS Recoards)  
  
# Usage 
```
cf-ddns.sh -k cloudflare-api-token \
           -h host.example.com \     # fqdn of the record you want to update
           -z example.com \          # will show you all zones if forgot, but you need this
           -t A|AAAA                 # specify ipv4/ipv6, default: ipv4
```
You need an [API Token](https://dash.cloudflare.com/profile/api-tokens) that have read access to `Zone.Zone`, and write access to `Zone.DNS`.
  
# Feature
- Use API Token instead of Global API key  
- Support OpenWrt