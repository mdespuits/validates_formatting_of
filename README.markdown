[![Build Status](https://secure.travis-ci.org/mattdbridges/validates_formatting_of.png)](http://travis-ci.org/mattdbridges/validates_formatting_of)
[![Dependency Status](https://gemnasium.com/mattdbridges/validates_formatting_of.png?travis)](https://gemnasium.com/mattdbridges/validates_formatting_of)
[![Code Climate](https://codeclimate.com/github/mattdbridges/validates_formatting_of.png)](https://codeclimate.com/github/mattdbridges/validates_formatting_of)

# Validates Formatting Of

The `validates_formatting_of` gem adds several convenient methods to validate things such as emails, urls, and phone numbers in a Rails application.

# Supported Ruby Versions

* 1.9.3
* 2.0.0
* 2.1.0
* 2.2.0

# Installation

To install `validates_formatting_of`, add the following to your `Gemfile`:

    gem 'validates_formatting_of'

Then bundle install:

    bundle install

# Usage

Using `validates_formatting_of` is as simple as using Rails' built-in validation methods in models.

```ruby
class User < ActiveRecord::Base
  validates_formatting_of :email
end
```

If the name of the column is identical to the validation method you would use, it auto-selects that validation method. Thus, this is a shortcut for the following:

```ruby
class User < ActiveRecord::Base
  validates_formatting_of :email, :using => :email
end
```

This call will ensure that the user-provided email is a valid email. This way, you will not need to find or write your own regex to validate. All of that logic is contained within `validates_formatting_of`.

# Rails validation options still available

You can still add the following options when using `validates_formatting_of`:

* `:allow_nil`
* `:allow_blank`
* `:on`
* `:if`
* `:unless`
* You can also specify the `:message` option to use a custom validation message.

# Share your Validations

Say, for example, you have identical plain-old regex validations for different columns or even on different models entirely. You can easily alleviate this problem by simply adding the validation(s) in an initializer file.

While very unrealistic, these examples should serve their purpose in demonstrating this ability.

```ruby
# config/initializers/validates_formatting_of.rb
ValidatesFormattingOf::Method.add :loweralpha, /[a-z]/, "must be lowercase and no spaces"
ValidatesFormattingOf::Method.add :upperalpha, /[A-Z]/, "must be uppercase and no spaces"
ValidatesFormattingOf::Method.add :weak_password, /[a-zA-Z0-9]{8,}/, "must contain only letters and numbers and be at least 8 characters long".
```

Keep in mind, since this gem is only ActiveModel-dependent, you should be able to do this in whatever non-Rails application classes you have that include `ActiveModel::Validations` in some way (and that extend the `ValidatesFormattingOf::ModelAdditons` module).

# Built-in Validations

`validates_formatting_of` has the following built-in validations:

```ruby
class ExampleModel < ActiveRecord::Base
  validates_formatting_of :email, :using => :email      # Email
  validates_formatting_of :first_name, :using => :alpha # Letters
  validates_formatting_of :website, :using => :url      # URLs
  validates_formatting_of :text, :using => :alphanum    # Alpha-numeric
  validates_formatting_of :zipcode, :using => :us_zip   # US Zip Code
  validates_formatting_of :phone, :using => :us_phone   # US Phone Numbers
  validates_formatting_of :ip, :using => :ip_address_v4 # IPv4
  validates_formatting_of :ssn, :using => :ssn          # Social Security Numbers
  validates_formatting_of :color, :using => :hex_color  # Hexadecimal Colors
  validates_formatting_of :amount, :using => :dollars   # Dollars

  # Credit Card (Visa, Mastercard, Discover, and American Express)
  validates_formatting_of :cc, :using => :credit_card
end
```

**Note**: If you use `client_side_validations` then you need to use the following validation method:

```ruby
class User < ActiveRecord::Base
  validates_formatting_of :email, :using => :simple_email
end
```

### Plain Old Ruby Objects

If you are not using ActiveRecord or want to use it on some other type of object, this is the least you need to get validations running.

```ruby
class User
  include ActiveModel::Validations
  extend ValidatesFormattingOf::ModelAdditions

  attr_accessor :email

  validates_formatting_of :email, :using => :email
end
```

# Over-writable

If, for any reason, you want to overwrite the regex specified in the gem, you can using the `:with` option just like in ActiveModel's built-in `validates_format_of`.

```ruby
class Person < ActiveRecord::Base
  validates_formatting_of :first_name, :with => /[A-Z]/i
end
```

# Development and Contribution

To add a simple regex validation, all that is necessary is to add a single line to the `ValidatesFormattingOf::Method` module in the `lib/method.rb` file (with a line or two of documentation explaining it's use).

For example:

```ruby
module ValidatesFormattingOf::Method
  # This :validation_name method is for example purposes only.
  # You can use this in production, but it would require a value of 'example regex' to pass.
  add :validation_name, %r{example regex}iux, "is a message for validation method :validation_name"
end
```

1. Fork it
2. Make it awesome (with passing tests)
3. Create a new Pull Request.

# Have Ideas?

Do you use a particular pattern on a regular basis that isn't here or you would like to contribute? For now, [create a new issue](https://github.com/mattdbridges/validates_formatting_of/issues/new) in the issue tracker. I would be more than happy to consider adding it to the project.
