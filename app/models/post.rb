# frozen_string_literal: true

class Post < ApplicationRecord
  validates :body, presence: true, length: { minimum: 2 }
  validates :title, presence: true, length: { minimum: 1, maximum: 25 }
  has_many :comments, dependent: :destroy
end
