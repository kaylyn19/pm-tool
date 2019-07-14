class Project < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_many :discussions, dependent: :destroy
    validates :title, presence: true, uniqueness: true
    # before_validation :newer_published_at
    # private

    # def newer_published_at
    #     return unless due_date.present?
    #     self.errors.add(:due_date, "due date comes after created at") unless due_date > created_at
    # end
end
