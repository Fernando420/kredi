class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :get_path
  before_action :set_locale

  def set_locale
    I18n.locale = set_locale_by_user || params[:locale] || 'es'
  end

  def get_path
    uri = URI(request.url)
    @path = uri.path
  end

  private 

     def set_locale_by_user
       current_user ? current_user.locale : 'en'
     end
end
