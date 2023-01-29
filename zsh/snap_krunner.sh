#!/usr/bin/zsh
if [[ $(uname -v) == *"Ubuntu"* ]]; then
  shareApps="$HOME/.local/share/applications"
  snapApps="/var/lib/snapd/desktop/applications"

  # Detect all installed applications by snap
  for file in $snapApps/*.desktop; do
    # Get a legible version of the .desktop
    # Example: todoist_todoist.desktop -> todoist.desktop
    link="$shareApps/$(echo $file | cut -d '_' -f2)"

    # Create new link if none exists
    [[ -f $link ]] || ln -s $file $link
  done

  # NOTE: Remove this if you do NOT want automatic broken symbolic link cleanup
  for link in $shareApps/*.desktop; do
    # Remove any broken *.desktop symbolic links
    [[ -e $link ]] || rm $link
  done
fi
