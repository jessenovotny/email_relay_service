class CreateEmails < ActiveRecord::Migration[7.2]
  def change
    create_table :emails do |t|
      t.string :subject
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :email_blast, null: false, foreign_key: true

      t.timestamps
    end
  end
end
