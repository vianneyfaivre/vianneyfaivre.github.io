---
---
pictures = document.getElementsByClassName "recipe-picture"
hasPictures = pictures.length > 0

onPictureClick = (img) ->
    alreadyEnlarged = img.width > 100

    # Toggle width
    if alreadyEnlarged 
        img.width = 100
    else  
        img.width = 400

    # Minimize all the other pictures
    for picture in pictures
        if picture.src != img.src 
            picture.width = 100

main = () ->

    if hasPictures 
        for picture in pictures
            picture.addEventListener 'click', (e) -> onPictureClick(e.target)

main() 