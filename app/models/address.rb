class Address

  attr_accessor :street, :city, :state, :postal_code

  def initialize(street="", city="", state="", postal_code="")
    @street, @city, @state, @postal_code = street, city, state, postal_code
  end

  def to_s
    "#{street}\n#{city}, #{state} #{postal_code}"
  end

end
