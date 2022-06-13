class BackgroundsFacade
  def self.get_background(city)
    city_background = BackgroundsService.search_for_backgrounds(city)

    Background.new(city_background)
  end
end
