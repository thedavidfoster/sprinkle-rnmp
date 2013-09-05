package :ruby do
  description "Ruby from Source"
  version '2.0.0-p247'
  source "ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-#{version}.tar.gz"
  requires :ruby_dependencies

  verify do
    has_executable_with_version 'ruby', '2.0.0p247', '-v'
  end
end

package :gem do
  requires :ruby
  description "Update Rubygems"
  runner 'gem update --system'
  runner 'gem install rake bundler'
  verify do
    has_executable 'gem'
    has_executable 'rake'
    has_executable 'bundler'
  end
end

package :ruby_dependencies do
  description "Ruby Build Dependencies"
  apt %w( zlib1g-dev libssl-dev libreadline6-dev openssh-server libyaml-dev libcurl4-openssl-dev libxslt-dev libxml2-dev)
end
