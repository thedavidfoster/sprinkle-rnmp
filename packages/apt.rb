package :apt_base do
  apt 'build-essential' do
    pre :install, 'apt-get update'
  end
end

package :goodstuff do
  noop do
    pre :install, "sed -i -e 's/^#PS1=/PS1=/' /root/.bashrc" # enable the colorful root bash prompt 
    pre :install,  %(sed -i -e "s/^#alias ll='ls -l'/alias ll='ls -al'/" /root/.bashrc) # enable ll list long alias <3
  end
end

package :build_essentials do
  description 'Build tools'
  apt 'build-essential'
end

package :wget do
  apt 'wget'
end

package :vim do 
  apt 'vim'
end

package :less do 
  apt 'less'
end

package :htop do
  apt 'htop'
end

package :git do
  apt 'git-core'
end

package :logrotate do
  apt 'logrotate'
end