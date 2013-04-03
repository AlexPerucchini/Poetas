### Utility Methods ###
def create_visitor
  @visitor ||= { name:'Testy McUserton', email:'example@example.com',
                 password:'changeme', password_confirmation:'changeme' }
end

def delete_user
  @user ||= User.where(email:@visitor[:email]).first
  @user.destroy unless @user.nil?
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, @visitor)
end

def sign_in
  visit signin_path
  fill_in "user_email", with:@visitor[:email]
  fill_in "user_password", with:@visitor[:password]
  click_button "Sign in"
end

#------- Uncomment this so failing scenarios launch in the browser
# After do |scenario|
#    save_and_open_page if scenario.failed?
# end
