defmodule TrelloApiWeb.BoardView do
  use TrelloApiWeb, :view

  def render("board_with_lists.json", %{board: board}) do
    %{
      id: board.id,
      name: board.name
    }
  end

  def render("boards.json", %{boards: boards}) do
    render_many(boards, __MODULE__, "board.json")
  end

  def render("board.json", %{board: board}) do
    %{
      id: board.id,
      name: board.name
    }
  end
end
