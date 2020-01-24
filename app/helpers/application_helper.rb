module ApplicationHelper

  def measurement
    [
     ['volume',
       ['fluid ounce','cup', 'pint', 'quart', 'gallon']],
     ['weight',
       ['gram','ounce','pound']],
     ['by_each',
     ['by_each']]
    ]
  end

  def measurement_type
    [
      ['volume'],
      ['weight'],
      ['by_each']
    ]
  end

  def measurement_volume
    [
      ['fluid ounce'],
      ['cup'],
      ['pint'],
      ['quart'],
      ['gallon']
    ]
  end

  # def measurement
  #   [
  #     ['ounce'],
  #     ['cup'],
  #     ['pint'],
  #     ['quart'],
  #     ['gallon']
  #   ]
  # end

  def measurement_weight
    [
      ['ounce'],
      ['pounds']
    ]
  end

  def measurement_each
    [
      ['each']
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
