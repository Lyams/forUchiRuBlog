# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:post) { create :post }

  describe 'GET#index' do
    let(:posts) { create_list(:post, 3) }
    before { get :index }
    it 'render index view' do
      expect(assigns(:posts)).to match_array posts
      expect(response).to render_template :index
    end
  end

  describe 'GET#show' do
    before { get :show, params: { id: post } }
    it 'render show view' do
      expect(assigns(:post)).to eq(post)
      expect(response).to render_template :show
    end
  end

  describe 'GET#new' do
    before { get :new }
    it 'render new view' do
      expect(assigns(:post)).to be_a_new(Post)
      expect(response).to render_template :new
    end
  end
end