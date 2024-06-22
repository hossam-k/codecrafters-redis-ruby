require "socket"

class YourRedisServer
  def initialize(port)
    @port = port
  end

  def start
    # You can use print statements as follows for debugging, they'll be visible when running tests.
    puts("Logs from your program will appear here!")

    server = TCPServer.new(@port)
    client = server.accept

    while data = client.gets&.chomp do
      client.puts("+PONG\r\n") if data == 'PING'
    end
  end
end

YourRedisServer.new(6379).start
