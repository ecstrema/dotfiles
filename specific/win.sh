#!/usr/bin/bash

winget install \
    7zip.7zip \
    DuongDieuPhap.ImageGlass \
    Bitwarden.Bitwarden \
    Microsoft.PowerToys \
    Musescore.Musescore \
    Inkscape.Inkscape \
    Oven-sh.Bun \
    Kitware.CMake \
    OpenJS.NodeJS.LTS \
    ezwinports.make \
    astral-sh.uv \
    Microsoft.VisualStudioCode \
    RyanOasis.NerdFont.FiraCode \
    starship

# Echo to add the contents of winterminalconfig.json to the Windows Terminal settings file
echo "Add the following to the Windows Terminal settings file: (can be found in the dropdown menu of the Windows Terminal, Settings, Open JSON file)"
cat specific/winterminalconfig.json
