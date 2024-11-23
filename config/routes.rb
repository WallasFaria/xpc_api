Rails.application.routes.draw do
  namespace :v1, constraints: { format: /(json|xml)/ } do
    resources :products do
      get :count, on: :collection
    end
  end
end
