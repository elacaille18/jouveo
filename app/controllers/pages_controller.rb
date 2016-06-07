class PagesController < ApplicationController
 # Allow visitor to see the home page
  skip_before_action :authenticate_user!
  before_action :skip_authorization

  def home
  end
end
