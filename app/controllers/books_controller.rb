class BooksController < ApplicationController
  def new
  end

  def create
    # データを受け取り新規登録
    @book = Book.new(book_params)
    # データをdbに保存
    if @book.save
      # フラッシュメッセージを定義 -> 詳細画面へリダイレクト
      flash[:notice] = "Book was successfully created."
      # 詳細画面にリダイレクト
      redirect_to book_path(@book.id)
    else
      @books = Book.all # index表示時のレコードを取得
      render :index # ":アクション名"のviewを表示
    end
  end

  def index
    @book = Book.new # 空のオブジェクト作成 投稿フォーム用
    @books = Book.all #一覧表示用
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "Book was sccessfully updated."
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroy."
    redirect_to books_path
  end

  private
  # ストロングパラメータ
  # book_params -> 保存したデータの絞り込みを行う
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
