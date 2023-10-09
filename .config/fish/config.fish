function fish_prompt --description 'Write out the prompt'
    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end
    #set kubenv "#"(set_color red)(hostname|cut -d . -f 1)
    set kubenv "#"(set_color red)(kubectl config current-context)

    if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __git_cb
    set __git_cb ":"(set_color brown)(git branch | grep \* | sed 's/* //')(set_color normal)""
    end

    switch $USER

    case root

    if not set -q __fish_prompt_cwd
        if set -q fish_color_cwd_root
            set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
        else
            set -g __fish_prompt_cwd (set_color $fish_color_cwd)
        end
    end

    printf '%s@%s:%s%s%s%s# ' $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb $kubenv

    case '*'

    if not set -q __fish_prompt_cwd
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

    printf '%s@%s:%s%s%s%s%s$ ' $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb $kubenv

    end
end
source "$HOME/tokens.sh" # Toggle and others
alias gpb="git push origin (git rev-parse --abbrev-ref HEAD)"
alias gst='git status'
alias gbr='git branch'
alias gca='git commit -am'
alias gc='git commit -m'
alias gco='git checkout'
set PATH $HOME/.cargo/bin /opt/homebrew/bin /usr/local/bin/ $HOME/.cargo/bin $HOME/git/mfsolutions/nun-db/target/debug $PATH
set CDPATH $HOME ../ $HOME/git $HOME/git/mfsolutions $HOME/git/radicalimage
fish_vi_key_bindings
function fish_user_key_bindings
    bind --erase --preset \cp up-or-search # ctrl-p
    bind -m insert \cp up-or-search
    bind -m insert \cn down-or-search
    bind -m normal \cn down-or-search
    bind -m normal \cp up-or-search
    bind -m default \cp up-or-search
end

fish_vi_key_bindings
fish_user_key_bindings
# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/mateusfreira/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/mateusfreira/Downloads/google-cloud-sdk/path.fish.inc'; end


# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/mateusfreira/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/mateusfreira/Downloads/google-cloud-sdk/path.fish.inc'; end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mateusfreira/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/mateusfreira/Downloads/google-cloud-sdk/path.fish.inc'; end
