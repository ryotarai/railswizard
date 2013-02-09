require 'railswizard'

class Railswizard::Recipe
  attr_accessor :category
  attr_accessor :name
  attr_accessor :key
  attr_accessor :exclusive

  def initialize(opts={})
    @category  = opts[:category]
    @name      = opts[:name]
    @key       = opts[:key]
    @exclusive = opts[:exclusive]
  end

  def ==(other)
    @category  == other.category &&
    @name      == other.name &&
    @key       == other.key &&
    @exclusive == other.exclusive
  end

end
