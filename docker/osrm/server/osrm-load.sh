#!/bin/sh

die() {
    echo $*
    exit 1
}

BASENAME=$1

DATADIR=/srv/osrm/data
DATA_LINK=${DATADIR}/${BASENAME}-latest.osrm
OSRM_FILE=$(/bin/readlink -e ${DATA_LINK})

[ $? -eq 1 ] && die "${DATA_LINK} target not found."

exec /usr/bin/osrm-datastore ${OSRM_FILE}
