#pptpd Cookbook
==============
This cookbook to setup a pptp based VPN Server.

Requirements
------------
#####Operating System

* Ubuntu


Attributes
----------
#### pptpd::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['pptpd']['users']</tt></td>
    <td>Array</td>
    <td>Username and password</td>
    <td>[{username: "user",password: "password"}]</td>
  </tr>
  <tr>
    <td><tt>['pptpd']['dns']</tt></td>
    <td>Array</td>
    <td>Dns ipaddress</td>
    <td><tt>["8.8.8.8","8.8.4.4"]</tt></td>
  </tr>
  <tr>
    <td><tt>['pptpd']['localip']</tt></td>
    <td>String</td>
    <td>IP address of the machine</td>
    <td><tt>10.0.0.1</tt></td>
  </tr>
  <tr>
    <td><tt>['pptpd']['remoteip']</tt></td>
    <td>String</td>
    <td>Network range</td>
    <td><tt>10.0.0.100-200</tt></td>
  </tr>
</table>

Usage
-----
A detailed rundown on using this cookbook is available on my [Website](http://surajms.com/2015/02/install-pptpd-server-without-a-hitch/).

####Librarian-chef
Add this to your Cheffile

```
cookbook 'pptpd', github: 'h0lyalg0rithm/pptpd'

```
Run `librarian-chef install` to download the cookbooks.

Just include `pptpd` in your node's `run_list`:

```
{
  "name":"my_node",
  "run_list": [
    "recipe[pptpd]"
  ]
}
```
  
Add you own user name recommended

```
{
  "name":"my_node",
  "run_list": [
    "recipe[pptpd]"
  ],
  "pptpd":{
  	"users":[{
	  	"username": "<Your username>",
	  	"password": "<Your password>"
	  }]
  }
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: [Suraj Shirvankar](http:surajms.com)
