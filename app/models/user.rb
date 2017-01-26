class User < ApplicationRecord
  has_many :user_products
  has_many :special_products, through: :user_products
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.search(search)
   if search
     where('email LIKE ?', "%#{search}%")
   else
     User.all
   end
 end
end
