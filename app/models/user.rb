class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  CUHK_EMAIL_REGEX = /\A[\w+\-.]+@(link\.)?cuhk\.edu\.hk\z/i

  validates :email, presence: true, 
                    format: { with: CUHK_EMAIL_REGEX, 
                              message: "must be a valid CUHK email address" }
  
  has_many :books, dependent: :destroy
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id', dependent: :destroy
  has_many :ratings_given, class_name: 'Rating', foreign_key: 'rater_id', dependent: :destroy
  has_many :ratings_received, class_name: 'Rating', foreign_key: 'ratee_id', dependent: :destroy
  
  def average_rating
    Rating.average_score_for(self)
  end
end