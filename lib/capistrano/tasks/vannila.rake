task :vannila do
  on roles(:all) do |server|
    Rc.init

    Rc.print_lines %W(
      hostname=#{server.hostname}
      dumpdev=AUTO
      sshd_enable=YES
      ntpd_enable=YES
      powerd_enable=YES
    )
  end
end
