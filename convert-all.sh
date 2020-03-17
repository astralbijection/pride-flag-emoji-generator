ls flags/*.png | xargs basename -s .png | xargs -n1 ./create-emojis.sh
echo 'Created emojis: '
ls out | xargs basename -s .png | sed 's/.*/\:&\:/' | tr '\n' ' ' | xargs echo

