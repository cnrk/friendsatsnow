require 'test_helper'

class ConfirmationMailerTest < ActionMailer::TestCase
  test "signup" do
    mail = ConfirmationMailer.signup
    assert_equal "Signup", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
