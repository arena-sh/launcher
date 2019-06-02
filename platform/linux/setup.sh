#!/bin/bash
mkdir ~/ArenaSH
echo "Copying files to ~/ArenaSH directory..."
mkdir -p ~/.local/share/applications/
cp -r . ~/ArenaSH
cd ~/ArenaSH
rm setup.sh
chmod +x launcher
echo "Registering arena:// protocol..."
sed -i "s@HOME_SED@$HOME@" arena.desktop
mv arena.desktop ~/.local/share/applications/
xdg-mime default arena.desktop x-scheme-handler/arena
echo "Done."
