class AddLetterPerPageToLetters < ActiveRecord::Migration

  def change
    add_column :letters, :letter_per_page, :integer
  end

end
