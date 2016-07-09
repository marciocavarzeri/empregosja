class RemoveFeatureFromJob < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :feature, :string
  end
end
