class Admin::UsersController < AdminController
  before_action :set_user, except: [:index, :new]

  def index
    @users = User.all
  end

  def show
  end

  def new
    #if params.has_key?(:client_id)
      #redirect_to new_user_invitation_path(client_id: params[:client_id])
    #else
      #redirect_to new_user_invitation_path
    #end
  end

  def edit
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: "User was Tahminated!"
    else
      redirect_to [:edit, :admin, @user ], notice: "This user couldn't be deleted."
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :client_id)
    end
end
