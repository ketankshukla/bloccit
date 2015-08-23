Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/contact'

  #The following line is an implied hash
  #It could also be re-written as root({to: 'welcome#index'})
  root to: 'welcome#index'
end
