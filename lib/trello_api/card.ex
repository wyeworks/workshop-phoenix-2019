defmodule TrelloApi.Card do
  use Ecto.Schema
  import Ecto.Changeset

  alias TrelloApi.{BoardList, Card, Repo}

  @derive {Jason.Encoder, only: [:id, :text, :board_list_id]}
  schema "cards" do
    field :text, :string
    belongs_to :board_list, BoardList

    timestamps()
  end

  @doc false
  def changeset(card, attrs \\ %{}) do
    card
    |> cast(attrs, [:text, :board_list_id])
    |> validate_required([:text, :board_list_id])
    |> foreign_key_constraint(:board_list_id)
  end

  def create(text, list_id) do
    %Card{text: text, board_list_id: list_id}
    |> changeset()
    |> Repo.insert()
  end

  def get(id) do
    case Repo.get(Card, id) do
      nil -> {:error, :not_found}
      card -> {:ok, card}
    end
  end

  def update(card, text) do
    card
    |> changeset(%{text: text})
    |> Repo.update()
  end
end
