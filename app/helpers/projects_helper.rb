module ProjectsHelper

  #Method:Helper to find a user's projects
  def projects
    projects = current_user.projects
  end

  #Method:Helper to check if the user signed-in is the owner of the project to allow sprint creation
  def project_owner(project, user)
    if project.project_users.where(:user_id => user.id).first.role == 'owner'
      return true
    end
  end

  #Method:Helper to check if the currently opened project has any sprints.
  #Used for displaying Sprints in the show action of Projects
  def has_sprints
    if @project.sprints.present?
      return @project.sprints
    end
  end
end
