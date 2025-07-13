# Enhanced Handoff with Code Discovery
Before ending session, execute these steps:

1. Identify key components from this session:
   - Modified files: $(git diff --name-only HEAD~5..HEAD 2>/dev/null)
   - Main functions/classes worked on
   - Components discussed in decisions

2. Run targeted code discovery:
   ```bash
   CHANGED_FILES=$(git diff --name-only HEAD~5..HEAD 2>/dev/null || echo "")
   FOCUS_TERMS="[identify main components from session]"
   ./discover-code.sh standard "$FOCUS_TERMS" "$CHANGED_FILES" > .claude/temp-discovery.md
   ```

3. Check for knowledge card updates:
Review this session for any discoveries that should be preserved:

- Did we discover any external API quirks or requirements?
- Did we figure out any non-obvious patterns or gotchas?
- Did we make architectural decisions that aren't obvious from code?
- Did we spend hours debugging something others might hit?
If YES to any above:

- Update docs/knowledge-card.md with ONLY these permanent insights
- Focus on "always true" knowledge, not session-specific details
- Keep existing content, add new discoveries under appropriate sections

4. Create handoff with structure: `Session Handoff - $(date +%Y-%m-%d) - [feature]`

### Session Summary
- Current work state: [describe]
- Key accomplishments: [list]
- Pending decisions: [list]
- Blocked items: [list]
- Next steps: [list]

### Code Context Map
[Insert relevant sections from .claude/temp-discovery.md]

### Files Modified This Session
[List with brief descriptions]

### Key Components Worked On
[Main classes/functions/modules touched]

### Dependencies and Relationships
[How components connect to rest of system]

### Important Discoveries
[Any knowledge that was added to knowledge card]
[Quick summary of what future developers should know]

### Pending Work
- [][TODO items]
- [] Blocked on: [what]
- [] Next: [specific task]

### Continuation Info
- Branch: `$(git branch --show-current)`
- Last commit: `$(git log -1 --oneline)`
- Working directory: `$(pwd)`
- Knowledge card updated: `[yes/no]`


5. Save to: .claude/sessions/handoffs/$(date +%Y-%m-%d)-[feature].md
6. Clean up: rm .claude/temp-discovery.md
