# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :description, null: false, default: ''

      t.text :image_data, null: false

      t.timestamps
    end
  end
end
