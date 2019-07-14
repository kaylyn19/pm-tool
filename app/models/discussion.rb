class Discussion < ApplicationRecord
    belongs_to :project
    has_many :comments, dependent: :destroy

    validates :title, presence: true, uniqueness: true
    validates :description, presence: true
end
