class Admin::Page < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :meta_description, presence: true
  validates :page_title, presence: true
end
