#encoding: UTF-8

require "open-uri"
require 'nokogiri'

class TextGenerator
  def initialize(link_generator)
    @link_generator = link_generator
  end

  def generate
    loop do
      begin
        link = @link_generator.generate
        html = Nokogiri::HTML(open(link))

        html = html.css("body").first

        paragraphs = html.css("p").map do |paragraph|
          paragraph.text.gsub(/\s+/u, " ").strip
        end

        paragraphs = paragraphs.select do |paragraph|
          paragraph =~ /^[A-Z][ąęśżźółća-z]+ .* [ąęśżźółća-z]+\.$/ and paragraph.length > 160 and paragraph !~ /\.{2,}/
        end

        puts paragraphs
      rescue
      end
    end
  end
end

