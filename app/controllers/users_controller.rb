class UsersController < ApplicationController
		before_action :find_user, only: [:show, :destroy, :edit, :update]

	def dashboard
		@user = current_user
		@hosting = @user.events_as_host
		@accepted = @user.events.joins(:tickets).where("tickets.status = ?", "accepted")
		@pending = @user.events.joins(:tickets).where("tickets.status = ?", "pending")
		authorize @user
	end

	def show
        authorize @user
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

	def load_event_tab
		respond_to do |format|               
			format.js
		end        
	end 

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :description, :birthday, :email, :password, :photo)
	end

	def find_user
		@user = User.find(params[:id])
	end
end
