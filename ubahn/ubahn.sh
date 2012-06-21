#!/bin/sh

add()
{
	touch $1
	git add $1
	git commit -m "$1"
	git tag $1
	#sleep 1
}

rm -rf out
mkdir -p out ; cd out
git init
git checkout -b U3
add Gustav-Adolf-Straße
git tag U3-start
for s in Sündersbühl Rothenburger ; do
	add $s
done
git checkout --orphan U1
for s in Hardhöhe Klinikum Stadthalle Rathaus Fürth_Hauptbahnhof Jakobinenstraße etc Gostenhof; do
	add $s
done


#git checkout --orphan U2
#for s in Röthenbach usw St.Leonhard; do
#	add $s
#done


git merge U3 -m "Plärrer"
git tag Plärrer
git checkout U3
git merge Plärrer
add Opernhaus
git checkout U1
add Weißer_Turm
add Lorenzkirche
git merge U3 -m "Hauptbahnhof"
git tag Hauptbahnhof

for s in Aufseßplatz Maffeiplatz Frankenstadion Haselbuck Bauernfeindstraße Messe ; do
	add $s
done
git branch U11
for s in Langwasser_Nord Scharfreiterring Langwasser_Mitte Gemeinschaftsplatz Langwasser_Süd; do
	add $s
done

git checkout U3
git merge Hauptbahnhof
for s in Wöhrder_Wiese Rathenauplatz Maxfeldstraße Kaulbachplatz Friedrich-Döner-Platz ; do
	add $s
done

git checkout -b U2 Rathenauplatz
for s in Rennweg Schoppershof Nordostbahnhof Herrnhütte Ziegelstein ; do
	add $s
done
git branch U21
add Flughafen


gitk --all &

