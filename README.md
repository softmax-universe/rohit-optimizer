# Hosted GOTA demo setup

The profile includes the Softmax IDE bridge as a Hermes platform plugin.
See [bridge provisioning](docs/bridge.md) for instance credentials and startup.

This checkout includes a pinned published CLI environment and a Hermes profile distribution.
Start with skills/softmax-demo/SKILL.md. Run its bootstrap and scoped-auth setup before research.
The hosted agent must itself discover the league, develop/upload, evaluate, inspect replays, analyze and push its report.
Local CLI checks are developer validation only, not proof that the hosted agent completed the loop.

# optimizer-seed

The starting state of *your* Coworld optimizer: a game-agnostic repository
that gives you — an engaged competitor plus your coding agent — a complete,
opinionated loop for understanding a game, forming your own strategy, and
iteratively improving a player policy against the live field. You clone it,
it works, and from then on it grows in place: your lessons graduate into its
best practices, your instruments accumulate in your game labs, your records
fill with your campaigns. Two people who plant this seed will have two
visibly different optimizers within months. That's the point.

**The optimizer agent is the model plus this repo.** The coding model brings
reasoning; the repo brings memory, doctrine, instruments, and records — so
the agent stays *your* agent across sessions, models, and harnesses.

## Quick start

New user? Paste `docs/starter-prompt.md` into your coding agent and let it
drive. By hand:

```
git clone https://github.com/softmax-universe/optimizer-seed my-optimizer && cd my-optimizer
softmax login                                  # authenticate with the platform
# wire your agent runtime (ready-made configs for common harnesses):
harness/README.md
# install a game's knowledge pack:
tools/add_game.sh <mixin-repo-url>
# then have your agent open docs/getting-started.md and guide you
```

The guided first session takes about an hour and ends with **your** strategy
uploaded and measured — understanding the game and its meta comes first,
then your take, then the change, then the evaluation. Getting something on
the board fast is explicitly not the goal here; thinking is.

## The shape of it

| Where | What |
|---|---|
| `AGENTS.md` | The constitution: the loop, the eight non-negotiables, the one gate, where every fact lives. Your agent reads it every session. |
| `skills/` | Thirteen process skills — from `meta-recon` (know the field) through `experiment` (falsifiable tests) to `submit` (the gate). Game-agnostic; each resolves its game specifics from the lab's mixin. |
| `games/<game>/` | Your labs, one per game, installed from per-game **mixins** (`tools/add_game.sh`). Each lab holds the game's docs, bindings, memory, experiments, players, and your accumulated instruments. `games/_template/` is the mixin contract. |
| `best_practices.md` · `closed_levers.md` · `user_preferences.md` | Durable memory: graduated practice, refuted levers, your stated preferences (including the speed stance and the autonomy dial). |
| `WORKING_CONTEXT.md` · `TENTATIVE_LESSONS.md` | Live state and the session lesson buffer. Hooks (`tools/`, wired per `harness/`) rotate and nudge automatically — touched labs only, no churn, no filler. |
| `docs/` | getting-started (the guided session), platform.md (dated, re-verifiable platform reference), policy-development.md (building policies that survive), growth.md (what to add when you feel the pain), reports/. |
| `SEED.md` | Provenance and the divergence stance: this repo is expected to drift from the seed. There is no update mechanism by design. |

## For agents

If `WORKING_CONTEXT.md` has **no current objective**, this optimizer hasn't
been onboarded — start with `docs/getting-started.md`, as a guide. A
recorded objective means onboarding is done: resume from WORKING_CONTEXT and
never re-ask what's recorded. Everything else you need is in `AGENTS.md`.

## Origins

Distilled from a comparative study of four working Coworld optimizers
(player_labs, optimizer-skills, cogamer, co-gas): their convergent kernel —
live-field verdicts, one attributable change, honest measurement, one gate,
refutations as assets, state on disk, compounding knowledge — plus the best
of each, unified. The comparison and design documents live alongside the
seed's upstream repository.
