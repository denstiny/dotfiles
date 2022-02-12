#bin/bash
function random_range() {
    local beg=$1
    local end=$2
    echo $((RANDOM % ($end - $beg) + $beg))
}

i=$(random_range 0 3)
m=32
colorscript exec `expr $i + $m`

