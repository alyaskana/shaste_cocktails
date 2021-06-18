class Follow < ApplicationRecord
  validates :follower, uniqueness: { scope: :following }

  belongs_to :follower, class_name: "User", foreign_key: :follower_id
  belongs_to :following, class_name: "User", foreign_key: :following_id
end
