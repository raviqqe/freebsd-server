task :make_conf do
  on fetch(:server) do
    as user: 'root' do
      execute :cp, %(#{File::join(fetch(:deploy_to), 'current/root/etc/make.conf')} \
                     /etc/make.conf)
    end
  end
end
