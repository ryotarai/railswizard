require 'railswizard'

class Railswizard::Recipe
  attr_accessor :category
  attr_accessor :name
  attr_accessor :key

  def initialize(opts={})
    @category = opts[:category]
    @name = opts[:name]
    @key = opts[:key]
  end

  def ==(other)
    @category == other.category &&
    @name     == other.name &&
    @key      == other.key
  end

end
