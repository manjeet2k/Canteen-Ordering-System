module AdminsHelper
  def approve_profile(profile)
    profile.approved = true

    if profile.save
      flash[:success] = "#{profile.name} approved!"
      Notification.create!(user_id: profile.user.id, content: "You are now approved")
    else
      flash[:danger] = "#{profile.name} approval failure"
    end
  end

  def reject_profile(profile)
    profile.rejected = true
    
    if profile.save
      flash[:success] = "#{profile.name} rejected!"
      Notification.create!(user_id: profile.profile.id, content: "Your Profile was not approved")
    else
      flash[:danger] = "#{profile.name} rejection failure"
    end
  end
end
