class PostsController < ApplicationController

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


  private

  def post_params
    params.require(:post).permit(:title, :content, :publish_date, :author, :category)
  end

end
