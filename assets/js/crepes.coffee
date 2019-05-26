---
---
# Don't judge me on this piece of code, it's shitty I know :)

# Each recipe is based on 15 units
DEFAULT_QUANTITY = 15

CREPES_RECIPES = {
    MAMAN: {
      title: 'Maman',
      ingredients: [
        { name: 'farine', quantity: 250, unite: 'gr', type: "solid" },
        { name: 'lait', quantity: 500, unite: 'mL'},
        { name: 'sucre', quantity: 50, unite: 'gr', type: "solid" },
        { name: 'oeufs', quantity: 3 },
        { name: 'beurre', quantity: 75, unite: 'gr' }
      ],
      preconditions: [
        "Les oeufs et le lait doivent être à température ambiante",
        "Le beurre doit être mou, pas liquide"
      ], 
      steps: [
        { hidden: false, value: "Dans un saladier, tamiser la farine et le sucre" },
        { hidden: false, value: "Casser les oeufs dans un bol, les peser et indiquer le poids ici : <input type='text' required='required' style='border-radius: 3px; border: 1px solid #ccc;font-size: 13px; text-align: center;' id='eggs-grams' minlength='1' maxlength='4' size='2' /> grammes" },
        { hidden: true, value: "Ajouter <span id='mix-liquid'></span> mL de lait dans ce bol" },
        { hidden: true, value: "Verser le contenu du bol dans le saladier puis mélanger" },
        { hidden: true, value: "Ajouter le reste du lait en deux fois puis mélanger" },
        { hidden: true, value: "Ajouter le beurre mou puis mélanger" },
        { hidden: true, value: "Couvrir et laisser reposer minimum 30 minutes" },
      ]
    },
    BIERE: {
      title: 'À la bière',
      ingredients: [
        { name: 'farine', quantity: 341, unite: 'gr', type: "solid" },
        { name: 'lait', quantity: 341, unite: 'mL' },
        { name: 'bière', quantity: 225, unite: 'mL' },
        { name: 'oeufs', quantity: 5.5 },
        { name: 'huile', quantity: 20, unite: 'mL' }
      ],
      preconditions: [
        "Les oeufs, le lait et la bière doivent être à température ambiante",
      ], 
      steps: [
        { hidden: false, value: "Dans un saladier, tamiser la farine" },
        { hidden: false, value: "Casser les oeufs dans un bol, les peser et indiquer le poids ici : <input type='text' required='required' style='border-radius: 3px; border: 1px solid #ccc;font-size: 13px; text-align: center;' id='eggs-grams' minlength='1' maxlength='4' size='2' /> grammes" },
        { hidden: true, value: "Ajouter <span id='mix-liquid'></span> mL de lait dans ce bol" },
        { hidden: true, value: "Verser le contenu du bol dans le saladier puis mélanger" },
        { hidden: true, value: "Ajouter le reste du lait en deux fois puis mélanger" },
        { hidden: true, value: "Ajouter la bière puis mélanger" },
        { hidden: true, value: "Ajouter l'huile puis mélanger" },
        { hidden: true, value: "Couvrir et laisser reposer minimum 30 minutes" },
      ]
    },
    MEILLEUR_DU_CHEF: {
      title: 'meilleurduchef.com',
      ingredients: [
        { name: 'farine', quantity: 188, unite: 'gr', type: "solid" },
        { name: 'lait', quantity: 525, unite: 'mL' },
        { name: 'sucre', quantity: 45, unite: 'gr', type: "solid" },
        { name: 'oeufs', quantity: 4.5 },
        { name: 'beurre', quantity: 45, unite: 'gr' }
      ],
      preconditions: [
        "Les oeufs et le lait doivent être à température ambiante",
        "Le beurre doit être mou, pas liquide"
      ], 
      steps: [
        { hidden: false, value: "Dans un saladier, tamiser la farine et le sucre" },
        { hidden: false, value: "Casser les oeufs dans un bol, les peser et indiquer le poids ici : <input type='text' required='required' style='border-radius: 3px; border: 1px solid #ccc;font-size: 13px; text-align: center;' id='eggs-grams' minlength='1' maxlength='4' size='2' /> grammes" },
        { hidden: true, value: "Ajouter <span id='mix-liquid'></span> mL de lait dans ce bol" },
        { hidden: true, value: "Verser le contenu du bol dans le saladier puis mélanger" },
        { hidden: true, value: "Ajouter le reste du lait en deux fois puis mélanger" },
        { hidden: true, value: "Ajouter le beurre mou puis mélanger" },
        { hidden: true, value: "Couvrir et laisser reposer minimum 30 minutes" },
      ]
    },
    MARMITON_RAFFINEE: {
      title: 'Marmiton "Raffinée"',
      ingredients: [
        { name: 'farine', quantity: 281, unite: 'gr', type: "solid" },
        { name: 'lait', quantity: 750, unite: 'mL' },
        { name: 'sucre', quantity: 56, unite: 'gr', type: "solid" },
        { name: 'oeufs', quantity: 4.5 },
        { name: 'beurre', quantity: 68, unite: 'gr' }
      ],
      preconditions: [
        "Les oeufs et le lait doivent être à température ambiante",
        "Le beurre doit être mou, pas liquide"
      ], 
      steps: [
        { hidden: false, value: "Dans un saladier, tamiser la farine et le sucre" },
        { hidden: false, value: "Casser les oeufs dans un bol, les peser et indiquer le poids ici : <input type='text' required='required' style='border-radius: 3px; border: 1px solid #ccc;font-size: 13px; text-align: center;' id='eggs-grams' minlength='1' maxlength='4' size='2' /> grammes" },
        { hidden: true, value: "Ajouter <span id='mix-liquid'></span> mL de lait dans ce bol" },
        { hidden: true, value: "Verser le contenu du bol dans le saladier puis mélanger" },
        { hidden: true, value: "Ajouter le reste du lait en deux fois puis mélanger" },
        { hidden: true, value: "Ajouter le beurre mou puis mélanger" },
        { hidden: true, value: "Couvrir et laisser reposer minimum 30 minutes" },
      ]
    },
    FARINE_COMPLETE: {
      title: 'Farine complète',
      ingredients: [
        { name: 'farine', quantity: 313, unite: 'gr', type: "solid" },
        { name: 'lait', quantity: 625, unite: 'mL' },
        { name: 'oeufs', quantity: 5 },
      ],
      preconditions: [
        "Les oeufs et le lait doivent être à température ambiante",
      ], 
      steps: [
        { hidden: false, value: "Dans un saladier, tamiser la farine" },
        { hidden: false, value: "Casser les oeufs dans un bol, les peser et indiquer le poids ici : <input type='text' required='required' style='border-radius: 3px; border: 1px solid #ccc;font-size: 13px; text-align: center;' id='eggs-grams' minlength='1' maxlength='4' size='2' /> grammes" },
        { hidden: true, value: "Ajouter <span id='mix-liquid'></span> mL de lait dans ce bol" },
        { hidden: true, value: "Verser le contenu du bol dans le saladier puis mélanger" },
        { hidden: true, value: "Ajouter le reste du lait en deux fois puis mélanger" },
        { hidden: true, value: "Couvrir et laisser reposer minimum 30 minutes" },
      ]
    },
    
}

