# disable greeting
function fish_greeting
end

# Zellij as startup proc
if not set -q ZELLIJ
    if test "$ZELLIJ_AUTO_ATTACH" = true
        zellij attach -c
    else
        exec zellij
    end

    if test "$ZELLIJ_AUTO_EXIT" = true
        kill $fish_pid
    end
end
