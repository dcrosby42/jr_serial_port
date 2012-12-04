#!/bin/bash

#
# Start an overly simple serial terminal
# Accepts the name of the serial port to connect to as an argument.
# The Java library path configured below is a relative path, so it's important
# to run this script from the project root.
#

# This is so Java can puck up on the native library, such as librxtxSerial.so:
export JRUBY_OPTS="-J-Djava.library.path=lib"

# ASSUMPTION: you've got jruby setup on your system, eg. via rvm, and you're
# running in 1.9 mode.  You may need to add --1.9 to JRUBY_OPTS if you're not
# using JRuby 1.7.0 or newer.
jruby lib/terminal.rb $@
