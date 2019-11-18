defmodule TrelloApiWeb.BoardView do
  use TrelloApiWeb, :view

  def render("show.json", %{board: board}) do
    %{
      id: board.id,
      name: board.name,
      lists: board.board_lists
    }
  end

  def render("index.json", %{boards: boards}) do
    render_many(boards, TrelloApiWeb.BoardView, "board.json")
  end

  def render("board.json", %{board: board}) do
    %{
      id: board.id,
      name: board.name
    }
  end
end
