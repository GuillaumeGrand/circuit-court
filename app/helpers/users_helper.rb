module UsersHelper
  def current_user_type
    if current_user
      link_to "deconecter", destroy_user_session_path, method: :delete, class: "navbar_link"
    else
      link_to "identifier-vous", new_user_session_path, class: "navbar_link"
    end
  end
end
