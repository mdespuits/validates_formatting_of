# validates_formatting_of

The *validates_formatting_of" gem addess several convenient methods to validating things such as emails, urls, and phones in a Rails application.

# Installation

To install *validates_formatting_of*, add the following to your `Gemfile`:

    gem 'validates_formatting_of'

Then bundle install:

    bundle install

# Usage

Using validates_formatting_of is as simple as using Rails' built-in validation methods in models.

    class User < ActiveRecord::Base
      validates_formatting_of :email, :using => :email
    end

This call will ensure that the user-provided email is a valid email. This way, you will not need to find or write your own regex to validate. All of that logic is contained within `validates_formatting_of`

# Available Formatting Validations

`validates_formatting_of` has support for the following validations:

* Email
* URL
* Alpha-only
* Alphanumeric
* Credit Card (Visa, Mastercard, Discver, and American Express)
* US Zipcodes
* US Phone numbers
* IP Address