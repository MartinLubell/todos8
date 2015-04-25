class CreateTagsTodoitems < ActiveRecord::Migration
  def change
    create_table :tags_todoitems, id:false do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :todoitem, index: true, foreign_key: true
    end

  end
end
