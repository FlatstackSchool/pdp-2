class SessionsController < Devise::SessionsController
  def after_sign_in_path_for(user)
    root_url(subdomain: user.companies.first.subdomain)
  end
end
