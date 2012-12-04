require 'java' 
require_relative 'RXTXcomm.jar'

import('gnu.io.CommPortIdentifier')
import('gnu.io.SerialPort') { 'GnuSerialPort' }

class JrSerialPort
  NONE = GnuSerialPort::PARITY_NONE

  def initialize name, baud, data, stop, parity
    port_id = CommPortIdentifier.get_port_identifier name
    data = GnuSerialPort.const_get "DATABITS_#{data}"
    stop = GnuSerialPort.const_get "STOPBITS_#{stop}"
    
    @port = port_id.open 'JRuby', 500
    @port.set_serial_port_params baud, data, stop, parity
    
    @in = @port.input_stream
    @in_io = @in.to_io
    @out = @port.output_stream
  end
  
  def close
    @port.close
  end

  def write(s)
    @out.write s.to_java_bytes
  end

  def read
    @in_io.read(@in.available) || ''
  end
end
