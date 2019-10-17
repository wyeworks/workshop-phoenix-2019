defmodule TrelloApiWeb.BoardChannel do
  use Phoenix.Channel

  alias TrelloApi.BoardList

  @impl true
  def join("board:" <> _board_id, _params, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_in("card_created", %{"list_id" => list_id}, socket) do
    board_list = BoardList.get(list_id)

    broadcast!(socket, "user_created_card", %{list_id: list_id, cards: board_list.cards})

    {:noreply, socket}
  end
end
