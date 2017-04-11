class Admin::Post < ApplicationRecord
  before_save :default_values

  validates :title, presence: true, uniqueness: true
  validates :category_ids, presence: true

  STATUS_TYPES = [
      'draft',
      'published'
  ]
  def default_values
    self.author ||= User.current_user.first_name+" "+User.current_user.last_name
  end

  belongs_to :picture

end
