require 'rails_helper'

RSpec.describe "Workouts", type: :request do

  let (:valid_category) { create(:category) }

  describe "GET /index" do
    it "renders a successful response" do
      get workouts_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      workout = create(:workout)
      get workout_url(workout)

      expect(response).to have_http_status(:success)
      expect(response.body).to include(workout.name)
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_workout_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      workout = create(:workout)

      get edit_workout_url(workout)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new workout" do
        expect {
          post workouts_url, params: { workout: attributes_for(:workout, category_id: valid_category.id) }
        }.to change(Workout, :count).by(1)
      end

      it "redirects to the created workout" do
        post workouts_url, params: { workout: attributes_for(:workout, category_id: valid_category.id) }
        expect(response).to redirect_to(workout_url(Workout.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new workout" do
        expect {
          post workouts_url, params: { workout: attributes_for(:workout, category_id: valid_category.id, name: "") }
        }.to change(Workout, :count).by(0)
      end

      it "does not render a successful response" do
        post workouts_url, params: { workout: attributes_for(:workout, category_id: valid_category.id, name: "") }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCh /update" do
    context "with valid parameters" do
      it "updates the requested workout" do
        workout = create(:workout)

        patch workout_url(workout), params: { workout: attributes_for(:workout, name: "Updated workout") }
        follow_redirect!
        expect(response.body).to include("Updated workout")
      end

      it "redirects to the updated workout" do
        workout = create(:workout)

        patch workout_url(workout), params: { workout: attributes_for(:workout, name: "Updated workout") }
        expect(response).to redirect_to(workout_url(workout))
      end
    end

    context "with invalid parameters" do
      it "does not have a successful response" do
        workout = create(:workout)

        patch workout_url(workout), params: { workout: attributes_for(:workout, name: "") }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "successfully deletes the workout" do
      workout = create(:workout)

      expect {
        delete workout_url(workout)
      }.to change(Workout, :count).by(-1)
    end

    it "redirects to the workouts page" do
      workout = create(:workout)

      delete workout_url(workout)
      expect(response).to redirect_to(workouts_url)
    end
  end

end
