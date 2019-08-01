class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :article
    accepts_nested_attributes_for :article
end
