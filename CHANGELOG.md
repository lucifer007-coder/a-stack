# Changelog

All notable changes to this project will be documented in this file.

## [1.0.1] - 2026-05-22
### Fixed
- **Installer & Setup**: Resolved critical bug where local installations through `install.sh` copied files into a temporary directory (`.astack-local`) which was subsequently deleted, resulting in no files being installed.
- **Setup Script**: Implemented dynamic source path resolution (`SRC_DIR`) using `${BASH_SOURCE[0]}` to allow calling the script from any external working directory (e.g. `~/.astack/setup --team`) without relative path copy failures.
- **Self-Copy Avoidance**: Added path-matching helper to prevent redundant file operations, warnings, and loops when running `setup` from inside the repository itself.
- **Deploy Pre-flight Check**: Resolved path vulnerability in `scripts/deploy-check.sh` by dynamically computing `SCRIPT_DIR` to execute sibling lint and test scripts robustly regardless of current working directory.
- **Gitignore Safety**: Hardened `.gitignore` appending to check for and insert missing trailing newlines, preventing existing configuration corruptions.

## [1.0.0] - 2026-05-14
### Added
- Initial release of `a-stack`.
- 6 core agents: CEO, Architect, Designer, QA Lead, SRE, Doc Engineer.
- 30+ slash command definitions in `.agents/skills/`.
- Global configuration via `AGENTS.md`.
- Sprint flow orchestration via `/autoplan`.
- Installer and setup scripts.
- Foundational documentation and ethos.
