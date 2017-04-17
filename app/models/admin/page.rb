class Admin::Page < ApplicationRecord

  after_initialize :set_default_source

  validates :name, presence: true, uniqueness: true
  validates :meta_description, presence: true
  validates :page_title, presence: true

  has_many :menus , :through => :items_relationships
  has_many :items_relationships

  def set_default_source
    if source.blank?
      default_source = AdminController.new.render_to_string(partial: 'admin/pages/editor/default_source')
      self.source = default_source
    end
  end

end
