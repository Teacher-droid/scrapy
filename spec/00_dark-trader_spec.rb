# je sollicite le fichier dark-trader
require_relative "../lib/dark-trader"

require 'nokogiri'
require 'open-uri'


# je teste la génération d'un hash contenant les deux tableaux de nom et de valeur
describe "make_hash method, it should return a hash with both arrays" do
  it "Wrong type" do
    expect(make_hash("","")).to eq(nil)
  end
end

# je teste la récupération d'un url pour renvoyer un html
describe "open_url method, takes a url, return the html" do
  it "TEST empty url" do
    expect(open_url("")).to eq(nil)
  end
  it "TEST good url" do
    expect(open_url("https://www.google.com/")).to be_kind_of(Nokogiri::HTML::Document)
  end
end
