require_relative "../lib/crypto_scrapping"

require 'nokogiri'
require 'open-uri'



describe "make_hash method, it should return a hash with both arrays" do
  it "Wrong type" do
    expect(make_hash("","")).to eq(nil)
  end
end


describe "open_url method, takes a url, return the html" do
  it "TEST empty url" do
    expect(open_url("")).to eq(nil)
  end
  it "TEST good url" do
    expect(open_url("https://www.google.com/")).to be_kind_of(Nokogiri::HTML::Document)
  end
end
