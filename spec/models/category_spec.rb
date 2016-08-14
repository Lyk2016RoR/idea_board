require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create :category }

  context 'validations' do
    it 'is valid with proper attributes' do
      expect(category).to be_valid
    end
    it 'is not valid without unique title' do
      @category = build :category, title: category.title
      expect(@category).not_to be_valid
    end
    it 'is not valid without proper color' do
      category.color = "yellow"
      expect(category).not_to be_valid
    end
  end

end
