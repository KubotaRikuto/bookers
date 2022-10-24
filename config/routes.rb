Rails.application.routes.draw do
  # top画面をルートパス設定にする
  root to: 'homes#top' # アプリケーショントップ画面
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books #booksコントローラに紐づくルーティング(以下確認したルーティング)
    # index
    # create
    # newgit 
    # edit
    # show
    # update
    # destroy
end
