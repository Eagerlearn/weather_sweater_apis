class Background

  attr_reader :image_url,
              :username

  def initialize(data)
    @image_url = data[:results][0][:urls][:regular]
    @username  = data[:results][0][:user][:username]
  end

end