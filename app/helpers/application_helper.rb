module ApplicationHelper
  def measurement_type
    [
      ['volume'],
      ['weight'],
      ['by_each'],
    ]
  end

  def measurement
    [
      ['fluid Ounce'],
      ['cup'],
      ['pint'],
      ['quart'],
      ['gallon'],
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

  def ingredient_type
    [
      ['spice'],
      ['vegetable']
    ]
  end
end
