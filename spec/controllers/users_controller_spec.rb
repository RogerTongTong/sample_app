require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET # new" do
    it "should respond successfully when sending get request to new method" do
      get :new
      expect(response).to be_success
    end
  end
end
