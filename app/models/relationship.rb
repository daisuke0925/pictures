class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User' #ユーザーとのアソシエーション
  belongs_to :followed, class_name: 'User'
end
