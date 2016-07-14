class RegisterUser
  include Interactor::Organizer

  organize SignUpUser, SignInUser
end
