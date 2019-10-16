defmodule TrelloApiWeb.BoardView do
  use TrelloApiWeb, :view

  def render("show.json", %{board: board}) do
    %{
      id: board.id,
      name: board.name,
      lists: board.board_lists
    }
  end
end
