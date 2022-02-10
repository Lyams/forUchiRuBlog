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

  describe 'GET#create' do
    subject { process :create, method: :post, params: { post: attributes_for(:post) } }
    it 'created post' do
      expect { subject }.to change { Post.count }.by(1)
      is_expected.to redirect_to assigns(:post)
    end
  end

  describe 'GET#edit' do
    subject { process :edit, method: :get, params: { id: post.id } }
    it 'created post' do
      is_expected.to render_template :edit
      expect { subject }.to_not change { Post.count }
      expect(assigns :post).to eq post
    end
  end

  describe '#destroy' do
    let!(:new_post) { create :post }
    subject { delete :destroy, params: { id: new_post } }
    it 'destroys Post record' do
      expect { subject }.to change { Post.count }.by(-1)
      expect(response).to redirect_to posts_url
    end
  end

  describe '#update' do
    let!(:old_post) { create :post }
    let(:params) { { id: old_post, post: { id: old_post.id, body: 'New decription! ;)' } } }
    subject { process :update, method: :patch, params: params }
    it 'update Post record' do
      expect { subject }.to_not change { Post.count }
      expect(old_post.reload.body).to eq('New decription! ;)')
    end
  end
end