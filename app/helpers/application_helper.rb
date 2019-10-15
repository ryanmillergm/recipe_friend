module ApplicationHelper
  def measurement_type
    [
      ['volume'],
      ['weight'],
      ['by_each'],
    ]
  end

  def measurement_volume
    [
      ['fluid ounce'],
      ['cup'],
      ['pint'],
      ['quart'],
      ['gallon'],
    ]
  end

  def measurement
    [
      ['ounce'],
      ['cup'],
      ['pint'],
      ['quart'],
      ['gallon'],
    ]
  end

  def measurement_weight
    [
      ['fluid Ounce'],
      ['cup'],
      ['pint'],
      ['quart'],
      ['gallon'],
    ]
  end

  def measurement_each
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
      ['Asian'],
      ['Indian'],
      ['Italian'],
      ['Mexican'],
      ['Vegan'],
      ['Vegetarian'],
      ['Just good old food']
    ]

  end

  def ingredient_type
    [
      ['herb'],
      ['fruit'],
      ['liquid'],
      ['protein'],
      ['spice'],
      ['vegetable']
    ]
  end
end
