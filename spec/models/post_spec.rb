require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'have attributes' do
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:body) }
  end
  describe 'validation' do
    let(:post) { create(:post) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
    it { expect(post).to be_valid }
  end
  describe 'database: column specification' do
    it { is_expected.to have_db_column(:id).of_type(:uuid).with_options(primary: true).with_options(null: false) }
    it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:body).of_type(:text).with_options(null: false) }
  end
end
