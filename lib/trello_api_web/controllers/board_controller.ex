defmodule TrelloApiWeb.BoardController do
  use TrelloApiWeb, :controller
  alias TrelloApi.Board

  def index(conn, _params) do
    boards = Board.list_boards()
    json(conn, boards)
  end
end
