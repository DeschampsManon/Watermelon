class Admin::Picture < ApplicationRecord
  has_attached_file :file, styles: { small: "170x170>", thumb: "50x50>" }, default_url: "/assets/no-image.png"
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/

  has_many :posts
end
