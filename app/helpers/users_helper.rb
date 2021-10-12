module UsersHelper
  def user_connexion
    current_user ? 
    (link_to "deconecter", destroy_user_session_path, method: :delete, class: "navbar_link") : 
    (link_to "identifier-vous", new_user_session_path, class: "navbar_link")
  end

  def user_type_link
    current_user ? user_dashboard : (link_to "Mes achats", new_user_session_path, class: "navbar_link")
  end

  private

  def user_dashboard
    current_user.user_type == "retailer" ?
      (link_to "dashboard", dashboard_path, class: "navbar_link") :
      (link_to "Mes achats", order_detail_path(current_user), class: "navbar_link")
  end



end
