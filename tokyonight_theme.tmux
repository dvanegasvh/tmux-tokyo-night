#!/bin/bash
tokyo_black="#15161e"
tokyo_yellow="#ffb454"
tokyo_white="#a9b1d6"
tokyo_blue="#7aa2f7"
tokyo_gray="#414868"
tokyo_comment_grey="#5c6370"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$tokyo_white"
set "message-bg" "$tokyo_black"

set "message-command-fg" "$tokyo_white"
set "message-command-bg" "$tokyo_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$tokyo_black"
setw "window-status-bg" "$tokyo_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$tokyo_black"
setw "window-status-activity-fg" "$tokyo_black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$tokyo_comment_grey"
set "window-active-style" "fg=$tokyo_white"

set "pane-border-fg" "$tokyo_white"
set "pane-border-bg" "$tokyo_black"
set "pane-active-border-fg" "$tokyo_blue"
set "pane-active-border-bg" "$tokyo_black"

set "display-panes-active-colour" "$tokyo_yellow"
set "display-panes-colour" "$tokyo_blue"

set "status-bg" "$tokyo_black"
set "status-fg" "$tokyo_white"

set "@prefix_highlight_fg" "$tokyo_black"
set "@prefix_highlight_bg" "$tokyo_blue"
set "@prefix_highlight_copy_mode_attr" "fg=$tokyo_black,bg=$tokyo_blue"
set "@prefix_highlight_output_prefix" "  "

status_widgets=$(get "@onedark_widgets")
time_format=$(get "@onedark_time_format" "%R")
date_format=$(get "@onedark_date_format" "%d/%m/%Y")

set "status-right" "#[fg=$tokyo_white,bg=$tokyo_black,nounderscore,noitalics]${time_format}  ${date_format} #[fg=$tokyo_gray,bg=$tokyo_black]#[fg=$tokyo_gray,bg=$tokyo_gray]#[fg=$tokyo_white, bg=$tokyo_gray]${status_widgets} #[fg=$tokyo_blue,bg=$tokyo_gray,nobold,nounderscore,noitalics]#[fg=$tokyo_black,bg=$tokyo_blue,bold] #h #[fg=$tokyo_yellow, bg=$tokyo_blue]"
set "status-left" "#[fg=$tokyo_black,bg=$tokyo_blue,bold] #S #{prefix_highlight}#[fg=$tokyo_blue,bg=$tokyo_black,nobold,nounderscore,noitalics]"

set "window-status-format" "#[fg=$tokyo_black,bg=$tokyo_black,nobold,nounderscore,noitalics]#[fg=$tokyo_white,bg=$tokyo_black] #I  #W #[fg=$tokyo_black,bg=$tokyo_black,nobold,nounderscore,noitalics]"
set "window-status-current-format" "#[fg=$tokyo_black,bg=$tokyo_gray,nobold,nounderscore,noitalics]#[fg=$tokyo_white,bg=$tokyo_gray,nobold] #I  #W #[fg=$tokyo_gray,bg=$tokyo_black,nobold,nounderscore,noitalics]"
