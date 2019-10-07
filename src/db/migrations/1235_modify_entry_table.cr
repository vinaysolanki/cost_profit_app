class ModifyTableEntry
  include Clear::Migration

  def change(dir)
    dir.up do
      add_column("entries", "revenue", "Int")
    end

    dir.down do
      execute("ALTER TABLE ENTRIES DROP COLUMN REVENUE")
    end
  end
end
