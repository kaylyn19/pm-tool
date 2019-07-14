class Task < ApplicationRecord
    belongs_to :project
    belongs_to :user

    validates :title, presence: true, uniqueness: {scope: :project, message: "no same task per project"}
    validates :description, presence: true
    # before_validation :newer_published_at

    # private

    # def newer_published_at
    #     return unless due_date.present?
    #     self.errors.add(:due_date, "due date comes after created at") unless due_date > created_at || due_date > Project.due_date
    # end

end