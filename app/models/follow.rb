class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: "follower_id", class_name: "User"
  belongs_to :folowee, foreign_key: "followee_id", class_name: "User"
  # Resource: https://medium.com/@jbmilgrom/active-record-many-to-many-self-join-table-e0992c27c1e
end
