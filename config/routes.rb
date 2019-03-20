Rails.application.routes.draw do
# get 'sessions/new'
 # get 'sessions/create'
  # get 'sessions/destroy'
   mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
  resources :notebooks
	get 'notebook/:id/preview' , to: 'notebooks#preview'
  resources :users
     get 'users/:id/notebooks' , to: 'users#notebooks'
  
  resources :sessions, only: [ :new, :create, :destroy ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sessions#new'
 
end
