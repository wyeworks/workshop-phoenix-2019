defmodule TrelloApiWeb.CardView do
  use TrelloApiWeb, :view

  def render("card.json", %{card: card}) do
    %{
      id: card.id,
      text: card.text
    }
  end
end
