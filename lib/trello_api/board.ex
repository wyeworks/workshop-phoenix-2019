defmodule TrelloApi.Board do
  use Ecto.Schema
  import Ecto.Changeset
  alias TrelloApi.{Board, Repo}

  @derive {Jason.Encoder, only: [:name]}
  schema "boards" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  def create_board(name) do
    %TrelloApi.Board{name: name}
    |> TrelloApi.Repo.insert!()
  end

  def list_boards do
    Repo.all(Board)
  end
end
