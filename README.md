# PrograWeb2-TP

Para branchear:

//CREO (-b) EL BRANCH 'ejemplo', Y ME SITUO (checkout) EN EL.

$git checkout -b ejemplo

//HAGO CAMBIOS

//AGREGO (add) LOS CAMBIOS

$git add -A

//COMMITEO (commit) LOS CAMBIOS CON EL MENSAJE DESCRIPTIVO 'Agrego ABM usuario.'

$git commit -m "Agrego ABM usuario."

//VUELVO (checkout) AL BRANCH MASTER

$git checkout master

//HAGO EL MERGE (merge) AL MASTER

$git merge ejemplo

//BORRO (delete) EL BRANCH 'ejemplo' <-- Este no es necesario

$ git branch -d ejemplo
