# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

Taskflow::Application.routes.draw do


  # Resource routes for controller tasks
  resources :tasks

  # Owner routes for controller tasks
  resources :workdays, :as => :workday, :only => [] do
    resources :tasks, :only => [] do
      collection do
        post 'create', :action => 'create_for_workday'
      end
    end
  end


  # Resource routes for controller projects
  resources :projects


  # Resource routes for controller workdays
  resources :workdays


  # Resource routes for controller project_users
  resources :project_users


  # Resource routes for controller users
  resources :users, :only => [:edit, :show, :create, :update, :destroy] do
    collection do
      post 'signup', :action => 'do_signup'
      get 'signup'
    end
    member do
      get 'account'
      put 'reset_password', :action => 'do_reset_password'
      get 'reset_password'
    end
  end

  # User routes for controller users
  match 'login(.:format)' => 'users#login', :as => 'user_login'
  get 'logout(.:format)' => 'users#logout', :as => 'user_logout'
  match 'forgot_password(.:format)' => 'users#forgot_password', :as => 'user_forgot_password'

end
