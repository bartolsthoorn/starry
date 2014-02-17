# Starry for D3.js
This is a tiny script that draws random (optionally blinking) stars with D3.js.

## Usage
```coffeescript
svg = d3.select('body').append('svg')

# Draw 10 groups of 20 stars (total of 200 stars) 
# inside box of x1, y1, x2, y2
# with 1 second blinking speed
svg.starry('yellow', 0, 0, 100, 100, 10, 20, 1000)

# Because:
# starry(color, x1, y1, x2, y2, groups, stars_per_group, blinking_speed = 0)
# With blinking_speed = 0 the stars will not blink
```

## Dependencies
- Underscore.js
- D3.js
