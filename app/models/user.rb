class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :messages
  #has_and_belongs_to_many :rooms
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_one :student
  has_one :teacher

  accepts_nested_attributes_for :student
  accepts_nested_attributes_for :teacher
end
