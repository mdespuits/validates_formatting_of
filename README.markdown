# Validates Formatting Of

[![Build Status](https://secure.travis-ci.org/mattdbridges/validates_formatting_of.png)](http://travis-ci.org/mattdbridges/validates_formatting_of)
[![Dependency Status](https://gemnasium.com/mattdbridges/validates_formatting_of.png?travis)](https://gemnasium.com/mattdbridges/validates_formatting_of)

[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/mattdbridges/validates_formatting_of)

The `validates_formatting_of` gem adds several convenient methods to validate things such as emails, urls, and phone numbers in a Rails application.

# Unsupported versions

Please note that this gem takes advantage of regular expression features which are newer features in Ruby. Because of this, certain versions are not supported:

* 1.8.7
* Ruby Enterprise Edition (REE)

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

# Available Formatting Validations

`validates_formatting_of` has support for the following validations:

### Email

```ruby
class User < ActiveRecord::Base
  validates_formatting_of :email, :using => :email
end
```

**Note**: If you use `client_side_validations` then you need to use the following validation method:

```ruby
class User < ActiveRecord::Base
  validates_formatting_of :email, :using => :simple_email
end
```

### URL

```ruby
class Sites < ActiveRecord::Base
  validates_formatting_of :website, :using => :url
end
```

### Alpha

```ruby
class Name < ActiveRecord::Base
  validates_formatting_of :first_name, :using => :alpha
end
```

### Alphanumeric

```ruby
class Sites < ActiveRecord::Base
  validates_formatting_of :text, :using => :alphanum
end
```

### Credit Card (Visa, Mastercard, Discover, and American Express)

```ruby
class Purchases < ActiveRecord::Base
  validates_formatting_of :cc, :using => :credit_card
end
```

### US Zipcodes

```ruby
class Location < ActiveRecord::Base
  validates_formatting_of :zipcode, :using => :us_zip
end
```

### US Phone numbers

```ruby
class Phones < ActiveRecord::Base
  validates_formatting_of :phone, :using => :us_phone
end
```

### IPv4

```ruby
class Location < ActiveRecord::Base
  validates_formatting_of :ip, :using => :ip_address_v4
end
```

### Social Security Number

```ruby
class User < ActiveRecord::Base
  validates_formatting_of :ssn, :using => :ssn
end
```

### Hex Colors

```ruby
class Color < ActiveRecord::Base
  validates_formatting_of :color, :using => :hex_color
end
```

### Dollar Amount

```ruby
class Invoice < ActiveRecord::Base
  validates_formatting_of :amount, :using => :dollars
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

To add a simple regex validation, all that is necessary is to add a single line to the `Method` module in the `lib/method.rb` file (with a line or two of documentation explaining it's use).

For example:

```ruby
module Method
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
