#### 3. **The `discover-code.sh` Script** (Enhanced Version)
```bash
#!/bin/bash
# discover-code.sh - Smart code discovery

# Parse arguments
MODE=${1:-standard}  # quick, standard, deep
FOCUS_TERMS=${2:-}   # Keywords from session
CHANGED_FILES=${3:-} # Recent changes

# Output header
echo "## Code Discovery Report"
echo "Generated: $(date)"
echo "Mode: $MODE"
echo ""

# 1. Project Structure (filtered by relevance)
echo "### Relevant Project Structure"
if [ -n "$CHANGED_FILES" ]; then
    echo "Based on recent changes:"
    echo '```'
    echo "$CHANGED_FILES" | xargs -I {} dirname {} | sort -u | head -20
    echo '```'
else
    echo '```'
    find . -type f \( -name "*.js" -o -name "*.py" -o -name "*.ts" \) \
        -not -path "*/node_modules/*" -not -path "*/.git/*" \
        | grep -E "${FOCUS_TERMS// /|}" | head -30
    echo '```'
fi
echo ""

# 2. Key Components (based on focus terms)
echo "### Key Components"
if [ -n "$FOCUS_TERMS" ]; then
    for term in $FOCUS_TERMS; do
        echo "#### Related to: $term"
        echo '```'
        grep -r "class $term\|function $term\|const $term" . \
            --include="*.js" --include="*.py" --include="*.ts" \
            --exclude-dir=node_modules --exclude-dir=.git \
            | head -10
        echo '```'
    done
fi
echo ""

# 3. Dependencies and Imports
echo "### Key Dependencies"
echo '```'
if [ -n "$CHANGED_FILES" ]; then
    echo "$CHANGED_FILES" | xargs grep -h "^import\|^from.*import\|require(" \
        | sort -u | head -20
else
    grep -r "^import\|^from.*import" . \
        --include="*.js" --include="*.py" --include="*.ts" \
        --exclude-dir=node_modules | sort -u | head -20
fi
echo '```'
echo ""

# 4. Recent Activity (if in git repo)
if [ -d .git ]; then
    echo "### Recent Git Activity"
    echo '```'
    git log --oneline -10
    echo '```'
fi

# 5. Quick Stats
echo "### Codebase Stats"
echo "- Total source files: $(find . -name "*.js" -o -name "*.py" -o -name "*.ts" | grep -v node_modules | wc -l)"
echo "- Recently modified: $(find . -name "*.js" -o -name "*.py" -o -name "*.ts" -mtime -7 | grep -v node_modules | wc -l)"
echo "- Current branch: $(git branch --show-current 2>/dev/null || echo 'not in git')"
