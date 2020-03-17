echo 'Clearing existing emojis'
mkdir -p out/
rm out/*.png

ls flags/*.png | xargs basename -s .png | xargs -n1 ./create-emojis.sh
echo 'Created emojis: '
ls out/*.png | xargs basename -s .png | sed 's/.*/\:&\:/' | tr '\n' ' ' | xargs echo

EXPORT_ZIP=emojis.zip
zip $EXPORT_ZIP out
echo 'Created zip file' $EXPORT_ZIP

