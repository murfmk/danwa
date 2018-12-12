class PagesController < ApplicationController
  def home
    @microposts_new = Micropost.all.order(created_at: :desc)

    microposts_rank = Micropost.find(Comment.sort_by_comment_count)
    microposts = Micropost.where(id: Micropost.all.map{|m| m.id if m.comments.empty?}).order(created_at: :desc)
    @microposts_rank = (microposts_rank + microposts)

  end


end
