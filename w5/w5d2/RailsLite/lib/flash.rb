require 'json'

class Flash

  def initialize(req)
    flash = req.cookies['_rails_lite_app_flash']
    if flash
      @flash = JSON.load(flash)
    else
      @flash = {}
    end
    @flash_now = {}
  end

  def [](key)
    @flash[key.to_sym]
  end

  def []=(key, value)
    @flash[key.to_sym] = value
  end

  def self.now; end

  def now.[](key)
    @flash_now[key]
  end

  def store_flash(res)
    res.set_cookie('_rails_lite_app_flash', @flash.to_json)
  end

end
