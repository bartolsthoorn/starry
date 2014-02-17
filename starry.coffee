# Starry, a tiny script that draws random blinking stars with D3.js
# Author: @BartOlsthoorn
Array.prototype.starry = (
  color, 
  x1, y1, x2, y2, 
  groups, stars_per_group, 
  blinking_speed = 0) ->

  clusters = []
  _(groups).times((i) =>
    group_stars = this.append('g').attr('class', 'starry')
    stars = []

    _(stars_per_group).times((s) =>
      stars.push(
        [ 
          _.random(x1, x2),
          _.random(y1, y2)
        ]
      )
    )

    clusters.push(
      group_stars.selectAll('circle.star')
      .data(stars)
      .enter()
      .append('svg:circle')
      .attr('r', (star) -> _.random(1, 2))
      .attr('cx', (star) -> star[0])
      .attr('cy', (star) -> star[1])
      .attr('fill', color)
      .style('opacity', (star) -> _.random(1, 100) / 100)
    )
  )

  if blinking_speed > 0
    _.each(clusters, (cluster) ->
      blink = () =>
        cluster.transition().style('opacity', (star) -> 
          _.random(0,100) / 100
        ).duration(blinking_speed)
      setInterval(blink, blinking_speed)
      blink()
    )
