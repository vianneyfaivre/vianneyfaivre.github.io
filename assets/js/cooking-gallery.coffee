---
---

dotsInterval = null

getDots = (dots) -> if dots.length == 3 then "" else dots + "."

updateDots = (span) -> 
  span.innerHTML = getDots(span.innerHTML)

onPageLoad = () -> 
  console.debug("Page loaded!")

  document.getElementById("loading-container").style.display = "none"
  window.clearInterval(dotsInterval)

  picturesContainer = document.getElementById("pictures-container")
  picturesContainer.style.visibility = "visible"
  window.animations.fadeIn(picturesContainer)

main = () ->
  console.debug("Page loading...")

  dotsContainer = document.getElementById("dots")

  updateDotsFn = () -> updateDots(dotsContainer)
  dotsInterval = window.setInterval(updateDotsFn, 200)

  window.addEventListener('load', onPageLoad)

main()