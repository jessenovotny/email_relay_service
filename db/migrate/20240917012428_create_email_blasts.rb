class CreateEmailBlasts < ActiveRecord::Migration[7.2]
  def change
    create_table :email_blasts do |t|
      t.string :subject
      t.text :body
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
