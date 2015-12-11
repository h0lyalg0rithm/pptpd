#Setup PPTP on your server
---
Make sure you have chef installed on your machine. [Chef](http://chef.io)

```
bundle install 
```
The edit the file created in the nodes folder.

- Change the <ipaddress> to the server ip address
- Change the <username>
- Change the <password>

Next run the following

```
knife solo bootstrap user@server_ip
```

This command show installed chef and configure a pptpd server on your machine.


