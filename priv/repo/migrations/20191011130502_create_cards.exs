defmodule TrelloApi.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :text, :text
      add :board_list_id, references(:board_lists, on_delete: :nothing), null: false

      timestamps()
    end
  end
end
