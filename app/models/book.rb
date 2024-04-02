class Book < ApplicationRecord
  
  belongs_to :user, dependent: :delete

end
