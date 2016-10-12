task :vannila do
  on roles(:all) do |server|
    as :root do
      execute :echo, '>> /etc/rc.conf'

      %W(
        hostname=#{server.hostname}
        dumpdev=AUTO
        sshd_enable=YES
        ntpd_enable=YES
        powerd_enable=YES
      ).map do |config|
        execute :echo, %(#{config} >> /etc/rc.conf)
      end
    end
  end
end
