# Deferred Commands

Use this workflow when the user separates discussion from execution by defining a later command, asking the agent to wait for a specific phrase, or instructing the agent to process a request and provide feedback without making changes yet.

The purpose of the gate is to give the user a dependable review point. Preserve that review point even when the intended implementation appears clear or routine.

## Core distinction

A command declaration and a command invocation are different events:

- **Declaration** defines the phrase, intended result, scope, and any conditions that must be settled before work begins.
- **Invocation** intentionally releases the gate and authorizes the previously defined work to begin.

Do not treat the declaration itself as invocation. For example, `I am giving you a command called Create Documentation` registers the phrase `Create Documentation`; it does not authorize creation during that message unless the user separately and unambiguously says to execute it now.

## Gate types

Use the type that matches the user's language:

- **Named command:** The user defines an exact phrase such as `Create Build Documentation`. Only intentional invocation of that phrase releases the gate.
- **Unnamed hold:** The user says not to make changes yet and asks for discussion, processing, questions, or feedback without defining an exact phrase. A later explicit instruction to begin the held work releases this gate.
- **Persistent command:** An applicable rule or project instruction permanently associates a documented phrase with a workflow. It remains available according to that documentation and does not need to be redefined in every chat.

Dynamic named commands and unnamed holds apply to the current chat by default. Do not carry them into another chat unless the user explicitly makes them persistent in project or shared instructions.

## State model

| State | Required behavior |
|---|---|
| No gate | Follow the user's current request normally. |
| Declared | Capture the command or hold, its intended result, and its boundaries. Do not execute it. |
| Waiting | Discuss, clarify, and perform only permitted read-only analysis. Make no state-changing actions. |
| Invoked | Begin only the work released by the command or explicit approval. |
| Completed or cancelled | Close the current gate. A dynamic command must be declared again before reuse. |

## Recognizing a declaration

Treat language as a declaration when the user clearly establishes future authorization, including wording such as:

- `I am giving you a command called X.`
- `The command will be X.`
- `Do not start until I give you the command X.`
- `Wait until I say X before making changes.`
- `Do not make changes yet; process this and give me feedback first.`

Equivalent natural language also qualifies when the intent to delay execution is clear. Do not require the user to use one exact introductory sentence.

Do not activate this workflow merely because the user provides a terminal command, discusses command-line arguments, uses ordinary imperative wording, or quotes a command as an example.

## Handling a declaration

When the user establishes a gate:

1. Capture the exact command phrase when one is provided.
2. Capture the work that invocation will authorize, including its target, boundaries, and expected result.
3. Record any conditions or decisions that must remain part of the later execution.
4. Respond with the requested understanding, questions, or recommendations without performing the held work.
5. Identify material ambiguity while the gate is closed so it can be resolved before invocation.
6. Remain in the waiting state until the user intentionally releases, replaces, or cancels the gate.

The conversation is the state record for a dynamic command. Do not create a file or external record for it unless the user separately requests one.

## Waiting behavior

While waiting, the agent may:

- discuss and refine the proposed work;
- answer questions and provide recommendations;
- identify risks, missing decisions, or likely consequences;
- inspect read-only context when the user requests it or when it is necessary to provide the requested feedback; and
- prepare prose, examples, or a plan in the conversation.

While waiting, the agent must not:

- create, edit, move, rename, or delete files;
- change source code, documentation, configuration, application state, or external data;
- run commands whose purpose or normal effect is to generate, build, install, format, migrate, or otherwise mutate state;
- send external messages or create scheduled work;
- stage changes, create commits, rewrite history, merge, or push; or
- begin a partial implementation in anticipation of later approval.

Read-only inspection is not permission to make preparatory changes. If the user prohibits tool use or says to rely only on supplied information, do not inspect additional context.

## Invocation matching

For a named command:

- match the complete registered phrase case-insensitively;
- ignore harmless surrounding punctuation and whitespace;
- require intentional imperative use rather than a substring, quotation, example, or discussion reference;
- do not accept generic phrases such as `go ahead`, `start`, or `do it` as substitutes; and
- preserve the gate and ask when invocation is genuinely ambiguous.

For an unnamed hold, require an explicit instruction to start the held work. Phrases such as `go ahead and create it` can release an unnamed hold when the referenced work is unambiguous.

A persistent command follows the matching and reuse behavior defined by its owning rule or project instruction. Mentioning its name while discussing that workflow is not invocation.

## Scope and authority

Invocation releases only the work associated with the gate. It does not grant general permission to modify unrelated files, projects, systems, or data.

Explicit additional requirements included in the invocation message may refine the released work. If they materially conflict with or expand the declared scope and the intended authorization is unclear, ask before proceeding.

A command never overrides higher-priority instructions, safety requirements, repository boundaries, permission checks, destructive-action safeguards, or rules governing Git commits and external communication. Obtain any separately required authorization at the point it becomes necessary.

## Revision, replacement, and cancellation

The user may refine the pending requirements without invoking the command. Incorporate those refinements into the work that remains gated.

If the user replaces or renames a dynamic command, invalidate the former phrase and wait for the replacement. If the user cancels the command or held work, close the gate without execution.

Multiple commands may be pending when each has a distinct phrase and scope. Invoking one releases only that command; all others remain waiting.

## Completion and reuse

A dynamic command is one-shot by default. Close its gate when the authorized work is complete, cancelled, or replaced. Repeating the same phrase later does not rerun the work unless the user declares it again.

A persistent command may be reused because its owning rule or project instruction preserves its definition. Treat each invocation as one bounded operation and close that operation when complete.

## Examples

### Named command declaration

User: `I am giving you a command called Create Script Design. Do not create anything until I use that command.`

Required response: Capture the intended Script Design scope, provide any requested feedback, and wait. Do not create files when the command is declared.

### Discussion is not invocation

User: `Would Create Script Design also include database scripts?`

Required response: Answer the question and preserve the gate. The phrase is being discussed rather than invoked.

### Unnamed hold and release

User: `Do not make changes yet. Process this and give me suggestions first.`

Required response: Provide the requested analysis without mutations.

Later user: `I agree with those suggestions. Go ahead and create it.`

Required response: Treat the explicit approval as releasing the unambiguous unnamed hold and begin only the agreed work.

## Completion criteria

The workflow has been followed when:

- declaration was not mistaken for invocation;
- no state-changing action occurred while the gate was waiting;
- the user received the requested discussion or feedback before execution;
- invocation was intentional and matched the correct gate;
- execution remained within the agreed scope and all other authorization boundaries; and
- the gate was closed, preserved, replaced, or cancelled accurately.
