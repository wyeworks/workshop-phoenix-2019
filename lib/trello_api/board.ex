defmodule TrelloApi.Board do
  use Ecto.Schema

  import Ecto.Changeset

  alias TrelloApi.{Board, BoardList, Repo}

  @default_lists ["ToDo", "Doing", "Done"]

  @derive {Jason.Encoder, only: [:id, :name]}
  schema "boards" do
    field :name, :string
    has_many :board_lists, BoardList

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
    |> case do
      {:ok, board} ->
        lists =
          Enum.map(@default_lists, fn title ->
            %{
              title: title,
              board_id: board.id,
              inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
              updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
            }
          end)

        Repo.insert_all(BoardList, lists)

        {:ok, board |> Repo.preload(:board_lists)}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  def list_boards do
    Repo.all(Board)
  end

  def get_board(id) do
    Repo.get(Board, id)
  end
end
