defmodule TrelloApiWeb.BoardController do
  use TrelloApiWeb, :controller

  alias TrelloApi.Board

  def create(conn, %{"name" => name}) do
    case Board.create(name) do
      {:ok, board} ->
        conn
        |> put_status(:created)
        |> json(board)

      {:error, _changeset} ->
        conn
        |> put_status(:bad_request)
        |> json(%{errors: ["Invalid Board"]})
    end
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
