defmodule TrelloApi.Board do
  use Ecto.Schema

  import Ecto.Changeset

  alias TrelloApi.{Board, BoardList, Repo}

  @default_lists ["ToDo", "Doing", "Done"]

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
    %Board{}
    |> changeset(%{name: name})
    |> Repo.insert()
    |> after_insertion()
  end

  def list_boards do
    Repo.all(Board)
  end

  def get_board(id) do
    Repo.get!(Board, id)
    |> Repo.preload(:board_lists)
  end

  defp after_insertion({:ok, board}), do: create_default_lists(board)
  defp after_insertion({:error, _changeset} = result), do: result

  defp create_default_lists(board) do
    lists =
      Enum.map(@default_lists, fn title ->
        %{
          title: title,
          board_id: board.id,
          inserted_at: time_now(),
          updated_at: time_now()
        }
      end)

    Repo.insert_all(BoardList, lists)

    {:ok, board |> Repo.preload(:board_lists)}
  end

  defp time_now(), do: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
end
