class CreateEmitters < ActiveRecord::Migration[6.1]
  def change
    create_table :emitters do |t|
      t.string :name
      t.string :rfc
      t.timestamps
    end
  end
end
