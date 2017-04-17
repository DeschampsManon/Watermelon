class Admin::ItemsRelationship < ApplicationRecord
  belongs_to :post
  belongs_to :category
  belongs_to :page
  belongs_to :menu
end
