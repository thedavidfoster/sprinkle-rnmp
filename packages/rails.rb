package :rails do
  requires :setup_rails_env_vars
  requires :bundler
  requires :execjs
  requires :sqlite
  requires :mysql_gem

  runner 'gem update --system', :sudo => true

  gem 'rails', :build_flags => '-pre'  
end

package :setup_rails_env_vars do
  rails_env = 'production'
  push_text 'RAILS_ENV="#{rails_env}"', '/etc/environment', :sudo => true
  push_text 'RACK_ENV="#{rails_env}"', '/etc/environment', :sudoe => true

  verify do
    file_contains '/etc/environment', 'RAILS_ENV'
  end
end

package :bundler do
  gem 'bundler'
end

package :execjs do
  gem 'execjs'
end

package :sqlite do
  apt %w(sqlite3 libsqlite3-dev)
  gem 'sqlite3-ruby'
end

package :mysql_gem do
  apt %w(libmysql-ruby libmysqlclient-dev)
  gem 'mysql2'
end