Poetas::Application.routes.draw do
  
  #must be places above the users resources
  devise_for :users

  root to: "static_pages#home"
  resources :poems
  
  resources :poets, controller: "users" do
    resources :poems
  end

  match '/profile', to: "users#profile"
  match '/contact', to: 'static_pages#contact'
  match '/about',   to: 'static_pages#about'

  devise_scope :user do
    match '/signup', to: 'devise/registrations#new'
    match '/signin', to: 'devise/sessions#new'
    match '/logout', to: 'devise/sessions#destroy' 
  end

end
#== Route Map
# Generated on 11 Nov 2012 08:06
#
#             user_session POST   /users/sign_in(.:format)                 devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                devise/sessions#destroy
# cancel_user_registration GET    /users/cancel(.:format)                  devise/registrations#cancel
#        user_registration POST   /users(.:format)                         devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                 devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                    devise/registrations#edit
#                          PUT    /users(.:format)                         devise/registrations#update
#                          DELETE /users(.:format)                         devise/registrations#destroy
#                     root        /                                        static_pages#home
#                    poems GET    /poems(.:format)                         poems#index
#                          POST   /poems(.:format)                         poems#create
#                 new_poem GET    /poems/new(.:format)                     poems#new
#                edit_poem GET    /poems/:id/edit(.:format)                poems#edit
#                     poem GET    /poems/:id(.:format)                     poems#show
#                          PUT    /poems/:id(.:format)                     poems#update
#                          DELETE /poems/:id(.:format)                     poems#destroy
#               poet_poems GET    /poets/:poet_id/poems(.:format)          poems#index
#                          POST   /poets/:poet_id/poems(.:format)          poems#create
#            new_poet_poem GET    /poets/:poet_id/poems/new(.:format)      poems#new
#           edit_poet_poem GET    /poets/:poet_id/poems/:id/edit(.:format) poems#edit
#                poet_poem GET    /poets/:poet_id/poems/:id(.:format)      poems#show
#                          PUT    /poets/:poet_id/poems/:id(.:format)      poems#update
#                          DELETE /poets/:poet_id/poems/:id(.:format)      poems#destroy
#                    poets GET    /poets(.:format)                         users#index
#                          POST   /poets(.:format)                         users#create
#                 new_poet GET    /poets/new(.:format)                     users#new
#                edit_poet GET    /poets/:id/edit(.:format)                users#edit
#                     poet GET    /poets/:id(.:format)                     users#show
#                          PUT    /poets/:id(.:format)                     users#update
#                          DELETE /poets/:id(.:format)                     users#destroy
#                  profile        /profile(.:format)                       users#profile
#                  contact        /contact(.:format)                       static_pages#contact
#                    about        /about(.:format)                         static_pages#about
#                   signup        /signup(.:format)                        devise/registrations#new
#                   signin        /signin(.:format)                        devise/sessions#new
#                   logout        /logout(.:format)                        devise/sessions#destroy
