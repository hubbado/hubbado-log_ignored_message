require 'configure'
require 'log'

class LogIgnoredMessage
  extend Configure::Macro
  include Log::Dependency

  configure :log_ignored_message

  def self.build
    new
  end

  def call(message, reason)
    logger.info(
      "#{message.message_type} #{message.metadata.global_position} ignored, #{reason}",
      tag: :ignored
    )
  end

  module Substitute
    def self.build
      LogIgnored.new
    end

    class LogIgnored
      def call(message, reason)
        invocations << [message, reason]
      end

      def called?
        invocations.any?
      end

      def called_with?(message, reason)
        invocations.include? [message, reason]
      end

      private

      def invocations
        @invocations ||= []
      end
    end
  end
end
