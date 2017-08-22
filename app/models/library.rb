class Library < BlocRecord::Base
  has_many :books
  belongs_to :user

  def find
    return "Example's Library"
  end
end
