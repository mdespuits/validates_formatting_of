# Extend ActiveRecord's methods
module ValidatesFormattingOf
  class Railtie < Rails::Railtie
    initializer 'validates_formatting_of.model_additions' do
      ActiveSupport.on_load :active_record do
        extend ModelAdditions
      end
    end

    initializer 'validates_formatting_of.validations' do
      ActiveSupport.on_load :active_record do
        include Validations
      end
    end
  end
end