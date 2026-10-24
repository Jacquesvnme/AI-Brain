# Build Documentation

Use this workflow to create or maintain a durable implementation record for one materially significant project build. The record should let a future reader understand what was intended, where the work occurred, how it should be implemented, and how completion is verified without needing the original conversation.

## Authorization and applicability

The optional rule at `{project-path}\rules\optional\build-documentation.md` is the single source of truth for material-significance triggers.

If a change appears to qualify but the user has not issued `Create Build Documentation`, recommend creating the record and continue only with work already authorized. Do not create or modify Build Documentation merely because the change qualifies.

The command `Create Build Documentation` authorizes creation or maintenance of the documentation record. It does not independently authorize source-code changes, Git staging, commits, rebases, merges, or other implementation work.

## Template

Create each record from:

`{project-path}\base\project-files\documentation\templates\0000-build-template.md`

The `0000` identifier belongs only to the central template. Never copy it into a project under that name and never count it as a project build.

Use the current project's applicable context and conventions, but keep the build document focused on the single coherent build being recorded.

## Destination

Store build documents in a `Build` directory at the topmost directory of the current project:

`{current-project-root}\Build`

Create the directory only when the first build document is authorized. Do not create empty `Build` directories pre-emptively.

## Filename and sequence

Name each document with a four-digit identifier, a hyphen, a concise lowercase kebab-case description, and the `.md` extension:

`NNNN-build-description.md`

For example:

- `0001-initial-library-management.md`
- `0002-collection-management.md`
- `0003-statistics-dashboard.md`

For a new record, capture the highest valid existing build number before creating the document, using `0000` when no build documents exist. Assign one greater than that captured number, so the first record is `0001`. Do not fill abandoned gaps, assign an existing identifier to a different build, or renumber existing documents; stable identifiers preserve the historical sequence.

When maintaining an existing record for the same build, update it in place and preserve its identifier and filename. Do not assign a new identifier or create a second record merely because the document is being updated.

Keep the description short but specific. Do not use spaces, underscores, an additional numeric prefix, or a generic name such as `changes`.

## Document purpose

One document represents one coherent, materially significant build. It is an implementation record rather than a conversation transcript, changelog, commit log, or raw diff.

Write enough context and instruction for another capable agent or developer to understand and carry out the work without the original conversation. Record actionable rationale and constraints, but do not include private chain-of-thought reasoning.

## Creation and update workflow

1. Identify the topmost directory of the current project and confirm that it is the intended documentation target.
2. Determine whether to create a new record or update an existing record for the same build, and whether the record is being written before, during, or after implementation.
3. For a new record, inspect the existing `Build` directory, if present, capture the highest valid existing build number before creating the document, and assign the next identifier. For an update, identify the existing record and retain its identifier and filename.
4. Read the Git state needed for the Build information section. Record facts rather than guessing when history is incomplete.
5. For a new record, copy the central template to the assigned destination and filename, then replace or remove every double-braced instruction. For an update, edit the existing record in place and preserve its relevant content and history.
6. Write implementation-oriented context, goals, scope, instructions, decisions, affected areas, verification, risks, and acceptance criteria.
7. Verify the filename, sequence, required sections, resolved placeholders, and Git metadata.

## Build information and Git tracking

Populate the Build information section as follows:

- **Status:** Use `Planned`, `In progress`, `Completed`, or `Superseded`.
- **Created:** Use the calendar date on which the document is first created in `YYYY-MM-DD` format.
- **Completed:** Use the completion date in `YYYY-MM-DD` format, or remove the field until completion.
- **Implementation branch:** Record the branch on which implementation occurs. If the repository is in detached-HEAD state, state that explicitly with the current commit.
- **Base commit:** Record the full commit hash from which implementation began. Capture it before implementation when possible and keep it stable as the branch advances.
- **Final implementation commit:** Record the full hash of the latest commit that materially changed the completed implementation. Use `Pending` until that commit exists.
- **Type:** Use a concise category such as `New capability`, `Refinement`, `Refactor`, `Migration`, or another accurate description.

Capture full Git commit hashes rather than abbreviated values. Exclude later documentation-only commits from the final implementation commit so the document does not attempt to refer to the commit that contains its own hash.

Use a factual explanation such as `Not available - project is not a Git repository` when Git metadata cannot exist. If a base commit cannot be reconstructed safely, report the uncertainty instead of inventing a hash.

Refresh the branch or final implementation commit after an amend, rebase, branch move, or squash merge changes the durable reference. After a squash merge, prefer the resulting implementation commit on the target branch.

## Template application

Preserve the template's section order unless the build has a concrete reason to add a more specific section.

The shared placeholder behavior in `{project-path}\base\project-files\instructions.md` applies. Replace or remove every double-braced instruction before treating the project document as complete. When a value is not yet available, use explicit prose such as `Pending`; do not leave the template instruction in place.

Use ordered subsections under Build instructions when the implementation has dependencies or distinct areas. Remove unused example subsections rather than retaining empty headings.

## Lifecycle

Use these status values:

- `Planned` when the document describes approved or proposed work that has not started;
- `In progress` while implementation is underway;
- `Completed` after the acceptance criteria and verification have passed; and
- `Superseded` when a later build document replaces the intended work.

Keep the base commit stable. Update the implementation branch when the work moves to another branch. Update the final implementation commit to the latest material implementation commit when one becomes available.

When completing a build, record material deviations from the original instructions, the verification result, and any deliberately deferred follow-up. Do not rewrite the plan to pretend the implementation never changed.

## Verification

Before finishing:

1. confirm the destination is the current project's topmost `Build` directory;
2. for a new record, confirm the identifier is one greater than the highest valid build number captured before creation (`0000` if none existed), and is not shared by another record; for an update, confirm the original identifier and filename are unchanged;
3. confirm the filename description is concise kebab case;
4. confirm exactly one document represents the coherent build;
5. confirm every required section contains project-specific, actionable content;
6. confirm no unresolved double-braced instructions remain;
7. confirm branch and commit values are accurate, pending, or explicitly unavailable;
8. confirm the document does not claim that unperformed implementation or verification is complete; and
9. confirm no implementation or Git mutation occurred without separate authorization.
