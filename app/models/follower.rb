class Follower < ApplicationRecord
  belongs_to :follower_id
  belongs_to :following_id
end
