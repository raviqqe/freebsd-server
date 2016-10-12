task :fossil do
  on roles(:fossil) => :vannila do
    as :root do
      %w(
        enable=YES
        port=80
        directory=/home/fossil
        listenall=YES
        user=fossil
        repolist=YES
      ).map do |config|
        execute :echo, %(fossil_#{config} >> /etc/rc.conf)
      end

      execute :service, 'fossil restart'
    end
  end
end
