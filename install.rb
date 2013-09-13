Dir.glob(File.join(File.dirname(__FILE__), 'packages/*.rb')).each { |f| require f }
RECIPE = ARGV.first

policy :setup, :roles => :app do
  requires :apt_base
  requires :goodstuff
  requires :vim
  requires :htop
  requires :build_essentials
  requires :ruby
  requires :gem
  requires :nginx
  requires :mysql_secure
  requires :mysql_tune
  requires :git
  requires :htop
  requires :vim
end

deployment do
  delivery :capistrano do
    recipes "#{RECIPE}"
  end

  source do
    prefix '/usr/local'
    archives '/usr/local/sources'
    builds '/usr/local/build'
  end
end
