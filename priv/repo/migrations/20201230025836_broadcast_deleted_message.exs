defmodule PubsubDemo.Repo.Migrations.BroadcastDeletedMessage do
  use Ecto.Migration

  def change do
    execute """
            CREATE OR REPLACE FUNCTION notify_chat_message_deleted()
            RETURNS trigger AS $$
            BEGIN
            PERFORM pg_notify(
            'chat_message_deleted',
            json_build_object(
              'message', json_build_object('id', OLD.id)
            )::text
            );

            RETURN OLD;
            END;
            $$ LANGUAGE plpgsql;
            """,
            "DROP FUNCTION IF EXISTS notify_chat_message_deleted()"

    execute """
            CREATE TRIGGER notify_chat_message_deleted
            BEFORE DELETE
            ON messages
            FOR EACH ROW
            EXECUTE PROCEDURE notify_chat_message_deleted()
            """,
            "DROP TRIGGER IF EXISTS notify_chat_message_deleted ON messages"
  end
end
