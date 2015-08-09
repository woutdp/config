function prompt_last_pwd
    echo (prompt_long_pwd) | grep -oE [^/]+'$'
end

