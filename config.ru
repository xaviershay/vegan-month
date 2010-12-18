class DefaultPage < Rack::Directory
  def call(env)
    path = env['PATH_INFO']

    if path =~ /\/$/ || !(path =~ /\..+$/)
      env['PATH_INFO'] = File.join(path, 'index.html')
    end

    super
  end
end

use Rack::Static, :urls => ["/images", "/fonts"], :root => "public"
run DefaultPage.new("public")
