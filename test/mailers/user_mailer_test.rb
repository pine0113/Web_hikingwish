require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "notify_plan_invites" do
    mail = UserMailer.notify_plan_invites
    assert_equal "Notify plan invites", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
