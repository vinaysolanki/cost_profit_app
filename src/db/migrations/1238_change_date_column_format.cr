class ModifyTableEntry1238
  include Clear::Migration

  def change(dir)
    dir.up do
      execute("ALTER TABLE ENTRIES ALTER COLUMN DATE TYPE TIMESTAMP WITH TIME ZONE")
    end

    dir.down do
      execute("ALTER TABLE ENTRIES ALTER COLUMN DATE TYPE DATE")
    end
  end
end
