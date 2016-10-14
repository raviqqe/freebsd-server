class Fossil < Struct.new(:port)
  def initialize(port=80)
    super
  end
end


task :fossil do
  on roles(:fossil) => :vannila do |server|
    pkg 'install fossil'

    Rc.configs :fossil, %W(
      enable=YES
      port=#{server.fossil.port}
      directory=/home/fossil
      listenall=YES
      user=fossil
      repolist=YES
    )

    service 'fossil restart'
  end
end
