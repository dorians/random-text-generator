# encoding: UTF-8

require "rubygems"
require "nokogiri"
require "open-uri"
require "addressable/uri"

class LinkGenerator
  GOOGLE_QUERY_URL = "http://www.google.pl/search?hl=pl&q="

  def initialize(single_word_generator)
    @single_word_generator = single_word_generator
  end

  def generate
    loop do
      word = @single_word_generator.generate

      google_search_html = Nokogiri::HTML(open(GOOGLE_QUERY_URL + URI::encode(word)))
      links = google_search_html.css('#center_col h3[class=r]>a').map do |tag| 
        uri = Addressable::URI.new
        uri.query = tag['href'][5..-1]
        uri.query_values['q']
      end

      links = links.select do |link|
        link !~ /\.(doc|jpg|jpeg|gif|pdf)$/ and link =~ /\.pl(\/|$)/
      end

      next if links.length == 0

      return links.sample
    end
  end
end
