sprinkle-rnmp
=============

Sprinkle scripts for setting up ec2, vagrant or Rackspace Cloud instance with rails, nginx, mysql and passenger.

Usage
-----

    gem install crafterm-sprinkle capistrano capistrano-ext
    sprinkle -s install.rb <ec2_deploy | vagrant_deploy>

Config
------

The *.example* files in the /config folder will have to be edited and renamed without the *.example* extension.

### boto.cfg

This file is used by the cli53 utility to update Route53.

### route53.cfg

This file is used by the route53 auto-update script that gets executed whenever the network is restarted on the instance.

### mysql_secure_install_no_ask

This is a script that is used to configure a secure install of mysql. The desired password for mysql's root will need to be added in this file. I borrowed this idea based on this [post](http://www.krautcomputing.com/blog/2012/08/22/how-to-install-and-secure-mysql-5-5-from-source-with-sprinkle/) by Manuel Meurer  and Manuel's [gists](https://gist.github.com/manuelmeurer/3325729).

Thanks
------

All of the Route53 config and setup was inspired from an [article](http://cantina.co/2012/01/25/automated-dns-for-aws-instances-using-route-53/) by David Fox.

The secure install and basic mysql config and setup was inpired and borrowed from Manuel Meurer [post](http://www.krautcomputing.com/blog/2012/08/22/how-to-install-and-secure-mysql-5-5-from-source-with-sprinkle/) and [gists](https://gist.github.com/manuelmeurer/3325729).

This [Sprinkle Cheatsheet](http://maxim.github.io/sprinkle-cheatsheet/) was invaluable.

These [sprinkle packages](https://github.com/trevorturk/sprinkle-packages) really helped to understand what was going on .
