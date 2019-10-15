defmodule TrelloApiWeb.BoardView do
  use TrelloApiWeb, :view

  alias TrelloApiWeb.BoardView

  def render("show.json", %{board: board}) do
    render_one(board, BoardView, "board_with_lists.json")
  end

  def render("board_with_lists.json", %{board: board}) do
    %{
      id: board.id,
      name: board.name,
      lists: board.board_lists
    }
  end
end
