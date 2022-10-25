class BooksController < ApplicationController
  def new
    @book = Book.new # 空のオブジェクト作成
  end

  def create
    # データを受け取り新規登録
    book = Book.new(book_params)
    # データをdbに保存
    book.save
    # フラッシュメッセージを定義 -> 詳細画面へリダイレクト
    # バリデーション設定時に導入予定
    # 詳細画面にリダイレクト
    redirect_to book_path(book.id)
  end

  def index
    @books = Book.all
  end

  def show
  end

  def edit
    @book = Book.find(book_params[:id])
  end

  def update
  end

  def destroy
    book = Book.find(book_params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

  private
  # ストロングパラメータ
  # book_params -> 保存したデータの絞り込みを行う
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
