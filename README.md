# better_am_pm

A gem monkey-patching Rails to provide user-friendly 12-hour time select form controls.

## Why?

The default Rails time select control (for 3.2+) gives two select menus: an hours menu with values 00..23, and a minutes menu with values 00..59. The minutes are fine, but for users in regions where 12-hour time is prevalent, the hours present an extra challenge.

Rails allows developers to pass an option (`ampm: true`) to use 12-hour hour inputs, but this replaces the labels for values 00..23 with 12 AM, 01 AM, 02 AM, etc. This results in selectors which read like this:

> 07AM:30

...which isn't very good-looking and an extra cognitive load on the end-user.

In this library, we add an additional option (`twelve_hour: true`) which removes the trailing "AM" and "PM" from these options and instead wraps the hour options in two `optgroup` tags, labeled `am` and `pm`. This allows the user to clearly see which hours are AM and which are PM, but also lets the time selector read more smoothly (i.e. "7:30").

## Notes

* Selected times won't show a meridian, so developers may wish to provide an additional control, perhaps adjusted with Javascript, to show the meridian based on the selected hour.

* If the `leading_zeros` option is set to `false` it will remove leading zeroes from the hours 0-9. (This is Rails' existing option, not something added with this patch.)

## TODO

* ***TESTS***

* Gemfile/requirements (force Rails >= 3.2).

* Anything to simplify the code, ideally calling "super" wherever possible and only touching where we need to.

* Add a meridian-display option and scripts.

* Default handling.
