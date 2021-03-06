require 'rails_helper'

RSpec.describe DramasController, type: :controller do
  let(:user) { FactoryGirl.create(:user)}

  before :each do
    sign_in_as!(user)
  end

  describe "#create" do
    context "with valid attributes" do
      before(:each) do
        @drama = FactoryGirl.build(:drama, user: user)
        post :create, drama: @drama
      end

      it "redirects to drama show page upon save" do
        expect redirect_to Drama.last
      end

      it "assigns new drama to @drama" do
        expect(@drama).to be_kind_of Drama
      end
    end

    context "with invalid attributes" do
      it "renders the :new template" do
        @drama = FactoryGirl.build(:invalid_drama, user: user)
        post :create, drama: @drama
        expect render_template :new
      end
    end
  end

  describe "#update" do
    it "redirects to drama show page upon save" do
      @drama = FactoryGirl.create(:drama, user: user)
      @drama.description = "Updated description"
      put :update, id: @drama.id
      expect redirect_to @drama
    end
  end

  describe "#destroy" do
    context "when the resource is found" do
      it "redirects to home page upon save" do
        @drama = FactoryGirl.create(:drama, user: user)
        delete :destroy, id: @drama.id
        expect redirect_to root_path
      end
    end

    context "when the resource is not found" do
      it 'respond with 404' do
        expect {delete :destroy, id: 'not exist'}.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

end
