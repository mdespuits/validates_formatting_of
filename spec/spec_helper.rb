require 'simplecov'

if ENV["RUN_SIMPLECOV"] == 'true'
  SimpleCov.start do
    load_adapter 'test_frameworks'
  end
end

require 'validates_formatting_of'
require 'active_model'

class TestActiveRecord

  include ActiveModel::Validations
  include ValidatesFormattingOf::Validations
  extend ValidatesFormattingOf::ModelAdditions

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    @persisted = false
  end

  def save
    @persisted = true
  end

  def persisted?
    @persisted ||= false
  end

end
