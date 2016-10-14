task :git do
  on roles(:git) => :vannila do
    pkg 'install git'

    Rc.configs :git_daemon, [
      'enable=YES',
      'directory=/home/git',
      'flags="--syslog --reuseaddr --detach"',
    ]

    service 'git_daemon restart'
  end
end
