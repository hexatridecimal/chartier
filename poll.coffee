toWidth = (percent)->
  'width: ' + (percent * 100).round + 'px'

poll = ->
  goal = 1000000 / 11.17000
  console.log("Polling...")
  $.getJSON "/status.json", (data)->
    block   = data['most_recent_block']
    prevent = data['prevent'] / goal # Prevent full release: 1HeF89wMjC48bWNgWvVo7Wu3RaLW8XVsE8
    release = data['release'] / goal # Promote full release: 12AP6iCwRNFQqKLStH3A4b4hw3SL6RaNgB
    $('#prevent').attr('style', toWidth(prevent))
    $('#release').attr('style', toWidth(release))
$(document).ready ->
  window.setInterval(poll, 10000)
