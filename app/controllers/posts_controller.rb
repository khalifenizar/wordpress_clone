class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ "new", "create" ]

  def new
    @post = Post.new

    render("new")
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to("/posts/#{@post.id}")
    else
      render("new")
    end
  end

  def show
    post_id = params[:id]
    @post = Post.find_by(id: post_id)

    if @post == nil
      redirect_to("/404")
    else
      render("show")
    end
  end

  def index
    if params[:category_id]
      cat = Category.find_by(id: params[:category_id])
      filtered = cat.posts
    else
      now = DateTime.now
      filtered = Post.where(publish_date: now.beginning_of_month..now.end_of_month)
    end

    @posts = filtered.order(publish_date: "desc")

    render("index")
  end


  private

  def post_params
    params.require(:post).permit(:title, :content, :publish_date, :author, :image, :category)
  end

end
