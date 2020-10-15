require 'rails_helper'

RSpec.describe CommentsHelper, type: :helper do
  describe "" do
    it "concats two strings with spaces" do
      expect(helper.concat_strings("this","that")).to eq("this that")
    end
  end
end
