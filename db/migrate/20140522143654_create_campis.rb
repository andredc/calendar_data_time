class CreateCampis < ActiveRecord::Migration
  def change
    create_table :campis do |t|
      t.string :nomecampo
      t.string :tipocampo

      t.timestamps
    end
  end
end
