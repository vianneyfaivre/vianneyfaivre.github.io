---
---

# Variantes
variantesButtons = document.getElementsByClassName "variantes-btn"
variantesIngredients = document.getElementsByClassName "variante-ingredients"
variantesEtapes = document.getElementsByClassName "variante-etapes"
variantesCuisson = document.getElementsByClassName "variante-cuisson"
variantesPictures = document.getElementsByClassName "variante-pictures"
variantesPreconditions = document.getElementsByClassName "variante-preconditions"

# Pictures
pictures = document.getElementsByClassName "recipe-picture"

main = () ->

  # Attach click events to the variante buttons
  for varianteButton in variantesButtons
    varianteButton.addEventListener 'click', (e) -> onVarianteButtonClick(e.target)
  
  # Activate the first variante
  variantesButtons[0].click()

onVarianteButtonClick = (btn) ->
  varianteId = btn.innerHTML
  ingredientsId = varianteId + "-ingredients"
  etapesId = varianteId + "-etapes"
  cuissonId = varianteId + "-cuisson"
  picturesId = varianteId + "-pictures"
  preconditionsId = varianteId + "-preconditions"

  # Remove all buttons highlighting
  for varianteButton in variantesButtons
    varianteButton.classList.remove "active"

  # Highlight the clicked button
  btn.classList.add "active"

  # Hide all variantes
  hideElements variantesIngredients
  hideElements variantesEtapes
  hideElements variantesCuisson
  hideElements variantesPictures
  hideElements variantesPictures
  hideElements variantesPreconditions

  # Display the right variante
  varianteIngredients = document.getElementById ingredientsId
  changeDisplay varianteIngredients, 'block'
    
  varianteEtapes = document.getElementById etapesId
  changeDisplay varianteEtapes, 'block'

  varianteCuisson = document.getElementById cuissonId
  changeDisplay varianteCuisson, 'block'

  variantePrecondition = document.getElementById preconditionsId
  changeDisplay variantePrecondition, 'block'

  variantePictures = document.getElementById picturesId
  if variantePictures

    hasPictures = variantePictures.getElementsByClassName("recipe-picture").length > 0
    
    if hasPictures
      displayElements variantePictures 

changeDisplay = (element, mode) ->
  if element
    element.style.display = mode

hideElements = (elements) ->
  if elements 
    for element in elements
      changeDisplay element, 'none'

displayElements = (elements) ->
  if elements
    for element in elements
      changeDisplay element, 'block'

main()