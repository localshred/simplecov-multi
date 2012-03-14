require 'minitest/spec'
require 'minitest/autorun'
require 'simplecov-multi'

class BaseFormatter
  def format(result)
    result << '%s#format' % [self.class.name]
  end
end
class FormatterOne < BaseFormatter; end
class FormatterTwo < BaseFormatter; end
class FormatterThree < BaseFormatter; end

describe SimpleCov::Formatter::MultiFormatter do
  describe '.new' do
    it 'creates an empty formatter list' do
      multi = SimpleCov::Formatter::MultiFormatter.new
      multi.formatters.must_be_instance_of(Array)
      multi.formatters.must_be_empty
    end
  end
  
  describe '#format' do
    it 'responds to #format' do
      SimpleCov::Formatter::MultiFormatter.new.must_respond_to(:format)
    end
    
    it 'calls #format on each appended formatter' do
      one = FormatterOne.new
      two = FormatterTwo.new
      three = FormatterThree.new
      
      multi = SimpleCov::Formatter::MultiFormatter.new
      multi << one
      multi << two
      multi << three
      
      result = ["result obj"]
      multi.format(result)
      result.must_equal([
        "result obj",
        'FormatterOne#format',
        'FormatterTwo#format',
        'FormatterThree#format',
      ])
    end
  end
  
  describe '#<<' do
    it 'appends given formatter onto formatters list' do
      one = FormatterOne.new
      two = FormatterTwo.new
      three = FormatterThree.new
      
      multi = SimpleCov::Formatter::MultiFormatter.new
      multi.formatters.must_be_empty
      multi << one
      multi << two
      multi << three
      multi.formatters.count.must_equal(3)
    end
    
    it 'raises an error if the formatter does not respond to #format' do
      class BogusFormatter; end
      multi = SimpleCov::Formatter::MultiFormatter.new
      puts *(lambda {}.methods.grep(/must_/))
      lambda { multi << BogusFormatter }.must_raise(/Formatter does not respond to `format` method/)
    end
  end
end