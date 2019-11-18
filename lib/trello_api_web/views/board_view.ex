defmodule TrelloApiWeb.BoardView do
  use TrelloApiWeb, :view

  def render("show.json", %{board: board}) do
    %{
      id: board.id,
      name: board.name,
      lists: render_many(board.board_lists, TrelloApiWeb.BoardListView, "list_with_cards.json")
    }
  end

  def render("index.json", %{boards: boards}) do
    render_many(boards, __MODULE__, "board.json")
  end

  def render("board.json", %{board: board}) do
    %{
      id: board.id,
      name: board.name
    }
  end
end
