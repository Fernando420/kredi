class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.belongs_to :user
      t.belongs_to :emitter
      t.belongs_to :receiver
      t.belongs_to :zip_file
      t.string :amount
      t.string :currency
      t.datetime :emitted_at
      t.datetime :expires_at
      t.datetime :signed_at
      t.string :invoice_uuid
      t.integer :status, default: 0
      t.string :cfdi_digital_stamp
      t.timestamps
    end
  end
end
