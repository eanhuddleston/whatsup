class TestController < ApplicationController
  def test
    @current_user = current_user
    render :test
  end
end