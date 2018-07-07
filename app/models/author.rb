class Author < ActiveRecord::Base

  validates :name, uniqueness: true, presence: true
  validates :phone_number, numericality: true, length: { is: 10 }

end
