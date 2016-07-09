class AddFeatureToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :feature, :boolean
  end
end
