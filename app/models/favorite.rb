class Favorite < ApplicationRecord
  belongs_to :photo #投稿とのアソシエーション
  belongs_to :user #ユーザーとのアソシエーション
end
