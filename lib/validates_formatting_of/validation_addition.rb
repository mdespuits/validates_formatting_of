require 'active_support/core_ext/object/blank'

module ValidatesFormattingOf

  class MissingValidation < StandardError
    def initialize(method)
      super("The validation method #{method.to_sym.inspect} has not been defined.")
    end
  end

  module ValidationAddition
    attr_reader :validations

    def add(name, regex, message = nil)
      @validations ||= {}
      @validations[name.to_s] = Validation.new(name.to_sym, regex, message)
    end

    def find(attribute, opts = {})
      method = opts.fetch(:using, attribute)
      raise MissingValidation.new(method) if missing? method
      @validations[method.to_s]
    end

    def missing?(name)
      !exists?(name)
    end

    def exists?(name)
      @validations[name.to_s].present?
    end
  end
end
