require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the new users page" do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "redirect to the user's show page" do
        post :create, user: {username: "larry", password: "cheezits"}
        expect(response).to redirect_to(user_url(User.last))
      end

      it "logs in the user" do
        post :create, user: {username: "larry", password: "cheezits"}
        expect(session[:session_token]).to eq(User.last.session_token)
      end
    end

    context "with invalid params" do

    end
  end

end
