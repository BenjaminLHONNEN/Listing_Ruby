class Conversation < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  belongs_to :article, class_name: "Article", foreign_key: "article_id"
  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, scope: :receiver_id

  scope :between, -> (sender_id, receiver_id, article_id) do
    where("(conversations.sender_id = ? AND conversations.receiver_id = ? AND conversations.article_id = ?) OR (conversations.receiver_id = ? AND conversations.sender_id = ? AND conversations.article_id = ?)", sender_id, receiver_id, article_id, sender_id, receiver_id, article_id)
  end

  def recipient(current_user)
    self.sender_id == current_user.id ? self.receiver : self.sender
  end

end