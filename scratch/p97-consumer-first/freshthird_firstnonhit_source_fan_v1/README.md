# FreshThird retained robust-class FirstNonHit/source-fan v1

This scratch package audits the corrected route: one or both exact-four
retained `SelectedClass` rows centred at `S.oppApex1`, with the fan applied
only after `T.oppApex1_rich` has supplied fully-deletion-robustness. It does
not apply the fan to `Q.source₁`'s selected row and does not encode the
common-radius branch.

Run:

```text
uv run python scratch/p97-consumer-first/freshthird_firstnonhit_source_fan_v1/run_preflight.py
```

The runner emits 128 positive quotient combinations (the two live
`FreshThirdCapSourceNonHit` constructor tags × four interaction constructor
tags × sixteen retained endpoint tuples), QF_LIA artifacts, and four malformed
controls. The endpoint tuples are metadata in this quotient, not constructor
witnesses. Every positive case is independently SAT in Z3 and cvc5 and passes
model readback. Every malformed control is independently UNSAT in both.

The 128 dual-SAT outcomes are exhaustive for this explicitly weakened quotient:
all 2 × 4 × 16 selected tags/metadata tuples satisfy the emitted incidence
constraints. They are not evidence that the live Lean constructor product is
insufficient (or sufficient). The quotient does not encode the constructor
equality, deletion, cap, or support-overlap fields, nor a bridge from those
fields to the retained robust rows.

The exact finite fan enumeration finds `625/625` allowed four-vertex shell
graphs with a mutual omitted pair. The finite blocker/cap assignment census
also leaves blocker-equality, same-cap distinct-blocker, and distinct-blocker
families nonempty. Thus the retained robust fan is source-entitled and
produces a mutual cross-deletion pair in the quotient. This does not close any
FirstNonHit family, and the SAT results do not diagnose insufficiency of the
live Lean constructor product; they only certify consistency of the weakened
quotient.

See [INGRESS-CONTRACT.md](INGRESS-CONTRACT.md) for declaration-level
provenance, relaxations, and exclusions. `results.json` records statuses and
source hashes; `artifacts/` contains the independently replayable SMT-LIB
queries.
