module ProjectsHelper

  #Helper Method to find a user's projects
  def projects
    projects = current_user.projects
  end
end
