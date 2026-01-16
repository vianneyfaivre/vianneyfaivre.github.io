---
---
# Don't judge me on this piece of code, I know it's shitty :)

# Each recipe is based on 15 units
DEFAULT_QUANTITY = 15
EGG_WEIGHT_GRAMS = 50

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
      steps: [
        { hidden: false, value: "Faire fondre le beurre" },
        { hidden: false, value: "Dans un saladier, tamiser la farine et le sucre" },
        { hidden: false, value: "Casser les oeufs dans un bol" },
        { hidden: false, value: "Ajouter <span id='mix-liquid'></span> mL de lait dans ce bol" },
        { hidden: false, value: "Verser le contenu du bol dans le saladier puis mélanger jusqu'à ce que la préparation soit bien lisse" },
        { hidden: false, value: "Ajouter le beurre puis mélanger" },
        { hidden: false, value: "Ajouter le reste du lait (<span id='remaining-milk'></span> mL) en deux fois puis mélanger" },
        { hidden: false, value: "Couvrir et laisser reposer minimum 30 minutes" },
      ]
    },
    BRETONNE: {
      title: 'Bretonne',
      ingredients: [
        { name: 'farine', quantity: 500, unite: 'gr', type: "solid" },
        { name: 'lait', quantity: 1000, unite: 'mL'},
        { name: 'eau', quantity: 100, unite: 'mL'},
        { name: 'sucre', quantity: 75, unite: 'gr', type: "solid" },
        { name: 'oeufs', quantity: 5 },
        { name: 'beurre', quantity: 25, unite: 'gr' }
      ],
      steps: [
        { hidden: false, value: "Faire un beurre noisette" },
        { hidden: false, value: "Dans un saladier, tamiser la farine et le sucre" },
        { hidden: false, value: "Casser les oeufs dans un bol" },
        { hidden: false, value: "Ajouter <span id='mix-liquid'></span> mL de lait dans ce bol" },
        { hidden: false, value: "Verser le contenu du bol dans le saladier puis mélanger jusqu'à ce que la préparation soit bien lisse" },
        { hidden: false, value: "Ajouter le beurre puis mélanger" },
        { hidden: false, value: "Ajouter le reste du lait (<span id='remaining-milk'></span> mL) et l'eau en deux fois puis mélanger" },
        { hidden: false, value: "Couvrir et laisser reposer minimum 30 minutes" },
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
      steps: [
        { hidden: false, value: "Dans un saladier, tamiser la farine" },
        { hidden: false, value: "Casser les oeufs dans un bol" },
        { hidden: false, value: "Ajouter <span id='mix-liquid'></span> mL de lait dans ce bol" },
        { hidden: false, value: "Verser le contenu du bol dans le saladier puis mélanger jusqu'à ce que la préparation soit bien lisse" },
        { hidden: false, value: "Ajouter l'huile puis mélanger" },
        { hidden: false, value: "Ajouter le reste du lait (<span id='remaining-milk'></span> mL) en deux fois puis mélanger" },
        { hidden: false, value: "Ajouter la bière puis mélanger" },
        { hidden: false, value: "Couvrir et laisser reposer minimum 30 minutes" },
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
      steps: [
        { hidden: false, value: "Faire fondre le beurre" },
        { hidden: false, value: "Dans un saladier, tamiser la farine et le sucre" },
        { hidden: false, value: "Casser les oeufs dans un bol" },
        { hidden: false, value: "Ajouter <span id='mix-liquid'></span> mL de lait dans ce bol" },
        { hidden: false, value: "Verser le contenu du bol dans le saladier puis mélanger jusqu'à ce que la préparation soit bien lisse" },
        { hidden: false, value: "Ajouter le beurre puis mélanger" },
        { hidden: false, value: "Ajouter le reste du lait (<span id='remaining-milk'></span> mL) en deux fois puis mélanger" },
        { hidden: false, value: "Couvrir et laisser reposer minimum 30 minutes" },
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
      steps: [
        { hidden: false, value: "Faire fondre le beurre" },
        { hidden: false, value: "Dans un saladier, tamiser la farine et le sucre" },
        { hidden: false, value: "Casser les oeufs dans un bol" },
        { hidden: false, value: "Ajouter <span id='mix-liquid'></span> mL de lait dans ce bol" },
        { hidden: false, value: "Verser le contenu du bol dans le saladier puis mélanger jusqu'à ce que la préparation soit bien lisse" },
        { hidden: false, value: "Ajouter le beurre puis mélanger" },
        { hidden: false, value: "Ajouter le reste du lait (<span id='remaining-milk'></span> mL) en deux fois puis mélanger" },
        { hidden: false, value: "Couvrir et laisser reposer minimum 30 minutes" },
      ]
    },
    FARINE_COMPLETE: {
      title: 'Farine complète',
      ingredients: [
        { name: 'farine complète', quantity: 313, unite: 'gr', type: "solid" },
        { name: 'lait', quantity: 625, unite: 'mL' },
        { name: 'oeufs', quantity: 5 },
        { name: 'huile', quantity: 10, unite: 'mL' },
      ],
      steps: [
        { hidden: false, value: "Dans un saladier, tamiser la farine" },
        { hidden: false, value: "Casser les oeufs dans un bol" },
        { hidden: false, value: "Ajouter <span id='mix-liquid'></span> mL de lait dans ce bol" },
        { hidden: false, value: "Verser le contenu du bol dans le saladier puis mélanger jusqu'à ce que la préparation soit bien lisse" },
        { hidden: false, value: "Ajouter l'huile et le reste du lait (<span id='remaining-milk'></span> mL) en deux fois puis mélanger" },
        { hidden: false, value: "Couvrir et laisser reposer minimum 30 minutes" },
      ]
    },
    SANS_OEUFS: {
      title: 'Sans oeufs',
      ingredients: [
        { name: 'farine', quantity: 500, unite: 'gr', type: "solid" },
        { name: 'sucre', quantity: 100, unite: 'gr', type: "solid" },
        { name: 'lait', quantity: 1000, unite: 'mL' },
        { name: 'beurre', quantity: 100, unite: 'gr' }
      ],
      steps: [
        { hidden: false, value: "Faire fondre le beurre" },
        { hidden: false, value: "Dans un saladier, tamiser la farine et le sucre" },
        { hidden: false, value: "Verser le lait dans le saladier puis mélanger jusqu'à ce que la préparation soit bien lisse" },
        { hidden: false, value: "Ajouter le beurre puis mélanger" },
        { hidden: false, value: "Couvrir et laisser reposer minimum 30 minutes" },
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

#
# Business Logic
#
onRecipeChange = (recipes, selectedRecipe, quantity) -> 

  console.log "Changed Recipe to #{selectedRecipe}"

  recipe = getRecipeById(recipes, selectedRecipe)
  if !recipe then return

  CURRENT_RECIPE = recipe

  document.getElementById("ingredients").innerHTML = toIngredientsList recipe.ingredients

  steps = []
  stepsHtmlList = document.getElementById("steps")
  steps.push toStepListItem step for id, step of recipe.steps
  stepsHtmlList.innerHTML = steps.join("")

  document.getElementById("crepes-count-input").value = quantity
  updateIngredientsList(quantity)

onCrepesCountChange = (recipes, newCount) ->
  console.log "Changed Crepes Count to #{newCount}"

  if(isNaN(newCount) || newCount < 0)
    return 

  updateCount newCount
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

  # Calculate milk to add based on egg weight
  eggs = getIngredientByName(CURRENT_RECIPE.updatedIngredients, 'oeufs')
  milk = getIngredientByName(CURRENT_RECIPE.updatedIngredients, 'lait')
  if eggs and milk
    eggsGrams = parseFloat(eggs.quantity) * EGG_WEIGHT_GRAMS
    milkToAdd = CURRENT_RECIPE.mixSolidGrams - eggsGrams
    mixLiquidHtmlSpan = document.getElementById("mix-liquid")
    if mixLiquidHtmlSpan
      mixLiquidHtmlSpan.innerHTML = Math.round(milkToAdd)
    remainingMilk = milk.quantity - Math.round(milkToAdd)
    remainingMilkHtmlSpan = document.getElementById("remaining-milk")
    if remainingMilkHtmlSpan
      remainingMilkHtmlSpan.innerHTML = remainingMilk
  
  display document.getElementById "cuisson-panel"

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