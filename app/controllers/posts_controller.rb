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


  private

  def post_params
    params.require(:post).permit(:title, :content, :publish_date, :author, :category)
  end

end
