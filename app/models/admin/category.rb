class Admin::Category < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  has_many :posts , :through => :categorizations
  has_many :categorizations

end
