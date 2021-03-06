require 'minitest/autorun'
require 'minitest/pride'
require File.expand_path('../../lib/blink_stick.rb', __FILE__)
require File.expand_path('../../lib/color.rb', __FILE__)

COLOR_HEX_VALUE = "ff007f"
COLOR_RGB_VALUE = [255, 0 ,127]

def random_color
  r = Random.new
  rand = -> { r.rand(255) }
  [rand.call, rand.call, rand.call]
end
