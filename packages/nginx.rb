package :nginx, :provides => :webserver do
  description "Nginx installed by passenger gem"
  requires :passenger
  
  runner "wget http://library.linode.com/assets/660-init-deb.sh", :sudo => true do
    post :install, "mv 660-init-deb.sh init-deb.sh"
    post :install, "cat init-deb.sh | sed 's:/opt/:/usr/local/:' > nginx"
    post :install, "rm init-deb.sh"
    post :install, "mv nginx /etc/init.d/nginx"
    post :install, "chmod +x /etc/init.d/nginx"
    post :install, "/usr/sbin/update-rc.d -f nginx defaults"
  end
  
  verify do
    has_executable "/usr/local/nginx/sbin/nginx"
    has_file "/etc/init.d/nginx"
  end
end

package :passenger, :provides => :appserver do
  description 'Phusion Passenger (mod_rails)'

  gem 'passenger' do    
    # Install nginx and the module
    post :install, "sudo passenger-install-nginx-module --auto --auto-download --prefix=/usr/local/nginx"
  end
    
  verify do
    has_gem "passenger"
  end
end