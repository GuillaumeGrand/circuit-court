module UsersHelper
  def user_connexion
    if current_user
      link_to "deconecter", destroy_user_session_path, method: :delete, class: "navbar_link"
    else
      link_to "identifier-vous", new_user_session_path, class: "navbar_link"
    end
  end

  def user_type_link
    if current_user
      if current_user.user_type == "retailer"
        link_to "dashboard", dashboard_path, class: "navbar_link"
      else
        link_to "Mes achats", order_detail_path(current_user), class: "navbar_link"
      end
    else
      link_to "Mes achats", new_user_session_path, class: "navbar_link"
    end
  end



end
