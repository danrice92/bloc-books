class Book < BlocRecord::Base
  belongs_to :library
  belongs_to :user
end
