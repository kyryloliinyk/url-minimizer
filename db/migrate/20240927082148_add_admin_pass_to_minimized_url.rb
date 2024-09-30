# frozen_string_literal: true

class AddAdminPassToMinimizedUrl < ActiveRecord::Migration[7.2]
  def change
    add_column :minimized_urls, :admin_pass, :string
  end
end
