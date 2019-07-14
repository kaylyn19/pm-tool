class Discussion < ApplicationRecord
    belongs_to :project
    has_many :comments, dependent: :destroy

    validates :title, presence: true, uniqueness: true
    validates :description, presence: true

    # before_validation :newer_published_at

    # private

    # def newer_published_at
    #     return unless due_date.present?
    #     self.errors.add(:due_date, "due date comes after created at") unless created_at < Project.due_date
    # end

end
