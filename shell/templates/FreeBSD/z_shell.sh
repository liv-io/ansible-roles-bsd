{{ansible_managed|comment(decoration='#')}}

#-------------------------------------------------------------------------------
# COLOR SUPPORT
#-------------------------------------------------------------------------------

{% if not (shell_color_support is match('false|no|disable')) %}
# ls
alias ls='ls -FI -G -D "{{shell_ls_time_style}}"'
alias la='ls -laF -G -D "{{shell_ls_time_style}}"' # long listing, list all files
alias ll='ls -lFI -G -D "{{shell_ls_time_style}}"'  # long listing
alias lr='ls -lRFI -G -D "{{shell_ls_time_style}}"' # long listing, list subdirectories recursively
alias lt='ls -ltFI -G -D "{{shell_ls_time_style}}"' # long listing, sort by modification time
alias lz='ls -lZFI -G -D "{{shell_ls_time_style}}"' # long listing, shellow MAC label

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
{% endif %}

#-------------------------------------------------------------------------------
# SHELL ALIASES
#-------------------------------------------------------------------------------

# cls
alias cls='printf "\033c"'

{% if not (shell_safety is match('false|no|disable')) %}
# Shell safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ln='ln -i'
{% endif %}

#-------------------------------------------------------------------------------
# SHELL VARIABLES
#-------------------------------------------------------------------------------

{% if not (shell_ftp_proxy == '') %}
# ftp_proxy
ftp_proxy='{{shell_ftp_proxy}}'
export ftp_proxy
{% endif %}

{% if not (shell_http_proxy == '') %}
# http_proxy
http_proxy='{{shell_http_proxy}}'
export http_proxy
{% endif %}

{% if not (shell_https_proxy == '') %}
# https_proxy
https_proxy='{{shell_https_proxy}}'
export https_proxy
{% endif %}

{% if not (shell_no_proxy == []) %}
# no_proxy
no_proxy='{% for item in shell_no_proxy %}{{item}}{% if not loop.last %},{% endif %}{% endfor %}'
export no_proxy
{% endif %}

{% if not (shell_histsize == '') %}
# HISTSIZE
HISTSIZE={{(shell_histsize|int)}}
export HISTSIZE
{% endif %}

{% if not (shell_pager == '') %}
# PAGER
PAGER='{{shell_pager}}'
export PAGER
{% endif %}
