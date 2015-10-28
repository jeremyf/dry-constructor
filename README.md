# dry-dependencies <a href="https://gitter.im/dryrb/chat" target="_blank">![Join the chat at https://gitter.im/dryrb/chat](https://badges.gitter.im/Join%20Chat.svg)</a>

<a href="https://rubygems.org/gems/dry-dependencies" target="_blank">![Gem Version](https://badge.fury.io/rb/dry-dependencies.svg)</a>
<a href="https://travis-ci.org/dryrb/dry-dependencies" target="_blank">![Build Status](https://travis-ci.org/dryrb/dry-dependencies.svg?branch=master)</a>
<a href="https://gemnasium.com/dryrb/dry-dependencies" target="_blank">![Dependency Status](https://gemnasium.com/dryrb/dry-dependencies.svg)</a>
<a href="https://codeclimate.com/github/dryrb/dry-dependencies" target="_blank">![Code Climate](https://codeclimate.com/github/dryrb/dry-dependencies/badges/gpa.svg)</a>
<a href="http://inch-ci.org/github/dryrb/dry-dependencies" target="_blank">![Documentation Status](http://inch-ci.org/github/dryrb/dry-dependencies.svg?branch=master&style=flat)</a>

A simple dependency injection macro for Plain Old Ruby Objects

## Synopsis

```ruby
class CreateUserController
  include Dry::Dependencies

  dependencies :response, :validator, :command
end

Response = Struct.new(:status) do
  def render(template, locals)
    @template, @locals = template, locals
  end
end

Validator = Struct.new(:params) do
  def validate(params)
    @params = params
  end
end

Command = Struct.new(:params) do
  def call(params)
    @params = params
  end
end

CreateUserController.new(Response.new, Validator.new, Command.new)
# => #<CreateUserController:0x007f733a807550
#      @response=#<struct Response status=nil>,
#      @validator=#<struct Validator params=nil>,
#      @command=#<struct Command params=nil>>
```

## License

See `LICENSE` file.
