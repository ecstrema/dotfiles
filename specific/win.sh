#!/usr/bin/bash

winget install \
    Zen-Team.Zen-Browser \
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

# Refresh the environment variables to make sure that the newly installed programs are available in the current session
# 1. Pull the updated System and User PATH directly from the Windows Registry via PowerShell
WIN_SYS_PATH=$(powershell.exe -NoProfile -Command "[Environment]::GetEnvironmentVariable('PATH', 'Machine')")
WIN_USR_PATH=$(powershell.exe -NoProfile -Command "[Environment]::GetEnvironmentVariable('PATH', 'User')")

# 2. Convert the Windows-style paths (C:\...;D:\...) to UNIX-style paths (/c/...:/d/...)
UNIX_SYS_PATH=$(cygpath -u -p "$WIN_SYS_PATH")
UNIX_USR_PATH=$(cygpath -u -p "$WIN_USR_PATH")

# 3. Append the refreshed Windows paths to the current Bash PATH.
# (We append rather than overwrite to ensure core Git Bash tools like /usr/bin/ls aren't lost)
export PATH="$PATH:$UNIX_SYS_PATH:$UNIX_USR_PATH"

# Install python with uv
uv python install
uv python update-shell

# Pin Windows Terminal to the taskbar
powershell.exe -NoProfile -Command "Invoke-Expression \"& { $(irm https://aka.ms/terminal-taskbar-pin) }\""
