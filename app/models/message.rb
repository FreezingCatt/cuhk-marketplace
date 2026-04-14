class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  
  validates :content, presence: true
  
  scope :unread, -> { where(read_at: nil) }
  
  def mark_as_read
    update(read_at: Time.now)
  end
end
