echo 'Clearing existing emojis'
mkdir -p out/
rm out/*.png

ls flags/*.png | xargs basename -s .png | xargs -n1 ./create-emojis.sh
echo 'Created emojis: '
ls out/*.png | xargs basename -s .png | sed 's/.*/\:&\:/' | tr '\n' ' ' | xargs echo

for emoji in out/*.png; do
	echo 'Sparkling' $emoji
	composite -compose Over sparkle.png "$emoji" "out/$(basename -s .png $emoji).sparkle.png"
done

EXPORT_ZIP=emojis.zip
zip $EXPORT_ZIP out/*.png
echo 'Created zip file' $EXPORT_ZIP

