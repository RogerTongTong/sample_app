require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  describe "#full_title" do
    base_title = "Ruby on Rails Tutorial Sample App"
    it "should return base title only if no page title is provided" do
      expect(helper.full_title).to eq(base_title)
    end

    it "should return page title | base title if page title is provided" do
      page_title = "Home"
      expect(helper.full_title(page_title)).to eq("#{page_title} | #{base_title}")
    end
  end
end
