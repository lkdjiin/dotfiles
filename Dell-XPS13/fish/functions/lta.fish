function lta --description 'Like lt, with hidden files and dirs'
    tree -L 1 -a $argv
end

