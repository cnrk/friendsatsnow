class AddSurnameToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :surname, :string
  end
end
