class CreateReceivers < ActiveRecord::Migration[6.1]
  def change
    create_table :receivers do |t|
      t.string :name
      t.string :rfc
      t.timestamps
    end
  end
end
