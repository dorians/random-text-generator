# encoding: UTF-8

require "open-uri"
require 'nokogiri'

class SingleWordGenerator
  WIKIPEDIA_RANDOM_PAGE_URL = "http://pl.wikipedia.org/wiki/Specjalna:Losowa_strona"

  def generate
    loop do
      wiki_html = Nokogiri::HTML(open(WIKIPEDIA_RANDOM_PAGE_URL))
      sentences = wiki_html.css('p')

      words = sentences.to_s.scan(/[ąęśżźółćĄĘŚŻŹÓŁĆa-zA-Z]{6,}/)
      word = words.sample

      return word if word
    end
  end
end
