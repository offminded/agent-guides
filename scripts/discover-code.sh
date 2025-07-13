## `discover-code.sh`

```bash
#!/bin/bash

MODE=${1:-standard}
FOCUS_TERMS=${2:-}
CHANGED_FILES=${3:-}

EXCLUDE_DIRS="node_modules|\.git|dist|build|coverage|\.next|\.cache|vendor"
INCLUDE_EXTS="js|ts|jsx|tsx|py|go|java|rb|php|rs|cpp|c|h"

echo "## Code Discovery Report"
echo "<!-- Generated: $(date) -->"
echo ""

case $MODE in
  quick)
    echo "### Quick Project Overview"
    echo '```'
    find . -type f -regextype posix-extended -regex ".*\.(${INCLUDE_EXTS})" \
        -not -regex ".*/(${EXCLUDE_DIRS})/.*" | head -30
    echo '```'
    
    if [ -d .git ]; then
        echo ""
        echo "### Recent Activity"
        echo '```'
        git log --oneline -5 2>/dev/null
        echo '```'
    fi
    ;;
    
  standard)
    echo "### Relevant Project Structure"
    if [ -n "$CHANGED_FILES" ]; then
        echo '```'
        echo "$CHANGED_FILES" | while read -r file; do
            [ -f "$file" ] && echo "$file"
            dirname "$file"
        done | sort -u | head -20
        echo '```'
    fi
    
    echo ""
    echo "### Key Components"
    if [ -n "$FOCUS_TERMS" ]; then
        for term in $FOCUS_TERMS; do
            echo "#### Related to: $term"
            echo '```'
            grep -r "\b$term\b" . \
                --include="*.${INCLUDE_EXTS//|/*" --include="*.}" \
                --exclude-dir={${EXCLUDE_DIRS//|/,}} \
                -n -B1 -A1 2>/dev/null | head -15
            echo '```'
        done
    fi
    
    echo ""
    echo "### Entry Points"
    echo '```'
    find . -maxdepth 2 -type f \
        \( -name "package.json" -o -name "main.*" -o -name "index.*" \) \
        -not -path "*/node_modules/*" | head -10
    echo '```'
    ;;
esac

if [ -d .git ]; then
    echo ""
    echo "### Git Information"
    echo "- Branch: $(git branch --show-current 2>/dev/null)"
    echo "- Last commit: $(git log -1 --oneline 2>/dev/null)"
fi
