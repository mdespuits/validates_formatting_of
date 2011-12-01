# This file does all of the preloading. Little to no actual code should go in this file.

require "validates_formatting_of/version"
require "validates_formatting_of/validation_messages"
require "validates_formatting_of/validating_methods"
require "validates_formatting_of/model_additions"
require "validates_formatting_of/railtie" if defined? Rails
