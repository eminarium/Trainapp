require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "index page" do

    # let!(:my_category) { FactoryBot.create(:category) }

    it "shows the list of categories on 'index' page" do
      get categories_path

      expect(response).to have_http_status(200)
    end

    it "creates a new category" do
      # post categories_path, params: { category: my_category }
    end
  end
end