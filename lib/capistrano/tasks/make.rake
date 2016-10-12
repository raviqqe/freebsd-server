task :make_conf do
  on fetch(:server) do
    execute :pwd

    as 'root' do
      execute %(cd #{fetch(:deploy_to)} && cp root/etc/make.conf /etc/make.conf)
    end
  end
end
