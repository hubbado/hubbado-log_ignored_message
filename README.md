# Log Ignored Message

Using evt-log to log that an Eventide Message has been logged

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hubbado-log-ignored-message'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hubbado-log-ignored-message

## Usage

Use it inside an Eventide handler to log when a messge has been ignored

```ruby
class SomeHandler
  dependency :log_ignored, LogIgnoredMessage

  def configure
    LogIgnoredMessage.configure(self)
  end

  handle SomeMessage do |some_message|
   ...
     if some_entity.already_processed?(some_message)
       log_ignored_message.(some_message, "already processed")

       return
     end
   ...
  end
end
```

This will call:

```ruby
logger.info(
  "SomeMessage #{some_message.metadata.global_position} ignored, " \
  "already processed",
  tag: :ignored
)
```
