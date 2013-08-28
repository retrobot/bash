#!/bin/bash

source_www="http://c758482.r82.cf2.rackcdn.com/"
text_editor="Sublime Text 2"
short_name="sublime"
text_editor_exe="sublime_text"
text_editor_web_escaped="${text_editor// /%20}"
text_editor_escaped="${text_editor}// /\ }"
version=".0.2"
text_editor_version=${text_editor_web_escaped}${version}
packed_with=".tar.bz2"
machine_type=`uname -m`
download_dir=~/Downloads
unpacked="${text_editor}"
script_dir="$( cd "$( dirname "$0" )"; pwd)"

# alias script_dir="cd ${download_dir}"
# . script_dir

if [ ${machine_type} == 'x86_64' ]; then
  downloaded_package=${text_editor_version}'%20x64'${packed_with}
else
  downloaded_package=${text_editor_version}${packed_with}
fi

echo "Ready package is: "${downloaded_package}

if [ ! -d ${download_dir} ]; then
  mkdir ${download_dir}
fi

cd ${download_dir}

wget ${source_www}${downloaded_package}
downloaded_package="${downloaded_package//%20/ }"
echo "File downloaded succesfully"
echo "Downloaded package: "${downloaded_package}

cd ${download_dir}
tar -xf "${downloaded_package}"

if [ -d "/opt/${unpacked}" ]; then
  sudo rm -r "/opt/${unpacked}"
fi

sudo mv "${unpacked}" /opt/

exe_link="/opt/${unpacked}/${text_editor_exe}"
link="/usr/bin/${short_name}"

if [ -f ${link} ]; then
  sudo rm ${link}
fi

sudo ln -s "${exe_link}" "${link}"

desktop_file="${short_name}.desktop"
slash="/"
desktop_file_path= "${script_dir}/${desktop_file}"
echo "path is: $desktop_file_path"
if [ -d /usr/share/applications ]; then
  sudo cp "${desktop_file_path}" /usr/share/applications
fi
