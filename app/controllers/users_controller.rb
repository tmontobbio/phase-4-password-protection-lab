class UsersController < ApplicationController
    wrap_parameters format: [] 
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    def create
        new_user = User.create!(user_params)
        session[:user_id] = new_user.id
        render json: new_user, status: :created
    end

    def show
        # finding a user by id, where their id matches the :user_id of the session hash
        user = User.find_by(id: session[:user_id])
        if user
          render json: user, status: :accepted
        else
          render json: {error:"Not logged in"}, status: :unauthorized
        end
    end

    private 

    def invalid_record(e)
        render json: {errors: e.record.errors}, status: :unprocessable_entity
    end

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end
end
