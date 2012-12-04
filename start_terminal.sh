#!/bin/bash

export JRUBY_OPTS="-J-Djava.library.path=lib"
jruby lib/terminal.rb
