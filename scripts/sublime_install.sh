#!/bin/bash

SOURCE_WWW="http://c758482.r82.cf2.rackcdn.com/"
TEXT_EDITOR="Sublime Text 2"
SHORT_NAME="sublime"
TEXT_EDITOR_EXE="sublime_text"
TEXT_EDITOR_WEB_ESCAPED="${TEXT_EDITOR// /%20}"
TEXT_EDITOR_ESCAPED="${TEXT_EDITOR}// /\ }"
VERSION=".0.2"
TEXT_EDITOR_VERSION=${TEXT_EDITOR_WEB_ESCAPED}${VERSION}
PACKED_WITH=".tar.bz2"
MACHINE_TYPE=`uname -m`
DOWNLOAD_DIR=~/Downloads
UNPACKED="${TEXT_EDITOR}"


alias script_dir="cd ${DOWNLOAD_DIR}"
. script_dir

if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  DOWNLOADED_PACKAGE=${TEXT_EDITOR_VERSION}'%20x64'${PACKED_WITH}
else
  DOWNLOADED_PACKAGE=${TEXT_EDITOR_VERSION}${PACKED_WITH}
fi

echo ${DOWNLOADED_PACKAGE}

if [ ! -d ${DOWNLOAD_DIR} ]; then
  mkdir ${DOWNLOAD_DIR}
fi
 
cd ${DOWNLOAD_DIR}
wget ${SOURCE_WWW}${DOWNLOADED_PACKAGE}
DOWNLOADED_PACKAGE="${DOWNLOADED_PACKAGE//%20/ }"
echo "end"
echo ${DOWNLOADED_PACKAGE}
cd ${DOWNLOAD_DIR}
tar -xf "${DOWNLOADED_PACKAGE}"

if [ -d "/opt/${UNPACKED}" ]; then
  sudo rm -r "/opt/${UNPACKED}"
fi

sudo mv "${UNPACKED}" /opt/

EXE_LINK="/opt/${UNPACKED}/${TEXT_EDITOR_EXE}"
LINK="/usr/bin/${SHORT_NAME}"

if [ -f ${LINK} ]; then
  sudo rm ${LINK}
fi

sudo ln -s "${EXE_LINK}" "${LINK}"

