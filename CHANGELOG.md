## v0.4.2
* Dropped support for Ruby 1.8.7
* Dropped support for REE
* Updated email regex so that hosts/domains cannot start or end with hyphens.

## v0.4.1
* __Removed Ruby-specific Regex flags in email.__ This was breaking an implementation in another project which used the `client_side_validations` gem which pulled in the Regex directly from the model. As the `u` and `x` flags are not supported by javascript, this made `client_side_validations` entirely useless.

## v0.4.0

* Email and phone validations more flexible.
* Can now pass options such as `:if`, `:unless`, and `:on` to `validates_formatting_of`

## v0.3.7

* Bugfix in `:allow_nil` and `:allow_blank`

## v0.3.6

* Added a small mention of how to suggest validation patterns
* Added validation method for dollar amounts

## v0.3.5

* Quick release to fix Ruby environment bugs introduced in v0.3.4.

## v0.3.4

* Introduced default error messages.
* *Notice* This release did not work in all Ruby environments.

## v0.3.0 -- v0.3.1

* `:allow_nil` and `:allow_blank` validation options added
* gemspec modifications for better gem management
* More testing for custom messages and validations

## v0.2.1 -- v0.2.3

* Added several new methods and tests for validations.
* Fixed several spelling and English issues in the README.

## v0.2.0

* initial release
