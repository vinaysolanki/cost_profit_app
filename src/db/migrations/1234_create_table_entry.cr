class CreateTableEntry
  include Clear::Migration

  def change(dir)
    dir.up do
      create_table(:entries) do |t|
        t.column :name, :string
        t.timestamps
      end
    end

    dir.down do
      execute("DROP TABLE entries")
    end
  end
end
