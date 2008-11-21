# Making Address a subclass Subobject is optional. Subobjects can't be saved
# by themselves; they must belong to another object.
class Address < XGen::Mongo::Subobject

  fields :street, :city, :state, :postal_code
  belongs_to :student

  def to_s
    "#{street}\n#{city}, #{state} #{postal_code}"
  end

end
