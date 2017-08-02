require 'rails_helper'
RSpec.describe UsersController, :type => :controller do
  describe "GET index" do
    it "render index" do
      sign_in('val')
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "render show" do
      sign_in('val')
      user = create(:user)
      get :show, params: {id: user.id}
      expect(response).to render_template("show")
    end
  end
end