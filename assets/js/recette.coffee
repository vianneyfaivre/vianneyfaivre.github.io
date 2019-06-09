---
---
ACTION_PLAY = '▶️'
ACTION_PAUSE = '⏸️'
ACTION_STOP = '⏹️'
KEYCODE_SPACEBAR = 32

bell = new Audio('/assets/sounds/bell.mp3')
bell.loop = true
countdownEl = document.getElementById "timer-countdown"
TIMER_DURATION_MINUTES = countdownEl.getAttribute "timerDuration"
actionButton = document.getElementById "timer-action"

state = {
    currentActionButton: ACTION_PLAY
    duration: null
    minutes: null
    seconds: null
    timerInterval: null
}

main = () ->
  shouldInit = countdownEl && actionButton && bell
  if shouldInit 
    initCountdown()
    initActionButton()
    initKeystrokesEvents()

initActionButton = () ->
  changeActionButton ACTION_PLAY
  actionButton.addEventListener 'click', () -> onActionButtonClick()

initKeystrokesEvents = () -> 
  window.addEventListener 'keyup', (e) -> if e.keyCode == KEYCODE_SPACEBAR then onActionButtonClick()
  window.addEventListener 'keydown', (e) -> if e.keyCode == KEYCODE_SPACEBAR && e.target == document.body then e.preventDefault()

onActionButtonClick = () ->
  if state.currentActionButton == ACTION_PLAY 
    # PLAY
    changeActionButton ACTION_PAUSE
    startCountdown()
  else if state.currentActionButton == ACTION_PAUSE 
    # PAUSE
    changeActionButton ACTION_PLAY
    pauseCountdown()
  else if state.currentActionButton == ACTION_STOP
    # STOP
    changeActionButton ACTION_PLAY
    stopCountdown()

changeActionButton = (nextActionButton) -> 
  state.currentActionButton = nextActionButton
  actionButton.innerHTML = state.currentActionButton

initCountdown = () ->
  state.totalSeconds = TIMER_DURATION_MINUTES * 60
  state.minutes = TIMER_DURATION_MINUTES
  state.seconds = "00"
  countdownEl.innerHTML = "#{state.minutes}:#{state.seconds}"

startCountdown = () ->
  console.log "START COUNTDOWN"
  state.timerInterval = setInterval((() -> tickCountdown()), 1000)

pauseCountdown = () ->
  console.log "PAUSE COUNTDOWN"
  clearInterval(state.timerInterval)

stopCountdown = () ->
  console.log "STOP COUNTDOWN"
  stopSound()
  initCountdown()

tickCountdown = () ->
  console.log "TICK"
  state.minutes = parseInt(state.totalSeconds / 60, 10)
  state.seconds = parseInt(state.totalSeconds % 60, 10)
  
  state.minutes = if state.minutes < 10 then "0" + state.minutes else state.minutes
  state.seconds = if state.seconds < 10 then "0" + state.seconds else state.seconds

  countdownEl.innerHTML = "#{state.minutes}:#{state.seconds}"

  if (state.totalSeconds-- == 0) then endCountdown()

endCountdown = () ->
  console.log "END COUNTDOWN"
  clearInterval(state.timerInterval)
  playSound()
  changeActionButton ACTION_STOP

playSound = () ->
  console.log "PLAY SOUND"
  bell.play()

stopSound = () ->
  console.log "STOP SOUND"
  bell.pause()
  bell.currentTime = 0

main()