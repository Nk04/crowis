require 'rails_helper'

RSpec.describe 'Complaints', type: :request do

  before do
    @complaints = FactoryBot.create(:complaint)
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get root_path
      expect(response.status).to eq 200
    end
  end
end
