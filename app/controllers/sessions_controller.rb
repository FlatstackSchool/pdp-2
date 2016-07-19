class SessionsController < Devise::SessionsController
  def after_sign_in_path_for(user)
    root_url(subdomain: user.companies.first.subdomain)
  end

  def after_sign_out_path_for(user)
    root_url(subdomain: nil)
  end
end
