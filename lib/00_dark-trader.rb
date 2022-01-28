require_relative gem 'nokogiri'

require 'nokogiri'
require 'open-uri'
require 'pry'
require 'rubocop'
require 'rspec'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"


def gather_crypto_names(page)
  array_names = []
  crypto_names = page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody//td[2]/div/a[2]')
  crypto_names.each do |counter|
    array_names << counter.text
  end
  return array_names
end

def gather_crypto_values(page)
  array_values = []
  crypto_values = page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[@class="cmc-table-row"]/td[5]/div/a/span')
  crypto_values.each do |counter|
    array_values << counter.text.delete("$,").to_f
  end
  return array_values
end

def merge_arrays(array_names, array_values)
  final_hash = Hash[array_names.zip(array_values)]
end

def perform
  page = Nokogiri::HTML(URI.open(PAGE_URL).read)
  array_names = gather_crypto_names(page)
  array_values = gather_crypto_values(page)
  final_hash = merge_arrays(array_names, array_values)
  puts final_hash
end

