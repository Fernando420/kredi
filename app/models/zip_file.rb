class ZipFile < ApplicationRecord
  has_many :invoices

  enum status: [:pendended,:processing,:process,:failed]
end
