#!/bin/bash
function appimage_curl(){
    url=$1
    name=$2
    if $([[ -z "$url" ]] || [[ -z "$name" ]])
    then
        echo "Must provide a URL and a name for the app"
    else
        filename=$(basename "$url")
        downloadpath="$HOME/Software/$name";
        mkdir -pv $downloadpath
        curl "$url" "--output" "$downloadpath/$filename"
        ln -s "$downloadpath/$filename" "$HOME/Software/binaries/$name" 
    fi
}
#!/bin/bash
function doomswitch(){
    location="$HOME/.dotfiles/emacs"
    mv "$location/init.el"  "$location/init.el~"
    mv "$location/init.el~switcharoo"  "$location/init.el"
    mv "$location/init.el~"  "$location/init.el~switcharoo"
}
