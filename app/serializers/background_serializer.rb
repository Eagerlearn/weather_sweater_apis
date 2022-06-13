class BackgroundSerializer
  def self.display_photo(background)
    {
      data: {
        type: "background",
        id: nil,
        attributes: {
          image_url: background.image_url,
          username: background.username
        },
        credit: {
          source: "unsplash.com"
        }
      }
    }
  end
end