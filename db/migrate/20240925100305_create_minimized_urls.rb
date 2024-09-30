# frozent_string_literal: true

class CreateMinimizedUrls < ActiveRecord::Migration[7.2]
  def change
    create_table :minimized_urls do |t|
      t.string :origin, null: false, default: '', index: { unique: true }
      t.string :short, null: false, default: '', index: { unique: true }
      t.integer :visits_count, null: false, default: 0
      t.timestamps
    end
  end
end
