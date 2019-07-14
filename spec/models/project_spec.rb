require 'rails_helper'

RSpec.describe Project, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'validates' do
    it 'requires a unique title' do
      user = FactoryBot.create(:user)
      persisted_project = Project.create(title: 'title', description: 'description', user: user)
      new_project = Project.new(title: 'title', description: 'description', user: user)
      new_project.valid?
      expect(new_project.errors.messages).to have_key(:title)
    end

    it 'requires a title' do
      user = FactoryBot.create(:user)
      project = Project.new(title: nil, description: 'description', user: user)
      project.valid?
      expect(project.errors.messages).to have_key(:title)
    end

    it 'requires a description' do
      user = FactoryBot.create(:user)
      project = Project.new(title: 'title', description: nil, user: user)
      project.valid?
      expect(project.errors.messages).to have_key(:description)
    end
  end
end
