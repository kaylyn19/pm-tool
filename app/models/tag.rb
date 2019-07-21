class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :projects, through: :taggings

    validates :name, uniqueness: {case_sensitive: false}

    def lower_case_tag
        self.name = name.downcase!
    end
end
