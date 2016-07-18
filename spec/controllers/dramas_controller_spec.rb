require 'rails_helper'

RSpec.describe DramasController, type: :controller do
  let(:drama) { FactoryGirl.build(:drama) }

  before do
    sign_in_as!
  end

  describe "#create" do
    it "redirects to drama show page upon save" do
      post :create, drama: drama
      expect redirect_to drama
    end
  end

  describe "#update" do
    it "redirects to drama show page upon save" do
      skip
    end
  end

  describe "#destroy" do
    it "redirects to home page upon save" do
      skip
    end
  end

  describe "#search" do
    it "redirects to search result page upon save" do
      skip
    end
  end
end
