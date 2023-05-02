require 'rails_helper'

RSpec.describe "Categories", type: :request do

  let(:valid_category) { create(:category) }

  describe "GET /index" do
    it "renders a successful response" do
      get exercises_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      category = create(:category)
      get category_url(category)
      expect(response).to have_http_status(:success)
      expect(response.body).to include(category.name)
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_category_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      category = create(:category)
      get edit_category_url(category)
      expect(response).to be_successful
    end
  end

end