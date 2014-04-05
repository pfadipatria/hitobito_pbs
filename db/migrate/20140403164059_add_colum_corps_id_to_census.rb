class AddColumCorpsIdToCensus < ActiveRecord::Migration
  def change
    add_column :member_counts, :corps_id, :integer
    end
end
