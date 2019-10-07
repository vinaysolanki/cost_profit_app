class ModifyTableEntry1237
  include Clear::Migration

  def change(dir)
    dir.up do
      add_column("entries", "date", "Date")
    end

    dir.down do
      execute("ALTER TABLE ENTRIES DROP COLUMN DATE")
    end
  end
end
