class Task < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :project, message: "no same task per project"}
end