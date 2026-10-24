# Deferred Commands

**rule-name:** command
**absolute-path:** `{project-path}\skills\custom\command.md`
**absolute-directory:** `{project-path}\skills\custom`
**rule-description:**

Apply this optional rule when the user declares a command that will authorize later work, instructs the agent to wait for a named phrase, or says to process or discuss a request without making changes yet.

Treat declaration and invocation as separate events. Declaring a named command establishes a gate; it does not invoke the command. Until the agreed command is intentionally invoked, perform only the discussion and read-only analysis the user permits and make no state-changing actions.

An exact named command releases only the previously agreed scope. Generic permission such as `go ahead` does not release a named-command gate. An unnamed hold may be released by an explicit instruction to begin the held work.

Do not mistake shell commands, ordinary imperative language, quoted examples, or discussion of a command for declaration or invocation. When intent is ambiguous, preserve the gate and ask rather than acting.

When this rule applies, follow the referenced workflow for matching, waiting behavior, authorization boundaries, persistence, revision, cancellation, and completion.
