#!/usr/bin/env ruby

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'src')

require 'single_word_generator.rb'
require 'link_generator.rb'
require 'text_generator.rb'

wordGenerator = SingleWordGenerator.new()
linkGenerator = LinkGenerator.new(wordGenerator)
textGenerator = TextGenerator.new(linkGenerator)
puts textGenerator.generate
