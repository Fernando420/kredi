class HomeController < ApplicationController

  def index
    @title = t('general_text.home')
  end

end
