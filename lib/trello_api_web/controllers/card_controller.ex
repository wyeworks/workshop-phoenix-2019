defmodule TrelloApiWeb.CardController do
  use TrelloApiWeb, :controller

  alias TrelloApi.Card

  def create(conn, %{"text" => text, "list_id" => list_id}) do
    case Card.create(text, String.to_integer(list_id)) do
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

  def update(conn, %{"id" => id, "text" => text}) do
    with {:ok, card} <- Card.get(id),
         {:ok, card} <- Card.update(card, text) do
      conn
      |> put_status(:ok)
      |> json(card)
    else
      {:error, :not_found} ->
        conn
        |> put_status(:not_found)
        |> json(%{errors: ["Card not found"]})

      {:error, _changeset} ->
        conn
        |> put_status(:bad_request)
        |> json(%{errors: ["Error updating card"]})
    end
  end
end
