class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks

  end

  def new_bookmark
    @bookmark = Bookmark.new
  end

  def create_bookmark
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = List.find(params[:list_id])
    @bookmark.save

    redirect_to list_path(params[:list_id])
  end

  def destroy_bookmark
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(params[:id])
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id, :photo)
  end
end
