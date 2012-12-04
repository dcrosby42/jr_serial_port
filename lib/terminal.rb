require_relative 'jr_serial_port'

port_name = ARGV.shift || '/dev/ttyUSB0'
serial_port = JrSerialPort.new port_name, 19200, 8, 1, JrSerialPort::NONE

Thread.new do 
  while true do
    sleep 0.01
    print serial_port.read
  end
end

while true
  print "Prompt> "
  serial_port.write gets.strip
end
