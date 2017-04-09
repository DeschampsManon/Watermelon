class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true

  has_attached_file :avatar, styles: { small: "170x170>", thumb: "50x50>" }, default_url: "/assets/no-image.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.current_user
    Thread.current[:user]
  end

  def self.current_user=(user)
    Thread.current[:user] = user
  end

end
