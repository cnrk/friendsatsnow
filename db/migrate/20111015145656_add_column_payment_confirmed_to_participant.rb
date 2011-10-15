class AddColumnPaymentConfirmedToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :payment_confirmed, :boolean
  end
end
