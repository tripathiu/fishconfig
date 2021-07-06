###################
#      Prompt     #
###################

function fish_prompt -d "Write out the prompt"
    set -l last_status $status

    set -l _git (set_color grey --dim)(fish_git_prompt)(set_color normal)
    set -l _pwd (set_color green) [(set_color brgreen -i)(prompt_pwd)(set_color normal)(set_color green)](set_color normal)
    set -l _end (set_color brred)" ❯ "(set_color normal)
    set -l _ret (set_color white -b red) $last_status"!" (set_color normal)" "
    set -l _nop (set_color white -b green)" "(set_color normal)

    if test $last_status != "0"
      printf '%s' $_ret
    end

    printf '%s' $_pwd

    if test "_git"
      printf '%s' $_git
    end

    printf '%s' $_end
end

set -g fish_prompt_pwd_dir_length 2


###################
#     Aliases     #
###################
alias vim nvim
alias showcase "docker run -it -v (pwd):/app docker.siemens.com/teamsae/showcase:latest"


###################
#     Path        #
###################
 contains $HOME/.local/bin $fish_user_paths; or set -Ua fish_user_paths $HOME/.local/bin

