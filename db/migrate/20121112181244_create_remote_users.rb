class CreateRemoteUsers < ActiveRecord::Migration
  def change
    create_table :remote_users do |t|
      t.string :fullname
      t.string :details

      t.timestamps
    end
  end
end
