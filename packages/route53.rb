package :pythonpip do
  apt 'python-pip'
end

package :cli53 do
  runner 'pip install cli53', :sudo => true

  local_file = File.join(File.dirname(File.expand_path(__FILE__)),"..","config","boto.cfg")
  remote_file = '/etc/boto.cfg'
  transfer local_file, remote_file, :sudo => true do
    post :install, 'chmod 600 /etc/boto.cfg'
  end
end

package :route53 do
  requires :pythonpip
  requires :cli53

  local_file = File.join(File.dirname(File.expand_path(__FILE__)),"..","config","route53.cfg")
  remote_file = '/etc/route53/config'
  transfer local_file, remote_file, :sudo => true do
    pre :install, 'mkdir /etc/route53'
    pre :install, 'chmod 700 /etc/route53'
    post :install, 'chmod 600 /etc/route53/config'
  end

  runner 'wget https://raw.github.com/thedavidfoster/ec2-route53-setup/master/update-route53-dns.sh', :sudo => true do
    post :install, 'mv update-route53-dns.sh /usr/sbin/update-route53-dns'
    post :install, 'ln -s /usr/sbin/update-route53-dns /etc/dhcp/dhclient-exit-hooks.d/update-route53-dns'
  end

  verify do
    has_file remote_file
  end
end
