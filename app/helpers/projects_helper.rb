module ProjectsHelper

  #Helper Method to find a user's projects
  def projects
    projects = current_user.projects
  end

  def project_owner(project, user)
    if project.project_users.where(:user_id => user.id).first.role == 'owner'
      return true
    end
  end
end
