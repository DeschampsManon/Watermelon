class Admin::Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :category, foreign_key: :parent_id
  has_many :posts , :through => :categorizations
  has_many :categorizations
  has_many :menus , :through => :items_relationships
  has_many :items_relationships

end
