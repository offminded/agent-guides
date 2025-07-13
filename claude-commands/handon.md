# Complete Memory Transfer

Execute this sequence to load all context:

1. Find latest session files:
   ```bash
   LATEST_COMPACT=$(ls -t .claude/sessions/*-compact.md 2>/dev/null | head -1)
   LATEST_HANDOFF=$(ls -t .claude/sessions/handoff-*.md 2>/dev/null | head -1)
   ```

Run current state discovery:
```bash
./discover-code.sh quick "" "" > .claude/temp-current-state.md
```

3. Load context in order:
- a) Read knowledge card if exists (persistent knowledge): `@docs/knowledge-card.md`
- b) Read latest handoff if exists: `@$LATEST_HANDOFF`
- c) Read compact summary if exists: `@$LATEST_COMPACT`
- d) Read current state: `@.claude/temp-current-state.md`

4. Verify current state:
```bash
echo "=== Current Git State ==="
git log --oneline -5
git status -s
echo "======================="
```

5. Synthesize understanding: 
Based on loaded context, I understand:
- Previous work focused on: [from handoff]
- Key accomplishments: [from compact]
- Current codebase state: [from discovery]
- Pending tasks: [from handoff]


6. Clean up: `rm .claude/temp-current-state.md`
Ready to continue work with full context.
