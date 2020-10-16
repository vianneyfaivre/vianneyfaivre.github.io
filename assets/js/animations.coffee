---
---

window.animations = window.animations || {}

window.animations.fadeIn = (el) -> 
  el.style.opacity = 0
  opacity = 0
  request = null

  updateFading = () ->
    el.style.opacity = opacity += 0.04
    if opacity >= 1
      opacity = 1
      window.cancelAnimationFrame(request)

  requestAnimation = () ->
    request = window.requestAnimationFrame(requestAnimation)
    updateFading()

  requestAnimation()  