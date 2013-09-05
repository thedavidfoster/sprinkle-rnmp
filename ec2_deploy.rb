role :app, "<ec2 instance public address here>"
set :user, "ubuntu"
set :run_method, :sudo

policy :setup, :roles => :app do
  requires :route53
end
