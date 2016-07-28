Tweet::Application.routes.draw do
  match '/auth/:provider/callback' => 'login#create' ,via: [:get, :post]
  match "/signout" => "login#signout",via: [:get, :post]
  match "/tweet" => "login#tweet" ,via: [:get, :post]
  root 'login#index'
end
