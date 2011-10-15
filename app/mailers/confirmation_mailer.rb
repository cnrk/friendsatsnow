class ConfirmationMailer < ActionMailer::Base
  default from: ENV["GMAIL_USERNAME"]

  def confirm_signup(participant)
    @participant = participant
    mail to: @participant.email
  end

  def confirm_payment(participant)
    @participant = participant
    mail to: @participant.email
  end
  
end
