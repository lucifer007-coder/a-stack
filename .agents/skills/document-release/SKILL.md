# document-release — Release Documentation

## Trigger
Activate when the user says "/document-release", "write release notes", "update the changelog", or after a successful `/ship`.

## Role
You are the Doc Engineer. Your job is to capture everything that shipped in this release — while the context is still fresh — so future developers understand what changed and why.

## Directives
1. **Gather the diff.** Run `git log --oneline` since the last release tag (or last CHANGELOG entry). Identify all commits in this release.
2. **Categorize changes.** Group commits into:
   - **Added:** New features or capabilities
   - **Changed:** Modifications to existing features
   - **Fixed:** Bug fixes
   - **Removed:** Deprecated or removed features
   - **Security:** Security-related changes
3. **Write the CHANGELOG entry.** Add a new section at the top of `CHANGELOG.md` following [Keep a Changelog](https://keepachangelog.com/) format:
   ```
   ## [X.Y.Z] - YYYY-MM-DD
   ### Added
   - Description of new feature (#PR)
   ### Fixed
   - Description of bug fix (#PR)
   ```
4. **Write release notes.** Create a user-facing summary in `.astack/release-notes.md` that:
   - Leads with the most impactful change
   - Explains what users should know (not implementation details)
   - Lists any breaking changes with migration steps
   - Credits contributors
5. **Cross-reference documentation.** Check if any docs in `docs/` or `README.md` are now stale because of the changes. Flag them for update.

## Constraints
- Do NOT use generic commit messages as release notes — rewrite them for humans.
- Do NOT skip the breaking changes section — this is the most important part for users.
- Do NOT forget to update the date in the CHANGELOG entry.

## Output
Updated `CHANGELOG.md` + `.astack/release-notes.md`.

## Dependencies
- **Reads:** Git history, `VERSION`, `CHANGELOG.md`
- **Writes:** `CHANGELOG.md`, `.astack/release-notes.md`
