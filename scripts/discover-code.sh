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
    find . -type f -regextype posix-extended -regex ".*\.(${INCLUDE_EXTS})$" \
        -not -regex ".*/(${EXCLUDE_DIRS})/.*" 2>/dev/null | head -30
    echo '```'
    
    if [ -d .git ]; then
        echo ""
        echo "### Recent Activity"
        echo '```'
        git log --oneline -5 2>/dev/null || echo "No git history found"
        echo '```'
    fi
    ;;
    
  standard)
    echo "### Relevant Project Structure"
    if [ -n "$CHANGED_FILES" ]; then
        echo '```'
        echo "$CHANGED_FILES" | while IFS= read -r file; do
            [ -f "$file" ] && echo "$file"
            [ -f "$file" ] && dirname "$file"
        done | sort -u | head -20
        echo '```'
    fi
    
    echo ""
    echo "### Key Components"
    if [ -n "$FOCUS_TERMS" ]; then
        # Convert extensions to grep include patterns
        GREP_INCLUDES=""
        IFS='|' read -ra EXT_ARRAY <<< "$INCLUDE_EXTS"
        for ext in "${EXT_ARRAY[@]}"; do
            GREP_INCLUDES="$GREP_INCLUDES --include=*.${ext}"
        done
        
        # Convert exclude dirs for grep
        EXCLUDE_DIRS_COMMA="${EXCLUDE_DIRS//|/,}"
        
        for term in $FOCUS_TERMS; do
            echo "#### Related to: $term"
            echo '```'
            grep -r "$term" . \
                $GREP_INCLUDES \
                --exclude-dir="${EXCLUDE_DIRS_COMMA}" \
                -n -B1 -A1 2>/dev/null | head -15 || echo "No matches found"
            echo '```'
        done
    fi
    
    echo ""
    echo "### Entry Points"
    echo '```'
    find . -maxdepth 2 -type f \
        \( -name "package.json" -o -name "main.*" -o -name "index.*" \) \
        -not -path "*/node_modules/*" 2>/dev/null | head -10
    echo '```'
    ;;
esac

if [ -d .git ]; then
    echo ""
    echo "### Git Information"
    echo "- Branch: $(git branch --show-current 2>/dev/null || echo 'unknown')"
    echo "- Last commit: $(git log -1 --oneline 2>/dev/null || echo 'no commits')"
fi
