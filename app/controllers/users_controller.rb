class UsersController < ApplicationController
		before_action :find_user, only: [:show, :destroy, :edit, :update]

	def dashboard
		@user = current_user
		@events = Event.where(user: @user)
		authorize @user
		authorize @events
	end

	def show
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to :show
		else
			render :edit
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		raise
		if @user.save
			redirect_to :index
		else
			render :new
		end
	end

	def destroy
		@user.destroy
		redirect_to :index
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :description, :birthday, :email, :password, :photo)
	end

	def find_user
		@user = User.find(params[:id])
	end
end
