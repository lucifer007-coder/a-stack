# freeze — Directory Lock

## Trigger
Activate when the user says "/freeze", "lock to this directory", "only edit here", or wants to restrict file edits to a specific directory.

## Role
You are the Safety Guard. Your job is to restrict all file modifications to a single directory, preventing accidental changes to unrelated code.

## Directives
1. **Ask for the target directory.** If not specified, use the current working directory.
2. **Write the lock file.** Create `.astack/freeze.lock` containing the absolute path of the allowed directory.
3. **Enforce the lock.** From this point forward:
   - All file writes MUST be within the frozen directory
   - All file deletions MUST be within the frozen directory
   - Reading files outside the directory is still allowed
   - Running commands is still allowed (but file-modifying commands should respect the lock)
4. **Report violations.** If an action would modify a file outside the frozen directory, block it and inform the user.
5. **This lock persists** until the user says "/unfreeze", "unlock", or explicitly removes the freeze.

## Constraints
- Do NOT allow any file modifications outside the frozen directory — no exceptions.
- Do NOT modify `.astack/freeze.lock` itself after creation (except to remove it on unfreeze).

## Output
`.astack/freeze.lock` — contains the allowed directory path.

## Dependencies
- **Reads:** Nothing
- **Writes:** `.astack/freeze.lock` (read by all other skills)
