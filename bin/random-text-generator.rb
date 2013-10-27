require '../src/single_word_generator.rb'
require '../src/link_generator.rb'
require '../src/text_generator.rb'

wordGenerator = SingleWordGenerator.new()
linkGenerator = LinkGenerator.new(wordGenerator)
textGenerator = TextGenerator.new(linkGenerator)
puts textGenerator.generate
