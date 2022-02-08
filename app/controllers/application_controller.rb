# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Sort records by date of creation instead of primary key
  self.implicit_order_column = :created_at
end
