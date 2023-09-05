class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects
  validates :name, presence: true
  validates :title, presence: true
  validates :company, presence: true
  validates :phone_number, presence: true
  

  attr_accessor :title
end
