class PagesController < ApplicationController
  def home
    @microposts = Micropost.all
  
    @comment = Comment.new
  end
end
