module ApplicationHelper
  def devise_error_report(resource)
    render 'devise/shared/error_messages', resource: resource if resource.errors.any?
  end

  def navbar_helper
    html = ''
    if user_signed_in?
      html << "<li> #{link_to 'Log Out', destroy_user_session_path, method: 'delete', class: 'log'} </li>"
      html << "<li> #{link_to current_user.name, user_path(current_user), class: 'user'} </li>"
    else
      html << "<li> #{link_to 'Sign Up', new_user_registration_path, class: 'log'} </li>"
      html << "<li> #{link_to 'Log In', new_user_session_path, class: 'log'} </li>"
    end
    html.html_safe
  end
end
