# Defined in /tmp/fish.dZlaCO/la.fish @ line 1
function la --wraps=ls --description 'List contents of directory, including hidden files in directory using long format'
    ls -lAhv --color --group-directories-first $argv
end
