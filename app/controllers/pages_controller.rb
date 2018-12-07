class PagesController < ApplicationController
  def home
    @microposts = Micropost.all 
  end
end
