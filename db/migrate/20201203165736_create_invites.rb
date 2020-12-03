class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.string :sender
      t.string :reciever
      t.boolean :accepted

      t.timestamps
    end
  end
end
