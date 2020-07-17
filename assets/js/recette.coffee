---
---

# Countdown
bell = new Audio('/assets/sounds/bell.mp3')
bell.loop = true
countdownInput = document.getElementById "timer-countdown"
actionButton = document.getElementById "timer-action"

# Variantes
variantesButtons = document.getElementsByClassName "variantes-btn"
variantesIngredients = document.getElementsByClassName "variante-ingredients"
variantesEtapes = document.getElementsByClassName "variante-etapes"
variantesCuisson = document.getElementsByClassName "variante-cuisson"
variantesPictures = document.getElementsByClassName "variante-pictures"

# Pictures
pictures = document.getElementsByClassName "recipe-picture"

# Constants
ACTION_PLAY = '▶️'
ACTION_PAUSE = '⏸️'
ACTION_STOP = '⏹️'
ACTION_INVALID = '⛔'
KEYCODE_SPACEBAR = 32

# Global State
state = {
    currentActionButton: ACTION_PLAY
    duration: null
    minutes: null
    seconds: null
    timerInterval: null
}

main = () ->

  # Countdown
  shouldInitCountdown = countdownInput != null && actionButton != null && bell
  if shouldInitCountdown 
    TIMER_DURATION_MINUTES = countdownInput.getAttribute "timerDuration"
    initCountdown(TIMER_DURATION_MINUTES, 0)
    changeActionButton ACTION_PLAY
    initEventsListeners()
  
  # Variantes
  shouldInitVariantes = variantesButtons.length > 0
  if shouldInitVariantes

    # Attach click events to the variante buttons
    for varianteButton in variantesButtons
      varianteButton.addEventListener 'click', (e) -> onVarianteButtonClick(e.target)
    
    # Activate the first variante
    variantesButtons[0].click()

  # No Variantes
  else if pictures.length > 0

    picturesContainer = document.getElementById "gallery"
  
    # Show its picture container
    picturesContainer.classList.remove "hidden"

onVarianteButtonClick = (btn) ->
  varianteId = btn.innerHTML
  ingredientsId = varianteId + "-ingredients"
  etapesId = varianteId + "-etapes"
  cuissonId = varianteId + "-cuisson"
  picturesId = varianteId + "-pictures"

  # Remove all buttons highlighting
  for varianteButton in variantesButtons
    varianteButton.classList.remove "active"

  # Highlight the clicked button
  btn.classList.add "active"

  # Hide all variantes
  for varianteIngredients in variantesIngredients
    varianteIngredients.style.display = 'none' 
  
  for varianteEtape in variantesEtapes
    varianteEtape.style.display = 'none' 

  for varianteCuisson in variantesCuisson
    varianteCuisson.style.display = 'none' 

  for variantePictures in variantesPictures
    variantePictures.style.display = 'none' 

  # Display the right variante
  varianteIngredients = document.getElementById ingredientsId
  if varianteIngredients
    varianteIngredients.style.display = 'block' 
    
  varianteEtapes = document.getElementById etapesId
  if varianteEtapes
    varianteEtapes.style.display = 'block' 

  varianteCuisson = document.getElementById cuissonId
  if varianteCuisson
    varianteCuisson.style.display = 'block' 

  variantePictures = document.getElementById picturesId
  if variantePictures

    hasPictures = variantePictures.getElementsByClassName("recipe-picture").length > 0
    
    if hasPictures
      variantePictures.style.display = 'block' 

initEventsListeners = () ->
  actionButton.addEventListener 'click', () -> onActionButtonClick()
  countdownInput.addEventListener 'focus', (e) -> onCountdownInputFocus(e.target.value)
  countdownInput.addEventListener 'input', (e) -> onCountdownInputChange(e.target.value)
  window.addEventListener 'keyup', (e) -> if e.keyCode == KEYCODE_SPACEBAR then onActionButtonClick()
  window.addEventListener 'keydown', (e) -> if e.keyCode == KEYCODE_SPACEBAR && e.target == document.body then e.preventDefault()
  window.addEventListener 'beforeunload', (e) -> onCloseWindow(e)

onCloseWindow = (e) ->
  if state.currentActionButton != ACTION_PLAY 
    e.preventDefault()
    e.returnValue = ''

onCountdownInputChange = (newValue) -> 
  if validateCountdownValue(newValue) 
    console.log "CHANGING COUNTDOWN to #{newValue}"
    changeActionButton ACTION_PLAY
    parts = newValue.split(":")
    initCountdown(parts[0], parts[1])
  else 
    console.log "INVALID COUNTDOWN"
    changeActionButton ACTION_INVALID
    stopCountdown()

validateCountdownValue = (newValue) -> 
  if /^\d{2}:[0-5][0-9]$/.test(newValue)
    return true
  else return false
      
onCountdownInputFocus = (value) ->
  if validateCountdownValue(value) 
    changeActionButton ACTION_PLAY
    pauseCountdown()

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
  if nextActionButton == ACTION_INVALID
    actionButton.title = "Le format est incorrect. Exemple : #{TIMER_DURATION_MINUTES}:00"
  else 
    actionButton.title = ''

initCountdown = (min, sec) ->
  minutes = parseInt(min, 10)
  seconds = parseInt(sec, 10)
  state.totalSeconds = (minutes * 60) + seconds
  state.minutes = minutes
  state.seconds = seconds
  renderCountdown()

renderCountdown = () ->
  min = if state.minutes < 10 then "0" + state.minutes else state.minutes
  sec = if state.seconds < 10 then "0" + state.seconds else state.seconds
  countdownInput.value = "#{min}:#{sec}"

startCountdown = () ->
  console.log "START COUNTDOWN"
  state.timerInterval = setInterval((() -> tickCountdown()), 1000)

pauseCountdown = () ->
  console.log "PAUSE COUNTDOWN"
  clearInterval(state.timerInterval)

stopCountdown = () ->
  console.log "STOP COUNTDOWN"
  stopSound()

tickCountdown = () ->
  console.log "TICK"
  state.minutes = parseInt(state.totalSeconds / 60, 10)
  state.seconds = parseInt(state.totalSeconds % 60, 10)

  renderCountdown()

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