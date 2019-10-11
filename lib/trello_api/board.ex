defmodule TrelloApi.Board do
  use Ecto.Schema
  import Ecto.Changeset
  alias TrelloApi.{Board, Repo}

  @derive {Jason.Encoder, only: [:id, :name]}
  schema "boards" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(board, attrs \\ %{}) do
    board
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  def create(name) do
    %Board{name: name}
    |> changeset()
    |> Repo.insert()
  end

  def list_boards do
    Repo.all(Board)
  end

  def get_board(id) do
    Repo.get(Board, id)
  end
end
