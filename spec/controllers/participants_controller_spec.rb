require 'spec_helper'

describe ParticipantsController do

  describe "#new" do
    it "renders the #new view" do
      get :new, format: "js"
      expect(response).to render_template :new
    end
  end

  describe "#show" do
    it "renders the #show view" do
      get :show, id: create(:participant), format: "js"
      expect(response).to render_template :show
    end
  end

  describe "#create" do

    context "with valid attributes" do

      it "saves the participant" do
        expect {
          post :create, participant: attributes_for(:participant), format: "js"
        }.to change(Participant, :count).by(1)
      end

      it "redirects to the new participant" do
        post :create, participant: attributes_for(:participant), format: "js"
        expect(response).to redirect_to Participant.last
      end
    end

    context "with invalid attributes" do
      it "doesn't save the participant" do
        expect {
          post :create, participant: attributes_for(:invalid_participant), format: "js"
        }.not_to change(Participant, :count).by(1)
      end

      it "renders the new view" do
        post :create, participant: attributes_for(:invalid_participant), format: "js"
        expect(response).to render_template :new
      end

      it "creates an error message" do
        post :create, participant: attributes_for(:invalid_participant), format: "js"
        expect(assigns(:participant).errors).not_to be_empty
      end
    end
  end
end

