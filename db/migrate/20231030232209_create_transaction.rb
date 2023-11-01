class CreateTransaction < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.bigint :credit_card_number
      t.string :credit_card_expiration_date
      t.integer :result

      t.timestamps
    end
  end
end
