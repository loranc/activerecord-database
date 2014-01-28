class Recipe < ActiveRecord::Base
end

def to_s 
  "#{name} : #{description} take #{length} to cook and is rated #{difficulty}"
end

# attention : ne pas utiliser les attr_reader tel quel ici car cela va ecraser le fonctionnement de ActiveRecord qui map les attributs avec les noms des colonnes. 
# ici on créer une methode to_s pour mieux afficher les recettes dans l'option 3