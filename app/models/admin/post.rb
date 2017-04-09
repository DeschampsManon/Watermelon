class Admin::Post < ApplicationRecord
  belongs_to :category
  before_save :default_values

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :category_id, presence: true

  STATUS_TYPES = [
      'draft',
      'published'
  ]
  def default_values
    self.author ||= current_user.first_name current_user.last_name
  end

end
