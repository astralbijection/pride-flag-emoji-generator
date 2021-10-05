#!/bin/bash

NAME="$1"
OUT_DIR="out"

IN="flags/$NAME.png"
IN_SCL="/tmp/pride-flag-emoji-rescaled/$NAME.png"
OUT_FLAG="$OUT_DIR/${NAME}_flag.png"
OUT_HEART="$OUT_DIR/${NAME}_heart.png"
OUT_MIDDLE="$OUT_DIR/${NAME}_middle.png"
OUT_EGG="$OUT_DIR/${NAME}_egg.png"
OUT_100="$OUT_DIR/${NAME}_100.png"

mkdir -p /tmp/pride-flag-emoji-rescaled

echo Using source file $IN
convert $IN -resize 128x128\! -background transparent -gravity center -extent 128x128 $IN_SCL

echo Generating $OUT_FLAG
convert $IN -resize 128x90\! -background transparent -gravity center -extent 128x128 $OUT_FLAG
composite -compose Dst_In flag_mask.png $OUT_FLAG -alpha Set $OUT_FLAG

echo Generating $OUT_HEART
composite -compose Dst_In heart_mask.png $IN_SCL -alpha Set $OUT_HEART

echo Generating $OUT_MIDDLE
composite -compose Dst_In middle_mask.png $IN_SCL -alpha Set $OUT_MIDDLE

echo Generating $OUT_EGG
composite -compose Dst_In egg_mask.png $IN_SCL -alpha Set $OUT_EGG

echo Generating $OUT_100
composite -compose Dst_In 100_mask.png $IN_SCL -alpha Set $OUT_100

echo Finished processing $NAME
