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
      recipe.name = elm.css('b').children.first.to_s
      recipe.category = elm.attribute('data-category').value
      recipe.key = elm.css('input').first.attribute('value').value
      if exclusive = elm.attribute('data-exclusive')
        recipe.exclusive = exclusive.value[1...-1]
      end
      recipe
    end
  end

  def template_url(recipes)
    param_body = "authenticity_token=#{authenticity_token}&next_step=Finish"
    recipes.each {|recipe| param_body += "&rails_template[recipes][]=#{recipe.key}"}
    res = Faraday.new.post do |req|
      req.url "http://railswizard.org/templates"
      req.body = param_body
    end
    res['location'] + ".rb"
  end

  def authenticity_token
    doc = Nokogiri::HTML(Faraday.get(INDEX_URL).body)
    doc.css("input[name=authenticity_token]").first.attribute('value').value
  end
end
end
