#!/usr/bin/env bash
# Simple tool for (continuously) rendering plantuml diagram into PNG images
# author: Nick Yamane <nick.p@samsung.com>

set -e

SCRIPT="$(basename $0)"
DIR="$PWD"
FILE=
MONITOR=0
OPEN=0
IMGVIEWER="${IMGVIEWER:-sxiv}"

PLANTUML="${PLANTUML:-"$HOME/devtools/plantuml/plantuml.jar"}"
PLANTUML_CMD="java -jar $PLANTUML -tpng"

usage() {
    echo "Usage: ${SCRIPT} [OPTIONS] [PLANTUML_FILE]"
    echo
    echo "  Tool for (continuously) rendering plantuml diagram into PNG images"
    echo
    echo "OPTIONS:"
    echo "  -m:     Monitor input file and re-render output file as it changes."
    echo "  -h:     Print this usage text and exits."
    echo
    echo "POISITIONAL ARGS:"
    echo "  PLANTUML_FILE: The plantuml input file, containing the diagram source code."
    echo
    echo "ENV VARS:"
    echo "  \$PLANTUML:  PlantUML Jar file path"
    echo "  \$IMGVIEWER: Command to be used for viewing diagram generated (E.g: sxiv, feh, eog)"
}

while [ $# -gt 0 ]; do
    case $1 in
        -m)
            MONITOR=1
            ;;
        -o)
            OPEN=1
            ;;
        -h)
            usage && exit 0
            ;;
        *.puml)
            FILE=$1
            ;;
    esac
    shift
done

generate_diagram_image() {
    local in=$1
    eval "$PLANTUML_CMD $in"
    echo "${in%%.puml}.png"
}

info() {
    printf "[%s] %s\n" "$(date +'%H:%M:%S.%N')" "$*"
}

if [ -n "$FILE" ] && [ -f "$FILE" ]; then
    echo "Generating diagram image for '${FILE}'"
    out=$(generate_diagram_image "$FILE")

    if (( OPEN )) && type "$IMGVIEWER" &>/dev/null; then
        echo "Opening $out"
        $IMGVIEWER "$out" &
    fi
fi

test -r "${PLANTUML}" || {
    echo "!! Error: PlantUML Jar file not found '$PLANTUML'!" >&2
    echo "!!        Please download it from http://plantuml.com/download" >&2
    echo "!!        and export its path in the env variable PLANTUML." >&2
    exit 1
}

(( MONITOR )) || exit 0

echo "Monitoring plantuml files in dir '$(readlink -f $DIR)'.."

inotifywait -qmr -e modify "$DIR" --format '%w%f' | while read file; do
    case $file in
        *.puml)
            info "Generating diagram image for ${file##${DIR}/}"
            generate_diagram_image "$file" >/dev/null || echo "Failed to render diagram image!"
            ;;
    esac
done

