---
---

# Variantes
variantesButtons = document.getElementsByClassName "variantes-btn"
variantesIngredients = document.getElementsByClassName "variante-ingredients"
variantesEtapes = document.getElementsByClassName "variante-etapes"
variantesPictures = document.getElementsByClassName "variante-pictures"
variantesPreconditions = document.getElementsByClassName "variante-preconditions"
variantesTitles = document.getElementsByClassName "variante-title"
variantesUtensils = document.getElementsByClassName "variante-utensils"

# Pictures
pictures = document.getElementsByClassName "recipe-picture"

main = () ->

  #
  # Attach click events to the variante buttons
  #
  for varianteButton in variantesButtons
    varianteButton.addEventListener 'click', (e) -> onVarianteButtonClick(e.target)
  
  #
  # Activate the right recipe
  #
  selectedRecipe = decodeURI(window.location.hash.split("#")[1])
  foundRecipe = false

  if selectedRecipe
    for varianteButton in variantesButtons
      if varianteButton.innerHTML == selectedRecipe
        varianteButton.click()
        foundRecipe = true
        
  if foundRecipe == false
    variantesButtons[0].click()

  #
  # Attach change events to the variable ingredients of each variante
  #
  for varianteIngredients in variantesIngredients
    
    # Handle Variable Ingredients (if enabled)
    ingredientsInputs = varianteIngredients.getElementsByClassName "ingredient-qte-variable"

    if ingredientsInputs && ingredientsInputs[0] 
      
      # There should be only one variable ingredient
      ingredientsInput = ingredientsInputs[0] 

      console.debug "Found variable ingredient. Setting up onChange listener"

      ingredientsInput.addEventListener 'input', (e) -> onQuantityChange(e.target, e.target.getAttribute("data-varianteId"))

onVarianteButtonClick = (btn) ->
  varianteId = btn.innerHTML
  ingredientsId = varianteId + "-ingredients"
  etapesId = varianteId + "-etapes"
  picturesId = varianteId + "-pictures"
  preconditionsId = varianteId + "-preconditions"
  titleId = varianteId + "-title"
  utensilsId = varianteId + "-utensils"

  # Update URL hash
  if variantesButtons.length > 1 
    window.location.replace("#" + varianteId)

  # Remove all buttons highlighting
  for varianteButton in variantesButtons
    varianteButton.classList.remove "active"

  # Highlight the clicked button
  btn.classList.add "active"

  # Hide all variantes
  hideElements variantesIngredients
  hideElements variantesEtapes
  hideElements variantesPictures
  hideElements variantesPreconditions
  hideElements variantesTitles
  hideElements variantesUtensils

  # Display the right variante
  varianteIngredients = document.getElementById ingredientsId
  changeDisplay varianteIngredients, 'block'
    
  varianteEtapes = document.getElementById etapesId
  changeDisplay varianteEtapes, 'block'

  variantePrecondition = document.getElementById preconditionsId
  changeDisplay variantePrecondition, 'block'

  varianteTitle = document.getElementById titleId
  changeDisplay varianteTitle, 'block'

  varianteUtensils = document.getElementById utensilsId
  changeDisplay varianteUtensils, 'block'

  variantePictures = document.getElementById picturesId
  if variantePictures

    hasPictures = variantePictures.getElementsByClassName("recipe-picture").length > 0
    
    if hasPictures
      variantePictures.classList.remove "hidden"
      changeDisplay variantePictures, 'block'
      displayElements variantePictures 

onQuantityChange = (input, varianteId) ->

  ingredients = document.getElementById("#{varianteId}-ingredients");
  if !ingredients
    return 

  ingredientsQuantityElements =  ingredients.getElementsByClassName("ingredient-qte-fixed")
  if !ingredientsQuantityElements
    return

  variableOriginalValue = input.getAttribute("data-originalValue")
  variableNewValue = +input.value

  console.debug "Variable ingredient value changed to #{variableNewValue}. Updating #{ingredientsQuantityElements.length} ingredients"
  
  # Update ingredients quantity
  for ingredientsQuantityElement in ingredientsQuantityElements
    ingredientOldValue = +ingredientsQuantityElement.getAttribute("data-originalValue")
    ingredientNewValue = ((ingredientOldValue * variableNewValue) / variableOriginalValue).toFixed(2)
    if !isNaN(ingredientNewValue)
      ingredientsQuantityElement.innerHTML = ingredientNewValue

  # Update recipe yield
  recipeYield = document.getElementById("#{varianteId}-yield")
  if recipeYield
    oldYield = +recipeYield.getAttribute("data-originalValue")
    newYield = ((oldYield * variableNewValue) / variableOriginalValue).toFixed(2)
    if !isNaN(newYield)
      recipeYield.innerHTML = newYield
    

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