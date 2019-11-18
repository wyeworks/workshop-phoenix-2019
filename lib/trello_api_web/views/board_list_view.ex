defmodule TrelloApiWeb.BoardListView do
  use TrelloApiWeb, :view

  def render("list_with_cards.json", %{board_list: list}) do
    %{
      id: list.id,
      title: list.title,
      cards: render_many(list.cards, TrelloApiWeb.CardView, "card.json")
    }
  end
end
