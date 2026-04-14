class Rating < ApplicationRecord
  belongs_to :rater, class_name: 'User', foreign_key: 'rater_id'
  belongs_to :ratee, class_name: 'User', foreign_key: 'ratee_id'
  
  validates :score, presence: true, inclusion: { in: 1..5 }
  validates :comment, presence: true, length: { maximum: 500 }
  
  scope :recent, -> { order(created_at: :desc) }
  
  def self.average_score_for(user)
    where(ratee_id: user.id).average(:score)
  end
end
