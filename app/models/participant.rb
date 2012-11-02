class Participant < ActiveRecord::Base
  validates :name, :surname, :email, presence: true
  validates :email, uniqueness: true, on: :create
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create}

  def paid?
    not self.payment_date.nil?
  end

  def confirm_payment
    self.payment_date ||= Time.now
    self.payment_confirmed = true
  end
end
