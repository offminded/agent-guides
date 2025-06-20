Orchestrate a multi-mind collaborative analysis on: $ARGUMENTS

## Framework Setup

**Moderator Role**: Facilitate discussion, prevent repetition, drive progress, synthesize insights, determine when to proceed to next round.

**Agent Specialization**: Dynamically assign 4-6 unique specialist agents based on the topic, ensuring:
- Each has distinct domain expertise relevant to the topic
- Minimal overlap in knowledge areas to reduce error correlation
- Different analytical approaches (theoretical, practical, empirical, etc.)
- Varied perspectives (technical, business, social, ethical, etc.)

## Multi-Round Process

**Rounds**: Execute for specified number of rounds or default 3 rounds

**Each Round Structure**:
1. **Knowledge Acquisition Phase**: Each agent independently searches web for new information relevant to their specialty and the topic
2. **Analysis Phase**: Each agent presents their analysis incorporating both their expertise and newly discovered information
3. **Cross-Pollination Phase**: Agents respond to each other's insights, identifying synergies and disagreements
4. **Moderator Synthesis**: Moderator prevents repetition, highlights key insights, poses new questions for next round

## Agent Instructions

**For Each Specialist Agent**:
- State your specialty area clearly
- Conduct web searches to gather cutting-edge information relevant to your domain
- Present unique insights that others likely missed due to their different expertise
- Build on previous round learnings while adding new knowledge
- Challenge assumptions from your specialist perspective
- Avoid repeating points already well-covered by other agents

**For Moderator**:
- Assign specialist roles dynamically based on topic complexity
- Identify knowledge gaps and direct agents to search specific areas
- Synthesize insights across specialists
- Pose provocative questions to drive deeper analysis
- Ensure forward progress and prevent circular discussions
- Determine when sufficient insight has been achieved

## Output Format

```
=== ROUND X of Y ===

## Knowledge Acquisition
**Agent 1 (Specialty)**: [Web search findings summary]
**Agent 2 (Specialty)**: [Web search findings summary]
...

## Specialist Analysis
**Agent 1**: [Analysis incorporating new knowledge]
**Agent 2**: [Analysis from different specialist angle]
...

## Cross-Pollination
[Agents respond to each other's insights]

## Moderator Synthesis
[Key insights, unresolved questions, direction for next round]

=== END ROUND X ===
```

## Success Criteria
- Each agent contributes unique value from their specialty
- New knowledge is continuously integrated
- Analysis deepens with each round
- Minimal repetition or redundancy
- Actionable insights emerge from collective intelligence
- Different types of errors/blind spots are caught by different specialists

Begin the multi-mind analysis now, starting with moderator role assignment and Round 1 knowledge acquisition.
