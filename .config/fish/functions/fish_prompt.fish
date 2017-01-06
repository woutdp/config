function fish_prompt
    if not set -q -g __fish_robbyrussell_functions_defined
        set -g __fish_robbyrussell_functions_defined
        function _git_branch_name
            echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
        end

        function _is_git_dirty
            echo (git status -s --ignore-submodules=dirty ^/dev/null)
        end
    end

    set_color -o green;
    echo -n (whoami)

    if [ -d ".git" ] 
        set_color -o blue;
        echo -n ' '(prompt_last_pwd)

        set_color -o purple;
        echo -n ' {'(_git_branch_name)

        if [ (_is_git_dirty) ]
            echo -n ' *'
        end
        echo -n '}'
    else
        if git status > /dev/null 2>&1  
            set_color -o purple;
        else
            set_color -o blue;
        end
        echo -n ' '(prompt_last_pwd)
    end

    set_color -o red;
    echo -n ' λ '
end
