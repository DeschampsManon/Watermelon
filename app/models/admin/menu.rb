class Admin::Menu < ApplicationRecord
  has_many :posts , :through => :items_relationships
  has_many :categories , :through => :items_relationships
  has_many :pages , :through => :items_relationships
  has_many :items_relationships
end
