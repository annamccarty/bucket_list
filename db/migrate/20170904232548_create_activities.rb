class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.text :body
      t.belongs_to :destination, foreign_key: true

      t.timestamps
    end
  end
end
