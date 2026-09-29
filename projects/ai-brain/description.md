# AI Brain

AI Brain is a personal, C#-focused knowledge base for decisions, conventions, reusable workflows, project resources, and project-specific context used during AI-assisted development.

Its documentation uses progressive disclosure to control context and token usage:

1. `ai-brain.md` is the top-level routing index.
2. Compact descriptors explain when a rule or section applies.
3. A selected section's `instructions.md` routes to relevant detailed files.
4. Leaf files contain the full guidance for one concern.

Agents should read the top-level index and compact descriptors, then load only the instructions and leaf files whose descriptions match the current task. They should not recursively read every linked document or load unrelated project, technology, design, or skill guidance.

Routing descriptions must remain short, precise, and explicit about applicability. Detailed content belongs in `instructions.md` or a focused leaf file rather than in the selection layer.
