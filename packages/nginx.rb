package :nginx, :provides => :webserver do
  description "Nginx installed by passenger gem"
  requires :passenger

  runner "wget http://library.linode.com/assets/660-init-deb.sh", :sudo => true do
    post :install, "mv 660-init-deb.sh init-deb.sh"
    post :install, "cat init-deb.sh | sed 's:/opt/:/opt/:' > nginx"
    post :install, "rm init-deb.sh"
    post :install, "mv nginx /etc/init.d/nginx"
    post :install, "chmod +x /etc/init.d/nginx"
    post :install, "/usr/sbin/update-rc.d -f nginx defaults"
  end

  runner "wget https://gist.github.com/clayton/6527445/raw/112f50b5f8eae72c9a17092bcab0d12748a401a2/gistfile1.txt", :sudo => true do
    post :install, "mv gistfile1.txt /etc/logrotate.d/nginx"
  end

  verify do
    has_executable "/opt/nginx/sbin/nginx"
    has_file "/etc/init.d/nginx"
  end
end

package :passenger, :provides => :appserver do
  description 'Phusion Passenger (mod_rails)'

  gem 'passenger' do
    # Install nginx and the module
    post :install, "sudo passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx"
  end

  verify do
    has_gem "passenger"
  end
end
