require 'rails_helper'

RSpec.describe Drama, type: :model do

  let(:user) { User.create(name: "test", email: "test@example.com") }
  let(:drama) { Drama.new(user: @user) }


  context "when create a new drama" do
    it "should not save without title" do
      drama.description = "Example description"
      drama.save
      expect(Drama.count).to eq 0
    end

    it "should not save without description" do
      drama.title = "Example drama"
      drama.save
      expect(Drama.count).to eq 0
    end

    it "should be able to save with necessary content" do
      drama.title = "Example drama"
      drama.description = "Example description"
      drama.save
      expect(Drama.count).to eq 1
    end
  end
end
