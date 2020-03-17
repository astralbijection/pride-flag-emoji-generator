#!/bin/bash

NAME="$1"
OUT_DIR="out"

IN="flags/$NAME.png"
OUT_FLAG_TMP="/tmp/${NAME}_flag_tmp.png"
OUT_FLAG="$OUT_DIR/${NAME}_flag.png"

OUT_HEART_TMP="/tmp/${NAME}_heart.png"
OUT_HEART="$OUT_DIR/${NAME}_heart.png"

OUT_MIDDLE_TMP="/tmp/${NAME}_middle.png"
OUT_MIDDLE="$OUT_DIR/${NAME}_middle.png"

echo Using source file $IN

echo Generating $OUT_FLAG
convert $IN -resize x500 -background transparent -gravity center -extent 630x630 $OUT_FLAG_TMP
composite -compose Dst_In flag_mask.png $OUT_FLAG_TMP -alpha Set $OUT_FLAG_TMP
convert $OUT_FLAG_TMP -resize 256x256 $OUT_FLAG
rm $OUT_FLAG_TMP

echo Generating $OUT_HEART
convert $IN -resize x505 -background transparent -gravity center -extent 630x630+0+16 $OUT_HEART_TMP
composite -compose Dst_In heart_mask.png $OUT_HEART_TMP -alpha Set $OUT_HEART_TMP
convert $OUT_HEART_TMP -resize 256x256 $OUT_HEART
rm $OUT_HEART_TMP

echo Generating $OUT_MIDDLE
convert $IN -resize x256 -background transparent -gravity center $OUT_MIDDLE_TMP
composite -compose Dst_In middle_mask.png $OUT_MIDDLE_TMP -alpha Set $OUT_MIDDLE_TMP
convert $OUT_MIDDLE_TMP -resize 256x256 $OUT_MIDDLE
rm $OUT_MIDDLE_TMP

echo Finished processing $NAME
