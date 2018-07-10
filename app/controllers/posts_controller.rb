class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    #@post = Post.find(params[:id])
    binding.pry
    @post.valid?
    if @post.update(post_params)
      #@post.update(post_params)
      redirect_to post_path(@post)
    else
      binding.pry
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
