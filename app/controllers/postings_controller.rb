class PostingsController < ApplicationController
  before_action :set_posting, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :like, :unlike]

    def index
      #@postings  = Posting.all
      #@postings  = Posting.all
      #@postings = posting.joins(:user).where('users')
      @postings = Posting.joins(:user).all.order('created_at DESC')


    end

    def new
      return redirect_to posting_params

    end

    def create
      # render plain: params[:image].inspect
    @posting = current_user.postings.new posting_params
    #respond_with Image.create(image_params.merge(user_id: current_user.id))

    # @image = Image.new image_params

    if @posting.save
      return redirect_to posting_params
    end
    return redirect_to posting_params
    end



    def show
      @posting = Posting.find(params[:id])
    end

    def edit
    end

    def update
        @posting.update posting_params
        redirect_to @posting
    end

    def destroy
      @posting.destroy
      redirect_to posting_params
    end

    def upvote
      @posting = Posting.find params[:id]
      #@posting.upvote_from current_user
      @posting.liked_by current_user
      #redirect_to @posting, notice: "You disliked this!"
      #redirect_back fallback_location: root_path
      respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.json { render layout:false }
      end
    end

    def downvote
      @posting = Posting.find params[:id]
      #@posting.downvote_from current_user
      @posting.unliked_by current_user
      #redirect_back fallback_location: root_path
      #redirect_to @posting, notice: "You unvoted this!"
      respond_to do |format|
       format.html { redirect_back fallback_location: root_path }
       format.json { render layout:false }
     end
    end

    #def as_json(options = {})
    #   super(options.merge(include: [:user, postings: {include: :user}]))
    #end
    private


    def posting_params
      params.require(:posting).permit(:description, :picture, :user_id)
    end

    def set_posting
      @posting = Posting.find params[:id]
    end
end
