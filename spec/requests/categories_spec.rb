require 'rails_helper'

RSpec.describe "Categories", type: :request do

  let(:user) { create(:user) }

  describe "GET /index" do
    it "renders a successful response" do
      get categories_url
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
      sign_in user
      get new_category_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      sign_in user
      category = create(:category)
      get edit_category_url(category)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new category" do
        sign_in user

        expect {
          post categories_url, params: { category: attributes_for(:category) }
        }.to change(Category, :count).by(1)
      end

      it "redirects to created category" do
        sign_in user

        post categories_url, params: { category: attributes_for(:category) }
        expect(response).to redirect_to(category_url(Category.last))
      end
    end

    context "with invalid parameters" do
      it "does not create new Category" do
        sign_in user

        expect {
          post categories_url, params: { category: attributes_for(:category, name: nil) }
        }.to change(Category, :count).by(0)
      end

      it "does not have a successful status" do
        sign_in user

        post categories_url, params: { category: attributes_for(:category, name: nil) }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested category" do
        sign_in user
        category = create(:category)

        patch category_url(category), params: { category: attributes_for(:category, name: "Updated name") }
        follow_redirect!
        expect(response.body).to include("Updated name")
      end

      it "redirects to the updated category" do
        sign_in user
        category = create(:category)

        patch category_url(category), params: { category: attributes_for(:category, name: "Updated name") }
        expect(response).to redirect_to(category_url(category))
      end
    end

    context "with invalid parameters" do
      it "does not have a successful status" do
        sign_in user
        category = create(:category)

        patch category_url(category), params: { category: attributes_for(:category, name: "") }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "successfully destroys the category" do
      sign_in user
      category = create(:category)

      expect {
        delete category_url(category)
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the categories list" do
      sign_in user
      category = create(:category)

      delete category_url(category)
      expect(response).to redirect_to(categories_url)
    end
  end

end