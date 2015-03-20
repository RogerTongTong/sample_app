require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do

  let(:user) do
    user = User.new
    user.id = 1
    user.remember_token = 2
    user
  end

  describe "#log_in" do
    it "should store user id into session" do
      helper.log_in(user)
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe "#remember" do
    it "should store id and remember_token into cookies" do
      # user.should_receive(:remember)
      expect(user).to receive(:remember)
      helper.remember(user)
      expect(cookies.signed[:user_id]).to eq(user.id)
      expect(cookies[:remember_token]).to eq(user.remember_token)
    end
  end

  describe "#current_user" do

    context "find user based on user_id from session" do
      it "should find user from database based on user_id if user_id was stored in session" do
        session[:user_id] = user.id
        expect(User).to receive(:find_by).with(:id => user.id)
        helper.current_user
      end
    end


    context "user_id stored in cookies" do
      it "should invoke find_by method with user_id in cookies if the user_id is invalid" do
        cookies.permanent.signed[:user_id] = 12345
        expect(User).to receive(:find_by).with(id: 12345)
        helper.current_user
      end

      it "should invoke log_in if user is remembered" do
        user_id = 123
        cookies.permanent.signed[:user_id] = user_id
        user = User.new
        user.id = user_id
        allow(User).to receive_messages(:find_by => user)
        allow(user).to receive_messages(:authenticated? => true)
        expect(helper).to receive(:log_in)
        helper.current_user
      end
    end
  end
end
