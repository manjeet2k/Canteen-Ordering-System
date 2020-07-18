module AdminsHelper
  def approve_user
    @user.approved = true
    if @user.save
      flash[:success] = "#{@user.name} approved!"
    else
      flash[:danger] = "#{@user.name} approval failure"
    end
  end
end
