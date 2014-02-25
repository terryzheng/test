#!/home/dev/ruby

require 'webrick'
include WEBrick

s= HTTPServer.new(
:Port=>2000,
:DocumentRoot=>File.join(Dir.pwd,"/html")
)
class HelloServlet < HTTPServlet::AbstractServlet
def do_GET(req,resp)
resp.body="hello ruby server!"
end
def do_POST(req,resp)
do_GET(req,resp)
end
end
s.mount("/hello",HelloServlet)
trap("INT"){s.shutdown}
s.start
