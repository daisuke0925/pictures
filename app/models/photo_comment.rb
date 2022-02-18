class PhotoComment < ApplicationRecord
  belongs_to :user #ユーザーとのアソシエーション
  belongs_to :photo #投稿とのアソシエーション
end
