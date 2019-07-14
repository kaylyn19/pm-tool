class Comment < ApplicationRecord
    belongs_to :discussion
    belongs_to :user
    validates :body, presence: true
end
