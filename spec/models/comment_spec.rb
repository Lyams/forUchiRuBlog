require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:post) {create :post}
  let(:comment) { build(:comment, post_id: post.id) }
  describe 'attributes' do
    it { should respond_to(:post_id) }
    it { should respond_to(:message) }
  end

  describe 'association' do
    it { is_expected.to belong_to :post }
  end

  describe 'validations' do
    it { is_expected.to validate_length_of(:message).is_at_least(3) }
    it { expect(comment).to be_valid }

    it 'post should be present' do
      comment.post_id = nil
      expect(comment).to be_invalid
    end
  end

  describe 'database: column specification' do
    it { is_expected.to have_db_column(:id).of_type(:uuid).with_options(primary: true).with_options(null: false) }
    it { is_expected.to have_db_column(:message).of_type(:text).with_options(null: false) }
    it { is_expected.to have_db_index(['post_id']) }
    it { is_expected.to have_db_column(:post_id).of_type(:uuid).with_options(null: false) }
  end
end
