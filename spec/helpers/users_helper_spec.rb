require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  context "when call to show the number of user has commented" do
    let(:drama) { Drama.create!(title: "test drama", description: "test drama description") }
    let(:user) { User.create!(name: "user1", email: "user1@example.com", password: "test12", password_confirmation: "test12") }
    let(:comment) { Comment.new(drama: drama, user: user) }

    it "should be 0 if user never comment on drama" do
      expect(show_user_comments_count(user)).to eq(0)
    end

    it "should be 1 if user commented only once for a drama" do
      comment.content = "blah blah"
      comment.save!
      expect(show_user_comments_count(user)).to eq(1)
    end
  end
end
