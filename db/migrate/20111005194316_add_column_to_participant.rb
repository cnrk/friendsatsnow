class AddColumnToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :payment_date, :date
  end
end
