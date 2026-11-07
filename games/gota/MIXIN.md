# GOTA binding

Game: Gods of the Arena, Polyworld game-hosted BASIC policies. Resolve league and revision live; no hardcoded league ID.
Mechanics source: https://github.com/softmax-universe/polyworld/tree/main/coworld/gota and the live participation guide.

| Binding | Implementation |
|---|---|
| ab | ../../skills/softmax-demo/references/gota-analysis.md: matched rosters, per-seat/team analysis, smoke-only verdict |
| survey | same reference: failures, stalled pushes, deaths and score outliers |
| replay-inspection | same reference: source-matched native verifier or actual hosted viewer inspection |
| eval-design | ../../skills/softmax-demo/references/platform.md: bounded paired single-episode requests |
| diagnosis | gota-analysis.md: one observed failure, source location, hypothesis and attributable change |

The policy is a .bas source file, uploaded with coworld upload-policy --file. No policy image build is required.
The separate policy repository starts with an imported upstream base.bas; refresh against the actual hosted contract before use.
