require 'validates_formatting_of'
require 'supermodel'

class SuperModel::Base
  include ActiveModel::Validations::Callbacks
  extend ValidatesFormattingOf::ModelAdditions
end