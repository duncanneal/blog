require 'erb'
require 'webrick'

ROOT = File.dirname(__FILE__)

server = WEBrick::HTTPServer.new(:Port => 8000, :DocumentRoot => "#{ROOT}/public")

server.mount_proc '/ice_cream' do |req, res|
  @page_title = "Blog_Page."
  template = ERB.new(File.read("#{ROOT}/index.html.erb"))
  res.body = template.result
end



trap 'INT' do
  server.shutdown
end

server.start