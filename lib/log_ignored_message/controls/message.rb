class LogIgnoredMessage
  module Controls
    module Message
      def self.example
        Messaging::Controls::Message.example
      end

      module Other
        def self.example
          Messaging::Controls::Message.example(some_attribute: 'other')
        end
      end
    end
  end
end
