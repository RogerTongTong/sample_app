require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET to static pages" do
    def request_and_assert(path)
      get path
      expect(response).to be_success
    end

    it "sends get request to home method and responds successfully" do
      request_and_assert(:home)
    end

    it "sends get request to help method and responds successfully" do
      request_and_assert(:help)
    end

    it "sends get request to about method and responds successfully" do
      request_and_assert(:about)
    end

    it "sends get request to contact method and responds successfully" do
      request_and_assert(:contact)
    end
  end
end
