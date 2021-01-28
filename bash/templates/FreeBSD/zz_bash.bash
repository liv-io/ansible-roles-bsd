{{ansible_managed|comment(decoration='#')}}

# SHELL OPTIONS

# checkwinsize
{% if (bash_checkwinsize is match('false|no|disable')) %}
shopt -d checkwinsize
{% else %}
shopt -s checkwinsize
{% endif %}

# histappend
{% if (bash_histappend is match('false|no|disable')) %}
shopt -d histappend
{% else %}
shopt -s histappend
{% endif %}

# SHELL VARIABLES

{% if not (bash_histcontrol is match('false|no|disable')) %}
# HISTCONTROL
HISTCONTROL='{{bash_histcontrol}}'
{% if not (bash_history_readonly is match('false|no|disable')) %}
readonly HISTCONTROL
{% endif %}
export HISTCONTROL
{% endif %}

{% if not (bash_histfilesize is match('false|no|disable')) %}
# HISTFILESIZE
HISTFILESIZE={{(bash_histfilesize|int)}}
{% if not (bash_history_readonly is match('false|no|disable')) %}
readonly HISTFILESIZE
{% endif %}
export HISTFILESIZE
{% endif %}

{% if not (bash_histignore is match('false|no|disable')) %}
# HISTIGNORE
HISTIGNORE='{{bash_histignore}}'
{% if not (bash_history_readonly is match('false|no|disable')) %}
readonly HISTIGNORE
{% endif %}
export HISTIGNORE
{% endif %}

{% if not (bash_histsize is match('false|no|disable')) %}
# HISTSIZE
HISTSIZE={{(bash_histsize|int)}}
{% if not (bash_history_readonly is match('false|no|disable')) %}
readonly HISTSIZE
{% endif %}
export HISTSIZE
{% endif %}

{% if not (bash_histtimeformat is match('false|no|disable')) %}
# HISTTIMEFORMAT
HISTTIMEFORMAT='{{bash_histtimeformat}}'
{% endif %}

{% if not (bash_prompt_command is match('false|no|disable')) %}
# PROMPT_COMMAND
PROMPT_COMMAND='{{bash_prompt_command}}'
{% if not (bash_history_readonly is match('false|no|disable')) %}
readonly PROMPT_COMMAND
{% endif %}
export PROMPT_COMMAND
{% endif %}

{% if not (bash_tmout is match('false|no|disable')) %}
# TMOUT
TMOUT={{(bash_tmout|int)}}
{% if not (bash_tmout_readonly is match('false|no|disable')) %}
readonly TMOUT
{% endif %}
export TMOUT
{% endif %}

{% if not (bash_color_prompt is match('false|no|disable')) %}
# COLOR PROMPT

PS1='\[\033[1;36m\]\u\[\033[1;37m\]@\[\033[1;33m\]\h\[\033[1;37m\]:\[\033[1;31m\]\w \[\033[1;36m\]\$ \[\033[0m\]'
echo -n -e '\033%G'
{% endif %}

# KEY BINDINGS

if [[ $- =~ i ]]; then
  bind '"\e[1~": beginning-of-line'
  bind '"\e[4~": end-of-line'
fi
