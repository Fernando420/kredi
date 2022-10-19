class CreateZipFiles < ActiveRecord::Migration[6.1]
  def change
    create_table :zip_files do |t|
      t.string :name
      t.integer :status, default: 0
      t.string  :success, array: true, default: []
      t.string  :failed, array: true, default: []
      t.timestamps
    end
  end
end
