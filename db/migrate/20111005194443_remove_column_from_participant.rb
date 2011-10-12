class RemoveColumnFromParticipant < ActiveRecord::Migration
  def up
    remove_column :participants, :paid
    remove_column :participants, :notes
  end

  def down
    add_column :participants, :notes, :text
    add_column :participants, :paid, :boolean
  end
end
