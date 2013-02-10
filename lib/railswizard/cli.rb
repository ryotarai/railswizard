require 'railswizard'
require 'thor'
require 'terminal-table'

module Railswizard
class Cli < Thor
  SORT_ENUM = ['name', 'key', 'category']

  desc "list", "list available recipes"
  method_option :sort, aliases: "-s", type: :string, banner: "(#{SORT_ENUM.join('|')})"
  def list
    raise "Invalid sort param" unless (SORT_ENUM + [nil]).include?(options[:sort])

    table = Terminal::Table.new
    table << ["Name", "Key", "Category"]
    table << :separator

    w = Web.new
    recipes = w.recipes
    recipes.sort_by_name! if options[:sort] == 'name'
    recipes.sort_by_key! if options[:sort] == 'key'
    recipes.sort_by_category! if options[:sort] == 'category'
    recipes.each do |recipe|
      table << [recipe.name, recipe.key, recipe.category]
    end

    puts table
  end

  desc "template RECIPE(name or key) [RECIPE ...]", "show template url"
  def template(*given_recipes)
    recipes = Recipes.from_given_recipes(given_recipes)
    puts recipes.template_url
  end

  desc "new APP_NAME RECIPE(name or key) [RECIPE ...]", "create a new rails app"
  def new(app_name, *given_recipes)
    recipes = Recipes.from_given_recipes(given_recipes)
    exec "rails new #{app_name} -m #{recipes.template_url} #{recipes.rails_new_option}"
  end

end
end
