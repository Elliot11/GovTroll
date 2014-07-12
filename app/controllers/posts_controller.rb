class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "pCesNqOmezM2QUK7Ig23Lo1cJ"
      config.consumer_secret     = "qxgjsaqNBnP8xDwUjM0FmQFgFMxUXILEIYgKqFfbJE106zW1DX"
      config.access_token        = "2620246867-ggtaJkT4QWpPnAF1LgR9oWFosDozVAwrJLhNCbC"
      config.access_token_secret = "qmYV0J799JhjgTswgAZJjCAdX3KAF6TMG3Yr4KtOda2Za"
    end

    client.update("test")
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    #get twitter details


  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
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
      params.require(:post).permit(:title, :content)
    end
end
