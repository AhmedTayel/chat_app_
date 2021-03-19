Rails.application.routes.draw do 

  resources :rooms, param: :token, only: [:index, :show, :create] do
   resources :chats, param: :number, only: [:index, :show, :create] do 
    resources :messages, param: :message_number, only: [:index, :show, :create]
   end
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
