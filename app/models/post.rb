class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 100}
    validates :category, inclusion: ["Fiction", "Non-Fiction"]
    # validate :category_validation

    # def category_validation
    #     unless (category == "Fiction" || category == "Non-Fiction")
    #         byebug
    #         errors.add(:category, "invalid category")
    #         render json: errors, status: :unprocessable_entity
    #     end
    # end
end
