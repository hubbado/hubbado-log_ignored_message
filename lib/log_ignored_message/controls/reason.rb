class LogIgnoredMessage
  module Controls
    module Reason
      def self.example
        'already processed'
      end

      module Other
        def self.example
          'some other reason'
        end
      end
    end
  end
end
