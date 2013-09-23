require 'active_support/core_ext/hash/reverse_merge'
require 'active_support/core_ext/string'
require 'active_support/concern'
require 'active_model/validator'
require 'active_model/validations'


module ValidatesFormattingOf
  module Validations
    class Validator < ActiveModel::Validations::FormatValidator
      def initialize(options = {}, format = nil)
        return if format.blank?

        validation = Method.find(nil, :using => format)
        options.reverse_merge!(:with => validation.regex, :message => validation.message)
        super options
      end
    end

    Method.validations.each do |key, value|
      class_eval <<-RUBY_EVAL, __FILE__, __LINE__ + 1
        class #{key.to_s.camelize}Validator < Validator
          def initialize(options = {})
            super options, #{key.to_sym.inspect}
          end
        end
      RUBY_EVAL
    end
  end
end
