# Claude Code Custom Commands Collection

This directory contains reusable custom commands for Claude Code that enhance productivity and enable advanced workflows.

## Installation

### Option 1: Project-Level Commands
Copy commands to your project's `.claude/commands/` directory:
```bash
# In your project root
mkdir -p .claude/commands
cp claude-commands/*.md .claude/commands/
```

### Option 2: Global Commands  
Copy commands to your global Claude directory for use across all projects:
```bash
# Global installation
mkdir -p ~/.claude/commands
cp claude-commands/*.md ~/.claude/commands/
```

## Available Commands

### 🔍 Search Commands

#### `/project:search-prompts` or `/user:search-prompts`
**Purpose**: Search across all your Claude Code conversation history  
**Usage**: `/project:search-prompts "search term"`

**What it provides**:
- Multi-source search across database and project histories
- Session-based search with resumable conversation IDs
- Advanced pattern matching and temporal filtering
- Conversation summary search for high-level topics
- Integration with `claude --resume` for continuing relevant discussions

**Example**: `/project:search-prompts "machine learning pipeline"`

### 📝 Code Analysis Commands

#### `/project:analyze-function` or `/user:analyze-function`
**Purpose**: Deep line-by-line analysis of any function in your codebase  
**Usage**: `/project:analyze-function filename:function_name` or `/project:analyze-function filename function_name`

**What it provides**:
- Technical implementation details and performance implications
- Edge cases and potential issues  
- Connection to broader codebase architecture
- Critical details often missed from casual reading
- Mathematical foundations and optimization techniques

**Example**: `/project:analyze-function train.py:detect_words_gpu`

### 🧠 Multi-Mind Collaboration Commands

#### `/project:multi-mind` or `/user:multi-mind`
**Purpose**: Execute multi-specialist collaborative analysis with configurable rounds  
**Usage**: `/project:multi-mind "topic" [rounds=3]`

**Features**:
- Dynamic specialist assignment based on topic complexity
- Web search integration for fresh knowledge each round
- Anti-repetition mechanisms for progressive insight building
- Cross-pollination between specialists with different expertise
- Configurable number of analysis rounds

**Examples**:
```bash
/project:multi-mind "Should we implement quantum error correction in our ML pipeline?"
/project:multi-mind "Climate change mitigation strategies" rounds=5
```

#### `/project:multi-mind-debate` or `/user:multi-mind-debate`
**Purpose**: Structured multi-perspective debate format with specialist agents  
**Usage**: `/project:multi-mind-debate "topic"`

**Features**:
- 4-6 dynamically assigned specialist roles per topic
- Each specialist has distinct domain expertise with minimal overlap
- Independent error detection through different analytical approaches
- Active moderator driving progress and preventing repetition
- Web search integration for cutting-edge information

**Example**: `/project:multi-mind-debate "Scaling transformer architectures beyond current GPU memory limits"`

## Multi-Mind System Architecture

### Core Principles
- **Many Minds**: 4-6 dynamically assigned specialists per topic
- **Unique Specialists**: Each has distinct domain expertise with minimal correlation
- **Error Decorrelation**: Different analytical approaches catch different blind spots  
- **Active Moderation**: Drives progress, prevents repetition, synthesizes insights
- **Progressive Knowledge**: Web search integration ensures fresh information each round

### Specialist Selection Criteria
- Unique domain expertise relevant to the topic
- Different methodological approaches (quantitative/qualitative, theoretical/practical)
- Varied temporal perspectives (historical, current, future-focused)
- Distinct risk/opportunity sensitivities
- Independent information sources and knowledge bases

### Anti-Repetition Mechanisms
- Moderator tracks coverage vs. gaps requiring exploration
- Specialists build on previous insights rather than restating
- Focus on unique expertise contributions to collective understanding
- Challenge emerging consensus from specialist perspectives

## Command Development

### Creating New Commands
1. Create a new `.md` file in this directory
2. Use `$ARGUMENTS` placeholder for dynamic parameters
3. Include clear usage instructions and examples
4. Test the command in a Claude Code session
5. Update this README with the new command

### Command Template
```markdown
# Command Description
Brief description of what this command does.

**Usage**: `/project:command-name $ARGUMENTS`

## Instructions
Detailed instructions for Claude on how to execute this command.

## Examples
Example usage scenarios and expected outputs.
```

### Best Practices
- Make commands reusable across different projects
- Include clear success criteria and expected outcomes
- Provide examples that demonstrate the command's value
- Use namespacing with subdirectories for related commands
- Document any prerequisites or dependencies

## Contributing

To contribute new commands:
1. Create the command file following the template
2. Test it in a real Claude Code session  
3. Add documentation to this README
4. Submit a pull request with clear description of the command's purpose and benefits

## Command Categories

### 🔍 Search & Discovery
- `search-prompts.md` - Comprehensive conversation history search

### 📊 Analysis & Research
- `analyze-function.md` - Deep function analysis
- `multi-mind.md` - Multi-specialist collaborative analysis
- `multi-mind-debate.md` - Structured expert debates

### 🔧 Development Workflow
*(Future commands for development automation)*

### 📚 Documentation & Learning  
*(Future commands for documentation generation)*

### 🚀 Deployment & Operations
*(Future commands for deployment assistance)*

## License

These commands are provided under the same license as the agent-guides repository. Feel free to modify and adapt them for your specific needs.

## Related Resources

- [Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code/slash-commands)
- [Claude Custom Commands Guide](../claude-custom-commands.md)
- [Claude Code Search Best Practices](../claude-code-search-best-practices.md)
