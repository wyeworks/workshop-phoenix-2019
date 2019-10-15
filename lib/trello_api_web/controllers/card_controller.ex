defmodule TrelloApiWeb.CardController do
  use TrelloApiWeb, :controller

  alias TrelloApi.Card

  def create(conn, %{"text" => text, "list_id" => list_id}) do
    case Card.create(text, list_id) do
      {:ok, card} ->
        conn
        |> put_status(:created)
        |> json(card)

      {:error, _changeset} ->
        conn
        |> put_status(:bad_request)
        |> json(%{errors: ["Invalid Card"]})
    end
  end
end
