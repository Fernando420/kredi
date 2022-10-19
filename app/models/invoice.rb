class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :receiver
  belongs_to :emitter
  belongs_to :zip_file, optional: true

  enum status: [:actived,:inactived,:deleted] 

end
