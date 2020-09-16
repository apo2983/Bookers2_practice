Rails.application.routes.draw do

  root to: 'books#top'
  get '/home/about' => 'users#about'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,except:[:new, :create] do
  	resource :relationships,only: [:create,:destroy]
  	get 'follows' => 'relationships#follower', as: 'follows'
  	get 'followers' => 'relationships#followed', as: 'followers'
  end

  resources :books,except: [:new] do
  	resource :favorites,only: [:create,:destroy]
  	resources :book_comments,only: [:create,:destroy,:index] 
  end

  get '/search' => 'searchs#search'

end
