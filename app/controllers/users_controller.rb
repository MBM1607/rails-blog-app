# frozen_string_literal: true

# Controller to handle user actions
class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @users = User.all
  end
end
