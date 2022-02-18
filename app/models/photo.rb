class Photo < ApplicationRecord
  attachment :image

  belongs_to :user #ユーザーとのアソシエーション
  has_many :photo_comments, dependent: :destroy #コメントとのアソシエーション
  has_many :favorites, dependent: :destroy #いいねとのアソシエーション

  def favorited_by?(user) #いいねしているかどうか判定
    favorites.where(user_id: user.id).exists?
  end
end
