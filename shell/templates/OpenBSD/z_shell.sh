{{ansible_managed|comment(decoration='#')}}

# SHELL ALIASES

# cls
alias cls='printf "\033c"'

# ls
alias ls='colorls -GF'
alias la='ls -laFT' # long listing, list all files
alias ll='ls -lFT'  # long listing
alias lr='ls -lRFT' # long listing, list subdirectories recursively
alias lt='ls -ltFT' # long listing, sort by modification time

{% if not (shell_safety is match('false|no|disable')) %}
# Shell safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
{% endif %}

# SHELL VARIABLES

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
