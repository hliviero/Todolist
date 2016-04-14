class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

def self.default_scope
  order(due_date: :asc)
end

end
