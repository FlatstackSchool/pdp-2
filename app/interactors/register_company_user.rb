class RegisterCompanyUser
  include Interactor::Organizer

  organize SignUpCompanyUser, SignInUser
end
