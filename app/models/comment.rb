# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  validates :message, presence: true, length: { minimum: 3 }
end
