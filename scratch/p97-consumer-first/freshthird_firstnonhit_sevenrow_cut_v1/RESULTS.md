# Seven-row-cut quotient result

Final status: **SAT motif-free survivor**.  The seven-row cut does not close
the abstraction.

The source gate passed and all three ingress cases produced a motif-free model
on their first Z3 readback.  Consequently the bounded CEGAR loop authenticated
and admitted zero no-goods (cap: 12).  This is not a vacuous source failure:
the explicit row predicate is tied to actual `selectedAt` critical-shell
membership at an actual blocker center, and only theorem-emitted carrier
sources/blocker vertices are used as named points.

## Terminal matrix

| Case | Z3 discovery | Motif embedding | No-goods | Terminal replay |
|---|---:|---:|---:|---:|
| `retained` | SAT | none | 0 | Z3 SAT, cvc5 SAT, validator PASS |
| `common` | SAT | none | 0 | Z3 SAT, cvc5 SAT, validator PASS |
| `common_sameblocker` | SAT | none | 0 | Z3 SAT, cvc5 SAT, validator PASS |

The exact discovery readbacks are `iterations/retained-00.json`,
`iterations/common-00.json`, and
`iterations/common_sameblocker-00.json`.  The terminal SMT files pin every
named scalar, vertex equality-class value, and queried membership to that exact
motif-free readback.  Z3 4.17.0 and cvc5 1.3.3 independently accept all three
pinned witnesses.  `validate.py` independently rechecks all inherited clauses,
every source bridge, and absence of an injective nine-point motif in all six
terminal solver readbacks.  Both engines return UNSAT on the contradiction
control and reject the malformed control.  The independent detector also
passes a hand-built positive nine-point motif and an empty-graph negative
smoke test.

## Four-valued verdict and scope

Verdict: **`SAT-abstraction`**.  The lazy universal cut needs no instantiated
no-good because the first model in every case already satisfies it.  This is a
cardinality-independent named-role witness only: there is no `MAXN`, finite
carrier enumeration, exact support exhaustion, metric matrix, cyclic order,
coverage theorem, or source-to-normalized Lean adapter.  It is not a Euclidean
counterexample, a universal theorem, or a Lean promotion result.

The cut admission remains a discovery **relaxation** under the mandatory
taxonomy: its geometry was supplied as independently audited and its normalized
algebraic core is kernel-checked, but its complete source-level adapter is
pending.  Had the augmented map become UNSAT, the strongest available verdict
would therefore have been `relaxation-UNSAT`.

## What survives

The retained/common models can keep the named row-membership graph sparse.
The inherited FirstNonHit packets constrain Q overlaps, blocker equalities,
mutual omissions, and the common off-Q sources, but they do not force the 22
memberships at nine distinct points required by the seven-row obstruction.
The exact missing bridge is thus still a source producer of the injective
seven-row incidence packet (or a smaller source consequence forcing it), not a
stronger finite carrier bound.

## Reproduction

From the repository root:

```bash
uv run python scratch/p97-consumer-first/freshthird_firstnonhit_sevenrow_cut_v1/wave.py --prepare
uv run python scratch/p97-consumer-first/freshthird_firstnonhit_sevenrow_cut_v1/wave.py --run
bash scratch/p97-consumer-first/freshthird_firstnonhit_sevenrow_cut_v1/run.sh
```

`SOURCE-GATE.json`, `LAUNCH-MANIFEST.json`, `TERMINAL.json`,
`VALIDATION.json`, `SOURCE-HASHES.txt`, and `SHA256SUMS` record the ingress,
commands, lifecycle, validation, and artifact hashes.
