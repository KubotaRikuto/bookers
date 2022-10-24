Rails.application.routes.draw do
  get 'homes/top' # アプリケーショントップ画面
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books #booksコントローラに紐づくルーティング(以下確認したルーティング)
    # index
    # create
    # new
    # edit
    # show
    # update
    # destroy
end
