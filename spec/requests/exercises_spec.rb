require 'rails_helper'

RSpec.describe "Exercises", type: :request do

  let(:valid_category) { create(:category) }
  let(:user) { create(:user) }

  describe "GET /index" do
    it "renders a successful response" do
      get exercises_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      exercise = create(:exercise)

      get exercise_url(exercise)
      expect(response).to have_http_status(:success)
      expect(response.body).to include(exercise.name)
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      sign_in user
      get new_exercise_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      sign_in user
      exercise = create(:exercise)

      get edit_exercise_url(exercise)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new exercise" do
        sign_in user

        expect {
          post exercises_url, params: { exercise: attributes_for(:exercise, category_id: valid_category.id) }
        }.to change(Exercise, :count).by(1)
      end

      it "redirects to created exercise" do
        sign_in user

        post exercises_url, params: { exercise: attributes_for(:exercise, category_id: valid_category.id) }
        expect(response).to redirect_to(exercise_url(Exercise.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new exercise" do
        sign_in user

        expect {
          post exercises_url, params: { exercise: attributes_for(:exercise, name: "") }
        }.to change(Exercise, :count).by(0)
      end

      it "does not have a successful status" do
        sign_in user

        post exercises_url, params: { exercise: attributes_for(:exercise, name: "") }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested exercise" do
        sign_in user
        exercise = create(:exercise)

        patch exercise_url(exercise), params: { exercise: attributes_for(:exercise, name: "Updated exercise") }
        follow_redirect!
        expect(response.body).to include("Updated exercise")
      end

      it "redirects to the updated exercise" do
        sign_in user
        exercise = create(:exercise)

        patch exercise_url(exercise), params: { exercise: attributes_for(:exercise, name: "Updated name") }
        expect(response).to redirect_to(exercise_url(exercise))
      end
    end

    context "with invalid parameters" do
      it "does not have a successful status" do
        sign_in user
        exercise = create(:exercise)

        patch exercise_url(exercise), params: { exercise: attributes_for(:exercise, name: "") }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "successfully deletes the exercise" do
      sign_in user
      exercise = create(:exercise)

      expect {
        delete exercise_url(exercise) 
      }.to change(Exercise, :count).by(-1)
    end

    it "redirects to the exercises page" do
      sign_in user
      exercise = create(:exercise)

      delete exercise_url(exercise)
      expect(response).to redirect_to(exercises_url)
    end
  end

end
