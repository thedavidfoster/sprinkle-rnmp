package :mysql_core, :provides => :database do
  description 'MySQL Database'

  apt %w(mysql-server mysql-client)
end

package :mysql_secure do
  description 'Secure MySQL Install'
  requires :mysql_core

  apt 'expect'

  local_file = File.join(File.expand_path(File.dirname(__FILE__)),'../../config/mysql_secure_install_no_ask')
  remote_file = '/usr/local/mysql/scripts/mysql_secure_install_no_ask'
  transfer local_file, remote_file, :sudo => true do
    pre :install, 'mkdir -p /usr/local/mysql/scripts'
    post :install, "chmod +x #{remote_file}"
    post :install, remote_file
  end
  verify do
    has_file remote_file
  end
end

package :mysql_tune do
  description 'Tuning for MySQL Database'
  percent_memory = '40'

  local_file = File.expand_path('../../config/mysql_tune.sh', __FILE__)
  remote_file = '/usr/local/mysql/scripts/mysql_tune.sh'
  transfer local_file, remote_file, :sudo => true do
    pre :install, 'mkdir -p /usr/local/mysql/scripts'
    post :install, "chmod +x #{remote_file}"
    post :install, "#{remote_file} #{percent_memory}"
  end
  verify do
    has_file remote_file
  end
end

