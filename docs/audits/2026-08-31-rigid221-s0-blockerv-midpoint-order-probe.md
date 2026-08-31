# Rigid221 S0 literal-blocker-`v` midpoint-order probe

## Status

**EMPIRICAL, FORMULA-SCOPED.** Both source-consistent fixed-order cells
returned fail-closed `UNKNOWN` from fresh PiQD/Z3 sessions. This lane repairs
a rejected fixed-order control. It does not alter a Lean theorem or reduce the
proof frontier.

## Structural preflight

The live literal-blocker source-row-heavy packet has a proved cap-order fact:

```text
source < v < partner  or  partner < v < source.
```

It is supplied by
`exists_sourceRow_partner_with_blocker_index_strictly_between` in
`Rigid221SourceRowCapBetweenness.lean`. The historical exact-five formula
named the source and partner `u` and `xu`, but fixed their strict-cap segment
as `v, u, xu`. Neither order direction satisfies the proved relation.

The historical formula remains retained as a bounded rejected control. This
lane does not rewrite its script, formula bytes, receipt, or audit.

## Repaired controls

The new emitter makes only two order substitutions, preserving the historical
constraints otherwise:

- `forward`: `u, v, xu`;
- `reverse`: `xu, v, u`.

Both pass a static midpoint preflight. Focused Python tests pass (five tests),
and Ruff reports no issue. The smoke output records 1,020 assertions for each
cell and the deterministic hashes recorded in the companion specification.

## PiQD results

An isolated PiQD daemon used a 20-worker ceiling and the `z3-4.17.0` SMT
worker. Each cell was asserted once in its own fresh session, solved once with
no model request, receipt-captured, and closed. The driver normalized the
query-free source by adding its fixed Z3 options.

| Cell | Source session SHA-256 | Normalized candidate SHA-256 | Session | Result |
|---|---|---|---|---|
| `forward` | `6d234bc8355e873cc60f14c1f0ddcb11b3e4c0aefa02a3db3beeb146fba23642` | `51e9817bf64beaaf8daba0567e4e22c5c66ed78c22dd5ffc1a81bea7dcbdfe4a` | `607016a5-9589-4d64-ba29-6d63f51093d4` | `UNKNOWN`, 120,045 ms |
| `reverse` | `0be584d1fb826530fb8ba35415e9a6b30f3b22f38f94c2047b4fa3578b5e3909` | `60c5510ba73a3977f697d089079f358c2d78cede8b3b0d0b7693bdbefa065f61` | `440737af-705b-4ed5-adec-5dfeeed81408` | `UNKNOWN`, 120,018 ms |

Each receipt has result digest
`a3bfe134a25a1170ba0ad0ff4529cbc84061e3456e3384cc0272c2eea6f48ddf`.
Both drivers report `INITIAL_UNKNOWN_FAIL_CLOSED`; neither result supplies a
model, an UNSAT certificate, or a clause deletion. The isolated daemon was
stopped after the two closed-session receipts were captured.

## Source boundary

This repair adds the first source-entitled edge to the computational cell. It
does not manufacture a second equal-distance relation from the opposite row
or next blocker. The nearest existing ordered-cap cycle terminal requires
three such links, so any PiQD outcome remains discovery evidence for the
named B3 consumer rather than a proof of it.

## Next boundary

The two source-consistent full cells have the same broad nonlinear bottleneck
as the historical cell. Increasing their whole-formula timeout is not justified
by these two `UNKNOWN` outcomes. The next computation should instead retain a
smaller source-faithful contract with an identified consumer: the midpoint
edge already has one, while a second opposite-row or next-blocker edge is the
first missing source producer.
