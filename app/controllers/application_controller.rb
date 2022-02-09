# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def hello
    render plain: "Hello, world!"
  end
end
