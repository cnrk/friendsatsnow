class PagesController < ApplicationController

  def home
    reset_session
    respond_to do |format|
      format.html
      format.js
    end
  end
  
end
