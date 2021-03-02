Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions',
									confirmations: 'users/confirmations',
									mailer: 'users/mailer',
									passwords: 'users/passwords',
									registrations: 'users/registrations',
									shared: 'users/shared'}
	root "articles#index"

	resources :articles do
		resources :comments
	end
end
