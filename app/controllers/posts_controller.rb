class PostsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :category_validation

  def index
    render json: Post.all
  end

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])

    post.update!(post_params)

    render json: post
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def category_validation(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    
  end

end
