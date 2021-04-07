Rails.application.routes.draw do
  scope path: '/api' do
    resources :links, only: [:create]
  end

  get '/:id', to: 'links#show'
end
