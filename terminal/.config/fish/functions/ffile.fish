# Find file and open in nvim
function ffile
    set FD_PREFIX "fd --hidden --no-ignore --ignore-case --type file"
    set INITIAL_QUERY (string join ' ' $argv)
    : | fzf --ansi --disabled --query "$INITIAL_QUERY" \
        --header 'Options >>> CTRL-Y: Copy filepath to clipboard' \
        --prompt 'Find File > ' \
        --bind "start:reload:$FD_PREFIX {q}" \
        --bind "change:reload:sleep 0.1; $FD_PREFIX {q} || true" \
        --delimiter : \
        --preview 'bat --color=always {}' \
        --bind "ctrl-y:execute-silent(echo {1} | $CLIPBOARD_CMD)+abort" \
        --bind 'enter:become(nvim {1})+abort'
end
