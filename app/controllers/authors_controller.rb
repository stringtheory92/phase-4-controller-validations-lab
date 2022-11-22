class AuthorsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :return_invalid_record_error
  
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)

    render json: author, status: :created
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end
  
  def return_invalid_record_error(invalid)
    render json: {error: invalid.record.errors}, status: :unprocessable_entity
  end
end
