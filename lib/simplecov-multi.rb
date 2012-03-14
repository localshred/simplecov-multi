require "simplecov-multi/version"

class SimpleCov::Formatter::MultiFormatter
  attr_reader :formatters
  
  def initialize
    @formatters = []
  end
  
  # Iterate through supplied formatters calling
  # their format methods and supplying the given result
  def format(result)
    @formatters.each do |formatter|
      formatter.format(result)
    end
  end
  
  # Append a new formatter
  def <<(formatter)
    unless formatter.respond_to?(:format)
      raise 'Formatter does not respond to `format` method'
    end
    @formatters << formatter
  end
end
