require 'rails_helper'

RSpec.describe EntriesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Entry. As you add validations to Entry, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EntriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all entries as @entries" do
      entry = Entry.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:entries)).to eq([entry])
    end
  end

  describe "GET show" do
    it "assigns the requested entry as @entry" do
      entry = Entry.create! valid_attributes
      get :show, {:id => entry.to_param}, valid_session
      expect(assigns(:entry)).to eq(entry)
    end
  end

  describe "GET new" do
    xit "assigns a new entry as @entry" do
      get :new, {}, valid_session
      expect(assigns(:entry)).to be_a_new(Entry)
    end
  end

  describe "GET edit" do
    it "assigns the requested entry as @entry" do
      entry = Entry.create! valid_attributes
      get :edit, {:id => entry.to_param}, valid_session
      expect(assigns(:entry)).to eq(entry)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Entry" do
        expect {
          post :create, {:entry => valid_attributes}, valid_session
        }.to change(Entry, :count).by(1)
      end

      it "assigns a newly created entry as @entry" do
        post :create, {:entry => valid_attributes}, valid_session
        expect(assigns(:entry)).to be_a(Entry)
        expect(assigns(:entry)).to be_persisted
      end

      it "redirects to the created entry" do
        post :create, {:entry => valid_attributes}, valid_session
        expect(response).to redirect_to(Entry.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved entry as @entry" do
        post :create, {:entry => invalid_attributes}, valid_session
        expect(assigns(:entry)).to be_a_new(Entry)
      end

      it "re-renders the 'new' template" do
        post :create, {:entry => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested entry" do
        entry = Entry.create! valid_attributes
        put :update, {:id => entry.to_param, :entry => new_attributes}, valid_session
        entry.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested entry as @entry" do
        entry = Entry.create! valid_attributes
        put :update, {:id => entry.to_param, :entry => valid_attributes}, valid_session
        expect(assigns(:entry)).to eq(entry)
      end

      it "redirects to the entry" do
        entry = Entry.create! valid_attributes
        put :update, {:id => entry.to_param, :entry => valid_attributes}, valid_session
        expect(response).to redirect_to(entry)
      end
    end

    describe "with invalid params" do
      it "assigns the entry as @entry" do
        entry = Entry.create! valid_attributes
        put :update, {:id => entry.to_param, :entry => invalid_attributes}, valid_session
        expect(assigns(:entry)).to eq(entry)
      end

      it "re-renders the 'edit' template" do
        entry = Entry.create! valid_attributes
        put :update, {:id => entry.to_param, :entry => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested entry" do
      entry = Entry.create! valid_attributes
      expect {
        delete :destroy, {:id => entry.to_param}, valid_session
      }.to change(Entry, :count).by(-1)
    end

    it "redirects to the entries list" do
      entry = Entry.create! valid_attributes
      delete :destroy, {:id => entry.to_param}, valid_session
      expect(response).to redirect_to(entries_url)
    end
  end

end
