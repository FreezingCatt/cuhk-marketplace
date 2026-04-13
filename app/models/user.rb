class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

class User < ApplicationRecord
  CUHK_EMAIL_REGEX = /\A[\w+\-.]+@(link\.)?cuhk\.edu\.hk\z/i

  validates :email, presence: true, 
                    format: { with: CUHK_EMAIL_REGEX, 
                              message: "must be a valid CUHK email address" }
end