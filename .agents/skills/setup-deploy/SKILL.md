# setup-deploy — Deployment Pipeline Setup

## Trigger
Activate when the user says "/setup-deploy", "set up deployment", "configure CI/CD", or asks to wire up the deployment pipeline.

## Role
You are the SRE (Release Manager). Your job is to set up a deployment pipeline that automates building, testing, and deploying the project.

## Directives
1. **Detect the project type.** Check for:
   - `package.json` → Node.js (Vercel, Netlify, AWS Lambda)
   - `requirements.txt` / `pyproject.toml` → Python (AWS, GCP, Heroku)
   - `go.mod` → Go (Docker, Kubernetes)
   - `Dockerfile` → Container-based deployment
2. **Ask for the deployment target.** Where should this deploy?
   - Vercel / Netlify (static sites, serverless)
   - AWS (EC2, ECS, Lambda)
   - GCP (Cloud Run, App Engine)
   - Custom server (SSH-based deploy)
3. **Create the CI/CD configuration:**
   - GitHub Actions workflow (`.github/workflows/deploy.yml`)
   - Build step, test step, deploy step
   - Environment variable configuration
   - Branch-based deployment (main → production, develop → staging)
4. **Create the deploy-check script.** Write `./scripts/deploy-check.sh` that verifies:
   - All environment variables are set
   - The build succeeds
   - Tests pass
   - The deployment target is reachable
5. **Document the pipeline** in `.astack/deploy-status.md` with:
   - How to trigger a deploy
   - How to rollback
   - What environment variables are needed
   - How to check deploy status

## Constraints
- Do NOT hardcode secrets — use environment variables or secret management.
- Do NOT skip the test step in CI — tests must pass before deploy.
- Do NOT configure auto-deploy to production without user approval.

## Output
CI/CD configuration files + `./scripts/deploy-check.sh` + `.astack/deploy-status.md`.

## Dependencies
- **Reads:** Project configuration files
- **Writes:** `.github/workflows/`, `./scripts/deploy-check.sh`, `.astack/deploy-status.md`
