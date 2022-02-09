# frozen_string_literal: true

FactoryBot.define do
  factory :post, class: Post do
    sequence :title do |n|
      "Title question N: #{n}"
    end
    sequence :body do |n|
      "Body number #{n} dsdgagghgwerh dgewgrgw 23412 dgsdg"
    end
  end
end