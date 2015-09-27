Rails.application.routes.draw do

  resources :labels, only: [:show]

  #The 4 get methods below were created when we generated the Posts controller
  #However, there is a way we can refactor all 4 into one method, the resources method
  #as shown below

  #get 'posts/index'

  #get 'posts/show'

  #get 'posts/new'

  #get 'posts/edit'
  #resources :topics
  #resources :posts
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote

  end

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  #Comment this out because we've declared the index view as the root view below
  #get 'welcome/index'

  #commented out the line below so the users just have to type /about instead of
  #/welcome/about
  #get 'welcome/about'
  get 'about' => 'welcome#about'



  #The following line is an implied hash
  #It could also be re-written as root({to: 'welcome#index'})
  root to: 'welcome#index'


=begin
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :topics, only: [:index, :show]
      resources :posts, only: [:index, :show]
      resources :comments, only: [:index, :show]
    end
  end
=end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update]
      resources :topics, except: [:edit, :new] do
        resources :posts, except: [:edit, :new]
      end

      resources :posts, only: [] do
        resources :favorite, only: [:create, :destroy]
        resources :comments, only: [:index, :show]
      end
    end
  end

end
