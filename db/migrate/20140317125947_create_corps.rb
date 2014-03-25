class CreateCorps < ActiveRecord::Migration
  def change
    create_table :corps do |t|

      t.timestamps
    end
  end
end
