Poetas::Application.routes.draw do
  
  root to: "static_pages#home"

  resources :poems

  devise_for :users

  match '/poets',   to: "users#index"
  match '/profile', to: "users#profile"
  match '/contact', to: 'static_pages#contact'
  match '/about',   to: 'static_pages#about'
  match '/profile', to: 'static_pages#profile'

  devise_scope :user do
    match '/signup', to: 'devise/registrations#new'
    match '/signin', to: 'devise/sessions#new'
    match '/logout', to: 'devise/sessions#destroy' 
  end

end
#== Route Map
# Generated on 19 Oct 2012 18:25
#
#                    poems GET    /poems(.:format)          poems#index
#                          POST   /poems(.:format)          poems#create
#                 new_poem GET    /poems/new(.:format)      poems#new
#                edit_poem GET    /poems/:id/edit(.:format) poems#edit
#                     poem GET    /poems/:id(.:format)      poems#show
#                          PUT    /poems/:id(.:format)      poems#update
#                          DELETE /poems/:id(.:format)      poems#destroy
#         new_user_session GET    /users/sign_in(.:format)  devise/sessions#new
#             user_session POST   /users/sign_in(.:format)  devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format) devise/sessions#destroy
# cancel_user_registration GET    /users/cancel(.:format)   devise/registrations#cancel
#        user_registration POST   /users(.:format)          devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)  devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)     devise/registrations#edit
#                          PUT    /users(.:format)          devise/registrations#update
#                          DELETE /users(.:format)          devise/registrations#destroy
#                    poets        /poets(.:format)          users#index
#                  profile        /profile(.:format)        users#profile
#                  contact        /contact(.:format)        static_pages#contact
#                    about        /about(.:format)          static_pages#about
#                                 /profile(.:format)        static_pages#profile
#                   signup        /signup(.:format)         devise/registrations#new
#                   signin        /signin(.:format)         devise/sessions#new
#                   logout        /logout(.:format)         devise/sessions#destroy
