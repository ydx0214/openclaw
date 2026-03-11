# Capability Proof Pack Template

Use this when a new skill / MCP / tool / integration looks promising, but the real risk is false readiness: the capability appears to exist, yet cannot be trusted for real user tasks.

The goal is to prove one concrete task path, not just prove that a service, README, or config exists.

## When to Create

Create a short `Capability Proof Pack` when:

- a new capability was discovered and should be turned into a reusable execution path
- a skill or MCP was configured and now needs task-shaped proof
- the next risk is choosing the wrong first real task after setup
- you need a compact artifact that can be reused in future capability-intake answers

## Proof Pack Shape

```md
# Capability Proof Pack

## Capability
- Name:
- Source type: existing skill / local script / MCP / external tool / ACP implementation
- Real task family it should unlock:

## Best First Real Task
- The smallest high-value user task this capability should complete:
- Why this task is representative:

## Preconditions
- Required local files / accounts / login / service state:
- User approvals needed:
- Safe no-side-effect variant if available:

## Smoke Test
- Exact input:
- Exact command / tool call / flow:
- Expected artifact or observable result:
- Failure signals to watch:

## Proof Signals
- Primary proof:
- Secondary proof:
- False-ready trap:

## Reusable IO Contract
- Inputs the capability expects:
- Outputs/artifacts it should produce:
- What downstream workflow can consume those outputs:

## Next Handoff
- Preferred next playbook / workflow:
- If smoke test fails, fallback lane:

## Worth Continuing?
- Yes / No / Later
- Reason:
```

## Proof Standard

Do not treat these as sufficient proof by themselves:

- README found
- dependency installed
- config written
- process running
- endpoint reachable
- tool listed but never called

The proof pack should anchor on one **task-shaped happy path** with an expected artifact or observable state change.

## Suggested First Tasks by Capability Type

### Skill / local script
- run one real sample input through inspect / transform / extract / generate

### MCP / external tool
- list tools, then perform one read-only or low-risk call with a realistic input

### Browser-oriented capability
- open the real target site and complete one stable read action or one draft-only action

### Desktop-oriented capability
- locate the real window/control and verify one visible state change

### Document capability
- complete one inspect / extract / convert path on a real sample file and verify the artifact exists

## Rule to Keep

A capability should be considered reusable only when all four are explicit:

1. target task family
2. smallest proven task
3. proof signals
4. next handoff workflow
