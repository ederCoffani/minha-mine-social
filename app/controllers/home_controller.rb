class HomeController < ApplicationController
  def index
    if user_signed_in?
    @postings = Posting.order(id: :desc).where user_id: current_user.id
    else
      @postings = Posting.all
    end
  end
end
