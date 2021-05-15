#!/bin/bash
#=======================================================================================================================
# Export and import Gnome Terminal profiles
# Credits: github.com/yktoo/yktools/blob/master/gnome-terminal-profile
#=======================================================================================================================

USAGE_INFO="Usage: $0 import|export <filename>"

# Check variables
mode="$1"
filename="$2"
[[ -z "$mode"     ]] && usage "No mode specified"
[[ -z "$filename" ]] && usage "No filename specified"

# Get default profile ID
profile="$(gsettings get org.gnome.Terminal.ProfilesList default)"
profile="${profile:1:-1}" # remove leading and trailing single quotes

case "$mode" in
    # Export profile
    export)
        dconf dump "/org/gnome/terminal/legacy/profiles:/:$profile/" > "$filename"
        ;;

    # Import profile
    import)
        [[ ! -r "$filename" ]] && err "Failed to read from file $filename"
        dconf load "/org/gnome/terminal/legacy/profiles:/:$profile/" < "$filename"
        ;;

    *)
        usage "Incorrect mode: $mode"
        ;;
esac