CURRENT_RECIPE = CREPES_RECIPES.MAMAN

#
# DOM Functions
#
toRecipeSelectorOption = (id, recipe) -> "<option value='#{id}'>#{recipe.title}</option>"

toIngredientListItem = (ingredient) -> 
  if ingredient.unite
    "<li>#{ingredient.name} : #{ingredient.quantity} #{ingredient.unite}</li>"
  else 
    "<li>#{ingredient.name} : #{ingredient.quantity}</li>"

toPreconditionListItem = (precondition) -> "<li>#{precondition}</li>"

toStepListItem = (step) -> 
  display = if step.hidden then "none" else "list-item"
  "<li class='step step-hidden-#{step.hidden}' style='display: #{display}'>#{step.value}</li>"

hide = (item) -> 
  item.style.display = "none"

display = (item) -> 
  if item.nodeName == "LI"
    item.style.display = "list-item"
  else
    item.style.display = "block"

updateCount = (newCount) ->
  document.getElementById("crepes-count-title").innerHTML = newCount
  document.getElementById("crepes-count-note").innerHTML = newCount

toIngredientsList = (ingredients) ->
  list = []
  list.push toIngredientListItem ingredient for id, ingredient of ingredients
  list.join("")

showError = (li, milkToAdd) ->
  eggsToRemove = Math.abs milkToAdd 

  error = document.getElementById "mix-error"
  if (!error)
    error = document.createElement "div" 
    error.id = 'mix-error'
  else 
    error.innerHTML = ''
  
  errorText = document.createTextNode "Retirer #{eggsToRemove} grammes d'oeufs"

  btnOnClick = (event) -> 
    eggsGrams = document.getElementById("eggs-grams")
    eggsGrams.value = eggsGrams.value - eggsToRemove
    eggsGramsOnChange eggsGrams.value

  btn = document.createElement "button"
  btn.innerHTML = "C'est fait !"
  btn.style = "margin-left: 10px;
              font-size: 13px;
              border-radius: 3px;
              border: 1px solid #d1d1d1;
              padding: 5px 10px;
              cursor: pointer;"
  btn.addEventListener 'click', btnOnClick 

  error.appendChild errorText
  error.appendChild btn
  li.appendChild error

hideError = (li) ->
  error = document.getElementById('mix-error')
  if error then li.removeChild(error)
  
#
# Data Manipulation Functions
#
getRecipeById = (recipes, id) -> recipes[id]

getIngredientByName = (ingredients, name) ->  
  found = ingredient for id, ingredient of ingredients when ingredient.name is name
  found

getIngredientsByType = (ingredients, type) -> ingredient for id, ingredient of ingredients when ingredient.type is type

