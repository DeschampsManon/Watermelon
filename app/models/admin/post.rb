class Admin::Post < ApplicationRecord
  belongs_to :category

  validates :title, presence: true
  validates :content, presence: true
  validates :category_id, presence: true

  STATUS_TYPES = [
      'draft',
      'published'
  ]
end
