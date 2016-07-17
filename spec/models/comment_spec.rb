require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: "test", email: "test@example.com") }
  let(:drama) { Drama.create(title:"Example title", description:"Example desc", user: @user) }
  let(:comment) { Comment.new() }

  context "when create a new comment for drama" do
    it "should not save without linking with a drama" do
      comment.content = "test content"
      comment.save
      expect(Comment.count).to eq 0
    end

    it "should not save if it didn't have content" do
      comment.drama_id = drama.id
      comment.save
      expect(Comment.count).to eq 0
    end

    it "should save with corrent link and content" do
      comment.drama_id = drama.id
      comment.content = "test content"
      comment.save
      expect(Comment.count).to eq 1
    end
  end
end
