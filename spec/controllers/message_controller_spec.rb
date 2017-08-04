require 'rails_helper'
RSpec.describe MessageController, :type => :controller do
  describe "POST index" do
    it "response 200 status" do
      user = create(:user)
      sign_in user
      post :index, params: {userId: user.id }
      # expect(response).to eq(200)
      response.code.should == "200"
    end
  end

  describe "POST create" do
    it "response 200 status" do
      user = create(:user)
      sign_in user
      post :create, params: {userID: user.id, message: 'Text'}
      # expect(response).to eq(200)
      response.code.should == "200"
    end
  end
end