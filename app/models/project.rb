class Project < ApplicationRecord
    belongs_to :user
    has_many :tasks, dependent: :destroy
    has_many :discussions, dependent: :destroy
    has_many :favourites, dependent: :destroy
    has_many :favourited_users, through: :favourites, source: :user

    validates :title, presence: true, uniqueness: true
    validates :description, presence: true
    after_save :newer_due_date
    private

    def newer_due_date
        return unless due_date.present?
        self.errors.add(:due_date, "due date comes after created at") unless due_date > created_at
    end
end
