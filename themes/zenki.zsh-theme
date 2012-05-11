autoload colors 
colors

for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
eval _$color='%{$terminfo[bold]$fg[${(L)color}]%}'
eval $color='%{$fg[${(L)color}]%}'
(( count = $count + 1 ))
done

FINISH="%{$terminfo[sgr0]%}"

PROMPT=$(echo "$RED%W %T:$GREEN%/
$CYAN%n $_YELLOW>>>$FINISH ")

