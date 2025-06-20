# Page - Session History Dump with Citations

Dumps the entire conversation history into a comprehensive markdown file with full source attribution and creates a compacted memory summary.

## Usage

```
/project:page [filename_prefix]
```

## Arguments

- `filename_prefix` (optional): Custom prefix for output files. Defaults to "session-dump"

## Description

This command creates a comprehensive archive of the current session including:

1. **Full History File** (`{prefix}-{timestamp}-full.md`):
   - Complete conversation transcript
   - All file reads with full content and paths  
   - Web page content with URLs
   - Command outputs with execution context
   - Tool usage with parameters and results
   - Proper citation formatting for all sources

2. **Compact Memory File** (`{prefix}-{timestamp}-compact.md`):
   - Executive summary of session
   - Key decisions and outcomes
   - Important code changes made
   - Reference index to full history
   - Condensed for future context loading

## Implementation

Please execute this comprehensive session documentation process:

### Phase 1: History Extraction
- Access the current conversation thread
- Extract all messages (user and assistant)
- Identify all tool usage and parameters
- Catalog all file operations and content

### Phase 2: Source Attribution  
Parse and cite all sources encountered:
- **Local Files**: `file:///path/to/file.ext#L10-L20` 
- **Web Pages**: `[Source Title](https://url.com)` with content excerpt
- **Command Outputs**: `$ command` with full output and exit codes
- **Tool Results**: Tool name, parameters, and results
- **Generated Content**: Mark AI-generated vs user-provided content

### Phase 3: Full History Generation
Create comprehensive markdown with:
```markdown
# Session History - {timestamp}

## Session Overview
- Start Time: {start}
- Duration: {duration} 
- Total Messages: {count}
- Files Modified: {file_count}
- Web Pages Accessed: {web_count}
- Commands Executed: {cmd_count}

## Conversation Timeline

### Message 1 - User ({timestamp})
{content}

**Sources Referenced:**
- [file.py](file:///path/file.py#L1-L50) - Function implementation
- [Documentation](https://example.com/docs) - API reference

### Message 2 - Assistant ({timestamp})
{content}

**Tools Used:**
- read_file: `/path/to/file.py` (lines 1-50)
- web_search: "claude code best practices" (8 results)
- Bash: `git status` (exit code: 0)

**Files Created/Modified:**
- [new_feature.py](file:///path/new_feature.py) - Created
- [config.json](file:///path/config.json#L15) - Modified line 15

{continue for all messages...}

## Source Index

### Local Files Accessed
1. [file1.py](file:///path/file1.py) - Read 3 times, modified once
2. [config.json](file:///path/config.json) - Modified

### Web Resources  
1. [Claude Code Best Practices](https://anthropic.com/...) - Retrieved Apr 18
2. [GitHub Repository](https://github.com/...) - Searched for examples

### Command Executions
1. `git status` - Check repository state
2. `npm run build` - Build verification  

## Generated Artifacts
- Commands created: 4
- Files created: 2  
- Files modified: 3
```

### Phase 4: Memory Compaction
Generate executive summary:
```markdown
# Session Compact Memory - {timestamp}

## Executive Summary
{2-3 sentence summary of what was accomplished}

## Key Decisions Made
- Decision 1: Reasoning and outcome
- Decision 2: Context and implementation

## Code Changes Summary  
- Feature A: Added functionality X to file Y
- Bug Fix B: Resolved issue Z in component W

## Important Context for Future Sessions
- Project uses framework X with pattern Y
- Key files: config.json, main.py, utils/helpers.py
- Build command: `npm run build`
- Test command: `npm test`

## Quick Reference Links
- [Full History](./{prefix}-{timestamp}-full.md)
- [Key File 1](file:///path/key-file.py)
- [Important Documentation](https://url.com)

## Session Metrics
- Duration: {duration}
- Files touched: {count}
- Major features added: {count}
- Issues resolved: {count}
```

### Phase 5: File Management
- Save both files with timestamp
- Create symlinks to latest versions
- Add entries to `.gitignore` if needed
- Confirm successful save with file sizes

## Output Format

The command generates two files:
1. `{prefix}-{timestamp}-full.md` - Complete history (typically large)
2. `{prefix}-{timestamp}-compact.md` - Executive summary (optimized for context)

Both files use consistent markdown formatting with proper citations and are immediately available for reference or inclusion in future sessions.

## Example Usage

```bash
# Basic usage - creates session-dump files
/project:page

# Custom prefix
/project:page feature-implementation

# Results in:
# - feature-implementation-20250620-143022-full.md
# - feature-implementation-20250620-143022-compact.md
```

This command is essential for maintaining context across long development sessions and creating comprehensive documentation of AI-assisted development workflows.
