class CreateAppSettings < ActiveRecord::Migration[7.2]
  def change
    create_table :app_settings do |t|
      t.boolean :auto_delete, null: false, default: false
      t.timestamps
    end

    AppSetting.create
  end
end
