Rails.application.routes.draw do

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
    # #34
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]

  post 'users/confirm' => 'users#confirm'

  #Comment this out because we've declared the index view as the root view below
  #get 'welcome/index'

  #commented out the line below so the users just have to type /about instead of
  #/welcome/about
  #get 'welcome/about'
  get 'about' => 'welcome#about'



  #The following line is an implied hash
  #It could also be re-written as root({to: 'welcome#index'})
  root to: 'welcome#index'
end
