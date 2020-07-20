module AdminsHelper
  def approve_user(user)
    user.approved = true
    if user.save
      flash[:success] = "#{user.name} approved!"
      Notification.create!(user_id: user.user.id, content: "You are now approved")
    else
      flash[:danger] = "#{user.name} approval failure"
    end
  end
end
