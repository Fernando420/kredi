class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :invoices

  before_validation :set_display_name

  def set_display_name
    self.display_name = "#{self.name} #{self.last_name}"
  end
end
