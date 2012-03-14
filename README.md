# SimpleCov Multi

Provide a simple formatter which contains multiple formatters. Similar to the explanation on the SimpleCov README file about using multiple formatters.

## Installation

Add this line to your application's Gemfile:

    gem 'simplecov-multi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simplecov-multi

## Usage

In your `spec_helper`, be sure to set the SimpleCov formatter as the Multi wrapper:

```ruby
require 'simplecov'
require 'simplecov-multi'
multi = SimpleCov::Formatter::MultiFormatter.new
multi << SimpleCov::Formatter::HTMLFormatter.new
multi << SimpleCov::Formatter::SomeOtherFormatter.new
# ... etc
SimpleCov.formatter = multi
SimpleCov.start
```

## Author

This formatter was created by [BJ Neilsen](http://twitter.com/localshred). Hopefully it's useful to you.