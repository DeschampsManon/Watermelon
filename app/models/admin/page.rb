class Admin::Page < ApplicationRecord

  after_initialize :set_default_source

  validates :name, presence: true, uniqueness: true
  validates :meta_description, presence: true
  validates :page_title, presence: true

  def set_default_source
    if source.blank?
      default_source = AdminController.new.render_to_string(partial: 'admin/pages/editor/default_source')
      self.source = default_source
    end
  end

end
