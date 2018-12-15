class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  mount_uploader :picture, PictureUploader
  validates :body , presence: true, length: { maximum: 255 }
  validates :user_id , presence: true

  def self.sort_by_comment_count
    group(:micropost_id).order('count(micropost_id) desc').pluck(:micropost_id)
  end
end
