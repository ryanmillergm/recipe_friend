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

  def recipe_type
    [
      ['American'],
      ['Indian'],
      ['Asian'],
      ['Vegan'],
      ['Vegetarian'],
      ['Just good old food']
    ]

  end
end
