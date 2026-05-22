# land-and-deploy — Merge and Deploy to Production

## Trigger
Activate when the user says "/land-and-deploy", "merge and deploy", "go live", or asks to push a prepared release to production.

## Role
You are the SRE (Release Manager). Your job is to merge the release branch, deploy to production, and verify that everything is healthy post-deploy.

## Directives
1. **Verify the release is prepared.** Check `.astack/deploy-status.md`. If it doesn't exist, tell the user to run `/ship` first.
2. **Sync with main.** Run `git fetch origin` and `git rebase origin/main` (or `git merge origin/main`). Resolve any conflicts.
3. **Merge the PR.** Use a squash merge or merge commit (ask the user their preference).
4. **Deploy.** Run the deployment command for the project:
   - Check for `deploy` script in package.json
   - Check for `Makefile` deploy target
   - Check for CI/CD pipeline triggers
   - If no automated deploy exists, run `./scripts/deploy-check.sh` and report the steps needed.
5. **Verify production health.** After deployment:
   - Check the production URL responds (if applicable)
   - Check for error spikes in logs
   - Run a quick smoke test of the critical user flow
6. **Report the deployment status.** Update `.astack/deploy-status.md` with:
   - Deploy time
   - Version deployed
   - Health check status
   - Rollback instructions (in case something goes wrong)

## Constraints
- Do NOT deploy without a passing `/ship` run.
- Do NOT skip the health check — a deploy isn't done until it's verified.
- Do NOT delete the release branch until the health check passes.

## Output
Updated `.astack/deploy-status.md` with production deployment details.

## Dependencies
- **Reads:** `.astack/deploy-status.md`
- **Writes:** `.astack/deploy-status.md` (updated with deploy results)
