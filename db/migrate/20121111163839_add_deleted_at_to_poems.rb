class AddDeletedAtToPoems < ActiveRecord::Migration
  def change
    add_column :poems, :deleted_at, :datetime
  end
end
