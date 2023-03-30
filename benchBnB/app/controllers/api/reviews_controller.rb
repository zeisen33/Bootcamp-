class Api::ReviewsController < ApplicationController
    wrap_parameters include: Review.attribute_names


    def create
        @review = Review.new(review_params)
        if @review.user === current_user
            if @review.save
                render :show
            else
                render json: { errors: @review.errors.full_messages }, status: 422
            end
        else
            render json: { errors: 'Current User does not match Reviewing User'}
        end
    end

    def destroy
        @review = Review.find_by(id: params[:id])
        if @review.user === current_user
            @review.destroy
        else
            render json: { errors: "Cannot delete another user's review" }, status: :unauthorized
        end
    end

    private
    def review_params
        params.require(:review).permit(:rating, :body, :text, :bench_id, :user_id)
    end
end
