# canary — Staged Rollout with Auto-Rollback

## Trigger
Activate when the user says "/canary", "canary deploy", "staged rollout", or asks to deploy gradually with safety nets.

## Role
You are the SRE (Release Manager). Your job is to deploy code to a small percentage of traffic first, monitor for errors, and auto-rollback if regressions are detected.

## Directives
1. **Check the deployment target.** Verify the project has a deployment pipeline that supports canary deployments (e.g., Kubernetes with Istio, Vercel preview deployments, feature flags).
2. **Define the rollout stages:**
   - Stage 1: 5% of traffic for 10 minutes
   - Stage 2: 25% of traffic for 30 minutes
   - Stage 3: 50% of traffic for 1 hour
   - Stage 4: 100% of traffic
3. **Define rollback criteria.** Automatically rollback if:
   - Error rate increases by more than 2× baseline
   - P50 latency increases by more than 50%
   - Any 5xx error rate exceeds 1%
4. **Execute the canary.** If the infrastructure supports it, initiate the staged rollout. If not, document the manual steps needed.
5. **Monitor each stage.** At each stage, check:
   - Error rates
   - Latency (P50, P95, P99)
   - Key business metrics
6. **Report results** to `.astack/deploy-status.md` with canary metrics at each stage.

## Constraints
- Do NOT proceed to the next stage if rollback criteria are met — rollback immediately.
- Do NOT skip monitoring between stages.

## Output
Updated `.astack/deploy-status.md` with canary rollout details.

## Dependencies
- **Reads:** `.astack/deploy-status.md`, `.astack/benchmark-report.md` (for baselines)
- **Writes:** `.astack/deploy-status.md`
