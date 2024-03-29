#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {

    declare -a FILES_TO_SYMLINK=(
        "zsh/powerlevel10k oh-my-zsh/themes/"

        "shell/bashrc"
        "shell/curlrc"
        "shell/inputrc"

        "git/gitattributes"
        "git/gitconfig"
        "git/gitignore"

        "tmux/tmux.conf"
        "tmux/tmux"

        "vim/vim"
        "vim/vimrc"
        "zsh/zshrc"
        "zsh/p10k.zsh"
        "zsh/zplug"
        "fonts"

        "i3"
    )

    declare -a MACOS_FILES_TO_SYMLINK=(
    )

    local os=""
    os="$(get_os)"
    if [ "$os" == "macos" ]; then
        FILES_TO_SYMLINK=("${FILES_TO_SYMLINK[@]}" "${MACOS_FILES_TO_SYMLINK[@]}")
    fi

    local i=""
    local sourceFile=""
    local targetFile=""
    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_SYMLINK[@]}"; do
        ii=($i)
        j=${ii[1]}
        i=${ii[0]}

        sourceFile="$(cd .. && pwd)/$i"
        targetFile="$HOME/.$j$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"


        if [ ! -e "$targetFile" ] || $skipQuestions; then

            execute \
                "ln -fs $sourceFile $targetFile" \
                "$targetFile → $sourceFile"

        elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
            print_success "$targetFile → $sourceFile"
        else

            if ! $skipQuestions; then

                ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
                if answer_is_yes; then

                    rm -rf "$targetFile"

                    execute \
                        "ln -fs $sourceFile $targetFile" \
                        "$targetFile → $sourceFile"

                else
                    print_error "$targetFile → $sourceFile"
                fi

            fi

        fi

    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_in_purple "\n • Create symbolic links\n\n"
    create_symlinks "$@"
}

main "$@"
