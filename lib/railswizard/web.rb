require 'railswizard'
require 'faraday'
require 'nokogiri'

module Railswizard
class Web
  INDEX_URL = "http://railswizard.org/"
  TEMPLATE_URL = "http://railswizard.org/templates"

  def recipes
    doc = Nokogiri::HTML(Faraday.get(INDEX_URL).body)
    doc.css("ul.recipes li").map do |elm|
      recipe = Recipe.new
      recipe.category = elm.attributes['data-category'].value
      recipe.key = elm.attributes['data-name'].value
      recipe.name = elm.css('b').children.first.to_s
      recipe
    end
  end

end
end
