class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    #get twitter details
  end

  # GET /posts/new
  def new
    @post = current_user.posts.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new post_params
    respond_to do |format|
      if @post.save

        tweet @post

        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /posts/modal
  def modal
    @post = current_user.posts.new

    targets_ids = []
    unless params[:post].nil?
      unless params[:post][:targets_ids].nil?
        params[:post][:targets_ids].each do |person_id|
          targets_ids << Target.find_or_create_by(person_id: person_id)
        end
      end
    end

    render partial:'modal', locals:{post:@post, targets:targets_ids}, layout:nil
  end

  # POST post/modal/create
  def troll
    @post = Post.new post_params
    if @post.save
      tweet @post
      render post_url(@post), layout:nil
    else
      render partial:'modal_form', locals:{post:@post, targets:[]}, layout:nil, status: :unprocessable_entity
    end
  end

  def tweet post
    if current_user.has_twitter? == true
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = "pCesNqOmezM2QUK7Ig23Lo1cJ"
        config.consumer_secret     = "qxgjsaqNBnP8xDwUjM0FmQFgFMxUXILEIYgKqFfbJE106zW1DX"
        config.access_token        = current_user.twitter.token
        config.access_token_secret = current_user.twitter.secret
      end
      client.update("#{post.title} #{post_url(post)}")
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title,
                                   :content,
                                   :user_id,
                                   targets_ids: [])
    end
end