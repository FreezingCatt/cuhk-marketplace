class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :ratings, dependent: :destroy

  CUHK_EMAIL_REGEX = /\A[\w+\-.]+@(link\.)?cuhk\.edu\.hk\z/i

  validates :email, presence: true, 
                    format: { with: CUHK_EMAIL_REGEX, 
                              message: "must be a valid CUHK email address" }
end