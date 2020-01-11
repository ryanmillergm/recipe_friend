module ApplicationHelper
  def gravatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    url = "https://gravatar.com/avatar/#{gravatar_id}.png"
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

  def measurement
    [
      ['ounce'],
      ['cup'],
      ['pint'],
      ['quart'],
      ['gallon']
    ]
  end

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
