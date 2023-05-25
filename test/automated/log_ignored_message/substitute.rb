require_relative "../automated_init"

context "LogIgnoredMessage" do
  context "Substitute" do
    message = LogIgnoredMessage::Controls::Message.example
    reason = LogIgnoredMessage::Controls::Reason.example

    substitute = LogIgnoredMessage::Substitute.build

    context "When not invoked" do
      test "Not called" do
        refute substitute.called?
      end
    end

    context "When invoked" do
      substitute.(message, reason)

      test "Called" do
        assert substitute.called?
      end

      test "called with matching arguments" do
        assert substitute.called_with?(message, reason)
      end

      test "Not called with another reason" do
        other_reason = LogIgnoredMessage::Controls::Reason::Other.example

        refute substitute.called_with?(message, other_reason)
      end

      test "Not called with another message" do
        other_message = LogIgnoredMessage::Controls::Message::Other.example

        refute substitute.called_with?(other_message, reason)
      end
    end
  end
end
