defmodule TrelloApi.BoardList do
  use Ecto.Schema

  import Ecto.Changeset

  alias TrelloApi.Board

  @derive {Jason.Encoder, only: [:id, :title, :board_id]}
  schema "board_lists" do
    field :title, :string
    belongs_to :board, Board

    timestamps()
  end

  @doc false
  def changeset(list, attrs \\ %{}) do
    list
    |> cast(attrs, [:title, :board_id])
    |> validate_required([:title, :board_id])
    |> foreign_key_constraint(:board_id)
  end
end