sumQuantities = (ingredients) -> 
  ingredients
    .map (item) -> if item then item.quantity else 0
    .reduce (x, y) -> x + y

updateQuantity = (newCount, ingredient) ->
  newIngredientQuantity = (newCount * ingredient.quantity) / DEFAULT_QUANTITY

  if(ingredient.name is "oeufs")
    newIngredientQuantity = newIngredientQuantity.toFixed(1)
  else 
    newIngredientQuantity = Math.round(newIngredientQuantity)
  
  { name: ingredient.name, quantity: newIngredientQuantity, unite: ingredient.unite, type: ingredient.type }

eggsGramsOnChange = (eggsGrams) -> 
  console.log "Changed Eggs Grams Input to #{eggsGrams}"

  eggsGramsHtmlInput = document.getElementById("eggs-grams")
  eggsGramsHtmlListItem = eggsGramsHtmlInput.parentNode

  mixLiquidHtmlSpan = document.getElementById("mix-liquid")
  mixLiquidHtmlListItem = mixLiquidHtmlSpan.parentNode

  cuissonHtmlDiv = document.getElementById "cuisson-panel"

  milkToAdd = CURRENT_RECIPE.mixSolidGrams - eggsGrams
  mixLiquidHtmlSpan.innerHTML = milkToAdd

  if (milkToAdd == 0)
    display step for step in document.getElementsByClassName("step-hidden-true")
    hide mixLiquidHtmlListItem
    hideError eggsGramsHtmlListItem
    display cuissonHtmlDiv
  else if(milkToAdd > 0) 
    display step for step in document.getElementsByClassName("step-hidden-true")
    hideError eggsGramsHtmlListItem
    display cuissonHtmlDiv
  else
    hide step for step in document.getElementsByClassName("step-hidden-true")
    showError eggsGramsHtmlListItem, milkToAdd
    hide cuissonHtmlDiv

#
# Business Logic
#
onRecipeChange = (recipes, selectedRecipe, quantity) -> 

  console.log "Changed Recipe to #{selectedRecipe}"

  recipe = getRecipeById(recipes, selectedRecipe)
  if !recipe then return

  CURRENT_RECIPE = recipe

  document.getElementById("ingredients").innerHTML = toIngredientsList recipe.ingredients

  preconditions = []
  preconditions.push toPreconditionListItem precondition for id, precondition of recipe.preconditions
  document.getElementById("preconditions").innerHTML = preconditions.join("")

  steps = []
  stepsHtmlList = document.getElementById("steps")
  steps.push toStepListItem step for id, step of recipe.steps
  stepsHtmlList.innerHTML = steps.join("")

  document.getElementById("crepes-count-input").value = quantity
  updateIngredientsList(quantity)

  eggsGramsHtmlInput = document.getElementById("eggs-grams")
  hide document.getElementById "cuisson-panel"

  # Update mix-liquid value
  eggsGramsHtmlInput.addEventListener 'input', (event) -> 
    eggsGrams = parseInt(event.target.value)
    if isNaN(eggsGrams) then return 
    eggsGramsOnChange eggsGrams

onCrepesCountChange = (recipes, newCount) ->
  console.log "Changed Crepes Count to #{newCount}"

  if(isNaN(newCount))
    return 

  updateCount newCount
  document.getElementById("eggs-grams").value = ''
  document.getElementById("mix-liquid").innerHTML = ''
  document.getElementById("ingredients").innerHTML = ''

  error = document.getElementById "mix-error"
  if error then hide error

  hide step for step in document.getElementsByClassName("step-hidden-true") 
  hide document.getElementById "cuisson-panel" 

  updateIngredientsList(newCount)

updateIngredientsList = (newCount) ->

  # Update ingredients list
  ingredients = []
  ingredients.push updateQuantity newCount, ingredient for id, ingredient of CURRENT_RECIPE.ingredients
  CURRENT_RECIPE.updatedIngredients = ingredients
  
  # Get mix-solid
  CURRENT_RECIPE.mixSolidGrams = sumQuantities getIngredientsByType(CURRENT_RECIPE.updatedIngredients, 'solid')

  # Update DOM
  document.getElementById("ingredients").innerHTML = toIngredientsList CURRENT_RECIPE.updatedIngredients

#
# Main Function
#
loadRecipes = (recipes) ->

  elRecipesSelector = document.getElementById("recipes-selector")
  elRecipesSelector.addEventListener('change', (event) -> onRecipeChange(recipes, event.target.value, document.getElementById("crepes-count-input").value))
  document.getElementById("crepes-count-input").addEventListener('input', (event) -> onCrepesCountChange recipes, parseInt event.target.value)

  # Init crepes count
  updateCount DEFAULT_QUANTITY

  # Recipe Selector
  recipesNames = []
  recipesNames.push toRecipeSelectorOption id, recipe for id, recipe of recipes
  elRecipesSelector.innerHTML = recipesNames.join("")

  # Update UI
  onRecipeChange(recipes, "MAMAN", DEFAULT_QUANTITY)

# Main
loadRecipes(CREPES_RECIPES)