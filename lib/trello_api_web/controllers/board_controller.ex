defmodule TrelloApiWeb.BoardController do
  use TrelloApiWeb, :controller
  alias TrelloApi.Board

  def create(conn, %{"name" => name}) do
    board = Board.create_board(name)
    json(conn, board)
  end

  def index(conn, _params) do
    boards = Board.list_boards()
    json(conn, boards)
  end

  def show(conn, %{"id" => id}) do
    board = Board.get_board(id)
    json(conn, board)
  end
end
