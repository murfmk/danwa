class RanksController < ApplicationController
  def index
    @misroposts = Micropost.find(Comment.group(:micropost_id).order(‘count(micropost_id) desk’)limit(5).pluck(:micropost_id))
  end
end
