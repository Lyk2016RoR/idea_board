class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :load_sidebar_categories

  def load_sidebar_categories
    @sidebar_categories = Category.all
  end
end
