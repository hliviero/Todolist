class TodoList < ActiveRecord::Base
  belongs_to :user
  has_many :todo_items, dependent: :destroy

  def self.default_scope
    order(list_due_date: :asc)
  end
  
end
