module ApplicationHelper
  def measurement_type
    [
      ['volume/liquid'],
      ['weight'],
      ['each'],
    ]
  end

  def measurement
    [
      ['Fluid Ounce'],
      ['Cup'],
      ['Pint'],
      ['Quart'],
      ['Gallon'],
    ]
  end
end
