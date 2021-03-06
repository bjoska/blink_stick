# BlinkStick

[BlinkStick](http://blinkstick.com) is a USB-controlled smart pixel. This gem will help you control it.

Note: This is a work in progress.

This code is based on [Arvydas Juskevicius](https://github.com/arvydas/) [blinkstick-ruby](https://github.com/arvydas/blinkstick-ruby) code.

## Prerequisites

### Libusb
Installation of the libusb package under Debian/Ubuntu:
`sudo apt-get install libusb-1.0-0-dev`

### Udev access
You will also need to grant access to the device in question.

This can be done as follows:

```sh
echo "SUBSYSTEM==\"usb\", ATTR{idVendor}==\"20a0\", ATTR{idProduct}==\"41e5\", MODE:=\"0666\"" | sudo tee /etc/udev/rules.d/85-blinkstick.rules
```

Then reload the udev rules with:

```sh
sudo udevadm control --reload-rules
```

or just reboot your computer.

## Installation

Add this line to your application's Gemfile:

    gem 'blink_stick'

And then execute:

    $ bundle

## Usage

```ruby
# list all blink sticks
BlinkStick.find_all

# find by USB serial
BlinkStick.find_by_serial('BS000563-1.1')

# find first blink stick (you'll probably use this if you only have 1 blink stick connected)
bs = BlinkStick.first

# set color using rgb
bs.color = [255,255,255]
# or hex (with or without leading #)
bs.color = "#00FF00"
# or use css color names (see lib/color/name.rb for list)
bs.color = :blue

# make it blink (it's a BLINK stick, after all)
# blinks current color
bs.blink
# color to blink (see above for accepted color values)
bs.blink('abc123')
# number of times to blink (default: 1)
bs.blink('abc123', { blink: 5 })
# change the frequency/intensity of the blink (default: 0.2)
bs.blink('abc123', { blink: 5, frequency: 0.8 })
# turns the blink stick off after blink (default: previous color)
bs.blink('abc123', { turn_off: true })

# random color
bs.random_color

# turn it off
bs.off

# fade between two colors (see above for accepted color values)
bs.fade([255, 0, 0], [0, 255, 0])
# time it should take (default: 0.5)
bs.fade([255, 0, 0], [0, 255, 0], time: 2)

# pulse color (default: [255, 255, 255]) - think Apple sleep light
bs.pulse([1,2,3])
# number of times to pulsate (default: 2)
bs.pulse(:red, times: 1)

# get serial
# ex: BS000563-1.1
bs.serial

# description (BlinkStick)
bs.description

# manufacturer (Agile Innovative Ltd)
bs.manufacturer
```

### Rake console

You can also run it standalone (good for further gem development) by clonig the repository, and running the following in your shell:

```sh
$ rake console
```


## TODO

- Finish tests (I'm still learning!)
- Cleanup code
- Make sure Color module isn't polluting namespace
- Validation when setting colors
- Error handling
- World domination

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Do not change version number or CHANGELOG.

## Thanks

To [Arvydas Juskevicius](https://github.com/arvydas/) for making the [BlinkStick](http://blinkstick.com) and for providing [example code](https://github.com/arvydas/blinkstick-ruby/) to work from, Thanks!

And [Björn Skarner](https://github.com/bjoska/) for helping me taking the gem one step further and for teaching me how to make tests. Thanks!
