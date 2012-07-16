require 'simplecov'
SimpleCov.start

require 'validates_formatting_of'
require 'active_model'

class TestActiveRecord
  include ActiveModel::Validations
  include ActiveModel::Conversion

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
