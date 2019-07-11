class Task < ApplicationRecord
    belongs_to :project
    validates :title, presence: true, uniqueness: {scope: :project, message: "no same task per project"}
end