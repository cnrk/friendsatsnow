class Participant < ActiveRecord::Base
  validates :name, :surname, :email, presence: true
  validates :email, uniqueness: true, on: :create
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create}

  def paid?
    not payment_date.nil?
  end
end
