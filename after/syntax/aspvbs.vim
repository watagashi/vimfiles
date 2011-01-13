syntax sync minlines=200

syn clear AspVBSFold
syn region AspVBSFold start="^\s*\(class\)\s\+.*$" end="^\s*end\s\+\(class\)\>.*$" fold contained transparent keepend
syn region AspVBSFold start="^\s*\(private\s\+\|public\s\+\)\=\(default\s\+\)\=\(sub\|function\)\s\+.*$" end="^\s*end\s\+\(function\|sub\)\>.*$" fold contained transparent keepend
