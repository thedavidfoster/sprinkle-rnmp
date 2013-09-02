role :app, "127.0.0.1"
set :user, "vagrant"
set :run_method, :sudo
ssh_options[:keys] = ["~/.vagrant.d/insecure_private_key"]
ssh_options[:port] = 2222
