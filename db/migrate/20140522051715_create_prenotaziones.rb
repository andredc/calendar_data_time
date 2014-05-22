class CreatePrenotaziones < ActiveRecord::Migration
  def change
    create_table :prenotaziones do |t|
      t.string :nome
      t.datetime :Pdata
      t.date :Pgiorno
      t.time :Pora

      t.timestamps
    end
  end
end
