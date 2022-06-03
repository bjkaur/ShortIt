class CreateUrllinks < ActiveRecord::Migration[7.0]
  def change
    create_table :urllinks do |t|
      t.string :original_url
      t.string :seven_char_string

      t.timestamps
    end
  end
end
