require_relative "./automated_init"

context "LogIgnoredMessage" do
  message = LogIgnoredMessage::Controls::Message.example
  reason = LogIgnoredMessage::Controls::Reason.example
  message_type = message.message_type
  global_position = message.metadata.global_position

  log_ignored_message = LogIgnoredMessage.new

  log_ignored_message.logger = Log::Substitute.build.tap do |logger|
    logger.level = :info
    logger.tags = [:ignored]
  end
  logger = log_ignored_message.logger

  log_ignored_message.(message, reason)

  logger.telemetry_sink.logged_records.tap do |logged_records|
    test 'logs one message' do
      assert logged_records.size == 1
    end

    test 'logs correct message' do
      logged_message = logged_records.first.data.message

      assert logged_message == "#{message_type} #{global_position} ignored, #{reason}"
    end
  end
end
