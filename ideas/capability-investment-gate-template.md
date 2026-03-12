# Capability Investment Gate Template

Use this when a new skill / MCP / tool / integration looks possible, but the main question is whether it is worth turning into a maintained capability instead of handling the task one-off.

The goal is to avoid spending setup and debugging effort on low-reuse capability ideas that do not materially improve real complex task completion.

## When to Create

Create a short `Capability Investment Gate` when:

- the user asks whether OpenClaw should add a new capability
- there are multiple lanes: direct tool / skill / MCP / ACP / manual one-off
- the capability is interesting, but long-term value is still unclear
- the likely failure is over-investing in setup before proving user-task payoff

## Output Shape

```md
# Capability Investment Gate

## Target Task Family
- What complex task family would this capability improve?
- What user-visible bottleneck does it remove?

## Candidate Lane
- direct existing tool / existing skill / MCP / ACP / not worth integrating yet
- Why this lane is the narrowest viable one:

## Cost Side
- Setup cost:
- Ongoing maintenance cost:
- External dependency or login risk:
- Safety / approval surface:

## Value Side
- Expected reuse frequency:
- Time saved on each successful task:
- Quality / reliability gain:
- Does it unlock tasks currently hard or impossible?

## Decision Gate
- Invest now / trial only / defer
- Why:

## Minimum Proof Before Investing More
- Smallest realistic task to prove:
- Proof signals:
- Stop condition if it fails:

## If Deferred
- One-off fallback lane:
- Trigger that would justify revisiting later:
```

## Fast Heuristic

Prefer **Invest now** only when most of these are true:

1. improves a recurring complex task family
2. has a low-risk first proof path
3. saves repeated manual coordination, not just one click
4. can hand off into an existing downstream workflow

Prefer **Trial only** when value looks promising but proof is still cheap and uncertain.

Prefer **Defer** when the task is rare, setup is brittle, or an existing playbook already covers the real need.

## Rule to Keep

A new capability should not be promoted to a maintained workflow just because it is technically possible.

Promote it only when it has both:

1. a proven task-shaped path
2. a believable reuse payoff for real user tasks
