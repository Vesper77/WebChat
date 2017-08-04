require 'rails_helper'
RSpec.describe ChatController, :type => :controller do
  describe "GET index" do
    it "response 200 status" do
      sign_in('val')
      get :index
      expect(response).to render_template("index")
    end
  end
end