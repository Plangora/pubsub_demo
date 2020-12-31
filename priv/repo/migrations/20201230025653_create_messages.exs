defmodule PubsubDemo.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :message, :text, null: false
      add :message_id, references(:messages, on_delete: :delete_all)

      timestamps()
    end

    create index(:messages, [:message_id])
  end
end
