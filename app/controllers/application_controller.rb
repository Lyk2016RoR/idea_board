class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :load_sidebar_datas

  def load_sidebar_datas
    @sidebar_categories = Category.all
    @sidebar_tags = Tag.all
  end
end
