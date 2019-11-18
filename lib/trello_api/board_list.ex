defmodule TrelloApi.BoardList do
  use Ecto.Schema

  import Ecto.Changeset

  alias TrelloApi.{Board, BoardList, Card, Repo}

  schema "board_lists" do
    field :title, :string
    belongs_to :board, Board
    has_many :cards, Card

    timestamps()
  end

  @doc false
  def changeset(list, attrs \\ %{}) do
    list
    |> cast(attrs, [:title, :board_id])
    |> validate_required([:title, :board_id])
    |> foreign_key_constraint(:board_id)
  end

  def get(id) do
    BoardList
    |> Repo.get!(id)
    |> Repo.preload(:cards)
  end
end
