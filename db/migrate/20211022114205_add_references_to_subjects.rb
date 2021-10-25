class AddReferencesToSubjects < ActiveRecord::Migration[5.1]
  def change
    add_reference :subjects, :student, foreign_key: true
  end
end
