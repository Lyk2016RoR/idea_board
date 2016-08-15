require 'rails_helper'

RSpec.describe Idea, type: :model do
  context "validations" do
    it 'is valid with proper attributes' do
      @idea = create(:idea)
      expect(@idea).to be_valid
    end
    it "is not valid without title" do
      @idea = build :idea, title: nil
      expect(@idea).not_to be_valid
    end
    it 'is not valid without proper title length' do
      @idea = build :idea, title: "123456789"
      expect(@idea).not_to be_valid
    end
    it 'is not valid without description' do
      @idea = build :idea, description: nil
      expect(@idea).not_to be_valid
    end
    it 'is not valid with desc over 500 chars' do
      @idea = build :idea, description: Faker::Lorem.characters(501)
      expect(@idea).not_to be_valid
    end
    it 'is valid without planned_to' do
      @idea = build :idea, planned_to: nil
      expect(@idea).to be_valid
    end
    it 'is not valid without planned to field in past' do
      @idea = build :idea, planned_to: Date.yesterday
      expect(@idea).not_to be_valid
    end
    it "is not valid without category" do
      @idea = build :idea, category: nil
      expect(@idea).not_to be_valid
    end
  end
end
