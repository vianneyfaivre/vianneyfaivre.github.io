while getopts t: flag
do
    case "${flag}" in
        t) title=${OPTARG};;
    esac
done

if [ "$title" = "" ];
then
    echo "Usage: ./new-recipe.sh -t 'Recette 1'"
    exit 1;
fi

echo "Creating recipe: $title";
cp assets/recettes/_templates/recipe-id.yaml assets/recettes/$title.yaml
cp assets/recettes/_templates/recipe-id.md _posts/recettes/2014-01-01-$title.md
