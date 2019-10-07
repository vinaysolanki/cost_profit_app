class ModifyTableEntry1236
  include Clear::Migration

  def change(dir)
    dir.up do
      add_column("entries", "ad_cost", "Int")
      add_column("entries", "cogs", "Int")
      add_column("entries", "profit", "Int")
      drop_column("entries", "name", "Varchar")
    end

    dir.down do
      execute("ALTER TABLE ENTRIES DROP COLUMN AD_COST")
      execute("ALTER TABLE ENTRIES DROP COLUMN COGS")
      execute("ALTER TABLE ENTRIES DROP COLUMN PROFIT")
    end
  end
end
