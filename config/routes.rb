Rails.application.routes.draw do
  
  resources :pages do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end
  resources :gameimages do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end
  resources :words do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end
  resources :bigimages do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end
  
  resources :languages do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end
  root :to => 'apartments#index'
  resources :apartments do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end
  resources :photos do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end
  resources :inline_forms_translations do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end
  resources :inline_forms_keys do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end
  resources :inline_forms_locales do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end
  mount Ckeditor::Engine => '/ckeditor'
  resources :roles do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end
  resources :locales do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end
  devise_for :users, :path_prefix => 'auth'
    resources :users do
      post 'revert', :on => :member
      get 'list_versions', :on => :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
