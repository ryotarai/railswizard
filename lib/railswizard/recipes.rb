require 'railswizard'
require 'forwardable'

module Railswizard
class Recipes
  extend Forwardable

  class << self
    def from_given_recipes(given_recipes)
      all_recipes = Web.new.recipes
      Recipes.new(given_recipes.map do |given_recipe|
        matched = all_recipes.select{|r| r.match_to_given?(given_recipe)}
        raise "No recipe named #{given_recipe}" if matched.empty?
        matched.first
      end)
    end
  end

  attr_accessor :array

  def_delegators :@array, :each, :select, :any?

  def initialize(array=[])
    @array = array
  end

  def ==(other)
    @array == other.array
  end

  def template_url
    Web.new.template_url(self)
  end

  def rails_new_option
    option = ""
    option += " -O" if any?{|r|r.exclusive == "orm"}
    option += " -T" if any?{|r|r.exclusive == "unit_testing"}
    option += " -J" if any?{|r|r.exclusive == "javascript_framework"}
    option
  end
end
end
