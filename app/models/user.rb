class User < ApplicationRecord
  enum role: [:cliente, :admin]
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #:confirmable, :omniauthable

  validates :email, presence: true, uniqueness: true
end