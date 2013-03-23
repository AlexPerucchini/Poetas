Poetas::Application.routes.draw do
  #devise_for must be the first route for Heroku prod
  devise_for(:users)

  root(to: "static_pages#home")

  resource(:admin, controller: 'admin')

  namespace(:admin) do
    resources(:users) do
      member do
        get('revive')
      end
    end
  end

  resources(:poems) do
    member { post :vote }
  end

  resources(:poets, controller: "users") do
    resources :poems
  end

  match('/profile', to: "users#profile")
  match('/contact', to: 'static_pages#contact')
  match('/about',   to: 'static_pages#about')

  devise_scope(:user) do
    match('/signup', to: 'devise/registrations#new')
    match('/signin', to: 'devise/sessions#new')
    match('/logout', to: 'devise/sessions#destroy')
  end

end
#== Route Map
# Generated on 11 Dec 2012 06:43
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
#                    admin POST   /admin(.:format)                         admin#create
#                new_admin GET    /admin/new(.:format)                     admin#new
#               edit_admin GET    /admin/edit(.:format)                    admin#edit
#                          GET    /admin(.:format)                         admin#show
#                          PUT    /admin(.:format)                         admin#update
#                          DELETE /admin(.:format)                         admin#destroy
#        revive_admin_user GET    /admin/users/:id/revive(.:format)        admin/users#revive
#              admin_users GET    /admin/users(.:format)                   admin/users#index
#                          POST   /admin/users(.:format)                   admin/users#create
#           new_admin_user GET    /admin/users/new(.:format)               admin/users#new
#          edit_admin_user GET    /admin/users/:id/edit(.:format)          admin/users#edit
#               admin_user GET    /admin/users/:id(.:format)               admin/users#show
#                          PUT    /admin/users/:id(.:format)               admin/users#update
#                          DELETE /admin/users/:id(.:format)               admin/users#destroy
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
