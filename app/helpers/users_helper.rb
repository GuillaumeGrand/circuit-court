module UsersHelper
  def current_user_type
    current_user.user_type
  end
end
