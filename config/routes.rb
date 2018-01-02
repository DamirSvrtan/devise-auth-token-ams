Rails.application.routes.draw do
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: :users, controllers: {
      sessions: 'v1/overrides/sessions'
    }
  end

  resources :posts, only: [:index]
end
