require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:post) { create(:post) }
  describe '#create' do
    let(:params) { {post: post.id, comment: { message: "It is a greek", post_id: post.id },  use_route: '/post'  }}
    subject { process :create, method: :post, params: params}

    it 'create comment' do
      expect { subject }.to change { Comment.count }.by(1)
      is_expected.to redirect_to post_path(post)
    end
  end
end