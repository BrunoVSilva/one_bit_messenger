class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, :recoverable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :contacts
  has_many :sent, class_name: "Message", foreign_key: "sender_id"
  has_many :received, class_name: "Message", foreign_key: "receiver_id"

  has_one_attached :photo

  validates :name, presence: true
end
