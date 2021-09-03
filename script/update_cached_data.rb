require 'open-uri'

# to update these urls, the easiest thing to do is go to site.js.coffee,
# change wikirateApiMode to "live", and then load the homepage while using browser
# dev tools to get the url.
#
# The brand_answers url will change whenever the code is changed to use different metrics.

urls = {
  brand_answers: "https://wikirate.org/Answer/compact.json?limit=0&filter%5Bcompany_group%5D=~7887730&filter%5Bmetric_id%5D%5B%5D=6126450&filter%5Bmetric_id%5D%5B%5D=5780639&filter%5Bmetric_id%5D%5B%5D=5990097&filter%5Bmetric_id%5D%5B%5D=7624093&filter%5Bmetric_id%5D%5B%5D=7616258&filter%5Bmetric_id%5D%5B%5D=7616271&filter%5Byear%5D=latest",
  brands: "https://wikirate.org/~7887730+Company.json?item=nucleus",
  sub_brands: "https://wikirate.org/~2929009+Relationship_Answer.json?limit=500&filter%5Bcompany_group%5D=~7887730&filter%5Byear%5D=latest"
}

urls.each do |name, url|
  path = File.expand_path "../build/content/#{name}.json", __dir__
  File.write path, URI.open(url).read
end
