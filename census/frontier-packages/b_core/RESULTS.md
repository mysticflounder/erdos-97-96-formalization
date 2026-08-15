# B-core results (refreshed 2026-08-04)

## Verdict matrix

| Run | Verdict | Variables | Clauses | Classification |
|---|---:|---:|---:|---|
| base | SAT | 162 | 57 | diagnostic baseline |
| B1-direct-shadow | SAT | 162 | 109 | proved live-normal-form named-local projection; not universal closure |
| B1-check-support-equality | UNSAT | 162 | 111 | adversarial pin; DRAT verified |
| B1-check-cross-membership | UNSAT | 162 | 110 | adversarial pin; DRAT verified |
| B1-check-physical-exclusion | UNSAT | 162 | 110 | adversarial pin; DRAT verified |
| B2 | SAT | 162 | 262 | B2 named-local package verdict |
| B2-collision-u | SAT | 162 | 263 | pinned arm |
| B2-collision-v | SAT | 162 | 263 | pinned arm |
| B2-collision-b2 | SAT | 162 | 263 | pinned arm |
| B3 | SAT | 162 | 66 | B3 named-local package verdict |
| B3-square-a2 | SAT | 162 | 67 | pinned arm |
| B3-square-bu | SAT | 162 | 67 | pinned arm |
| B3-square-bv | SAT | 162 | 67 | pinned arm |
| B3-square-b2 | SAT | 162 | 67 | pinned arm |

Exact machine-readable records and decoded atom tables are in
`out/manifest.json` and `out/*.model.json`.

The previous B1 classification
`OMITTED_PREREQUISITE_INGRESS_MISSING` is superseded.  The live theorem
`Problem97.B2Arm3.b1_live_normalForm` now proves the ingress facts used here:

- `Row(z1) = Row(z2)` on every named point;
- both cross-memberships; and
- because the common row meets the physical class in exactly `{z1,z2}`, the
  exclusions of `u` and `v` from both equal rows.

The current status is:

`LIVE_NORMAL_FORM_INGRESS_PROVED__NAMED_LOCAL_RESULT_ONLY`.

The producer boundary is now authenticated in
`producer_contract.json` and copied into `out/manifest.json`.  It records the
live ingress and consumer, the three admissible global-gap output shapes, the
exact bisector-fiber query, and the currently missing `producer_theorem` and
`lift_theorem`.  The contract is
deliberately `PARKED-SPEC` with `promotion_eligible: false`; changing a CNF
verdict or adding a named-local clause cannot promote B1 without those two
source-level fields.

The refreshed B1 projection is SAT.  Thus the old ingress omission has been
repaired, but these proved named-local consequences do **not** close the live
universal B1 leaf.  The decoded SAT assignment was independently checked
against every generated clause.  The three adversarial self-tests negate one
representative consequence from each new family; all are UNSAT and their DRAT
proofs were verified by `drat-trim`.

The SAT verdicts show only that these conservative named-local projections do
not themselves close B1, B2, or B3. They are not finite geometric models and
do not overturn the kernel-checked bank theorems. In particular, the B3 bank's
global off-named-centers quantifier was deliberately not replaced by a finite
named subset.

## Source-clean escape producer (2026-08-05)

The focused Lean build now proves
`Problem97.ATailFrontierLiveClosure.b1_live_exists_third_interior_escape`.
Under the full B1 mutual-omission and blocker-collision binders, it produces a
point `t` in the strict second-cap interior such that:

- `t` is distinct from both deleted sources;
- `t` is outside the saturated common selected row;
- deleting `t` preserves the common four-point shell; and
- the actual blocker selected at `t` differs from the common blocker.

This is a genuine source-clean producer datum and is now recorded as
`partial_producer_theorem` in `producer_contract.json`. It is deliberately not
called the missing third-bisector producer: the theorem does not assert
`dist t first.deleted.1 = dist t second.deleted.1`. A new global consumer must
turn this escape into a blocker-multiplicity, row-cap, or other terminal
contradiction before B1 can be promoted. The contract and package status
therefore remain `PARKED-SPEC` with `promotion_eligible: false`.

Build and trust check:

```text
lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure
```

completed successfully on 2026-08-05. This result is narrowing/producers
completed successfully on 2026-08-05. A targeted `#print axioms` audit reports
only `propext`, `Classical.choice`, and `Quot.sound` for the producer. This
result is narrowing/producers progress, not closure of the universal B1 leaf.

## Source-clean escape consumer packet (2026-08-05)

The escaped point now feeds a source-clean geometric consumer:
`Problem97.ATailFrontierLiveClosure.b1_live_escape_small_overlap` composes the
escape with the banked selected-shell theorem and proves that the escaped
point's selected four-shell intersects the first deleted source's selected
four-shell in at most two support points.  It also retains the escaped-point
survival and different-actual-blocker facts.

The companion theorem
`b1_live_false_of_escape_overlap_ge_three` is a conditional terminal adapter.
It closes the live B1 packet if a future source-level producer proves the
matching universal lower bound of three for every admissible escaped point.
That lower bound is not currently source-entailed: the latest audit leaves the
equal-center/same-support and distinct-center/at-most-two alternatives as the
exhaustive source dichotomy.  Therefore this is a source-clean packet plus a
conditional consumer, not B1 closure; `producer_theorem` and `lift_theorem`
remain unset and the contract remains non-promotable.

## Third-bisector smoke

| Case | Verdict | Clauses | Check |
|---|---:|---:|---|
| all third-bisector premises | UNSAT | 7 | DRAT verified by `drat-trim` |
| drop `Bis(t)` | SAT | 6 | model checked; omitted atom false |
| drop `Ne(t,b1)` | SAT | 6 | model checked; omitted atom false |
| drop `Ne(t,a2)` | SAT | 6 | model checked; omitted atom false |

Overall smoke status: `PASS`. The persisted record is
`out/smoke-manifest.json`. DRAT is an UNSAT certificate format; the three SAT
near-misses are validated by decoded CaDiCaL models, not described as
DRAT-verified.

## Reproduction

Executed successfully from the repository root:

```text
uv run python -m py_compile \
  census/frontier-packages/b_core/encoding.py \
  census/frontier-packages/b_core/smoke.py \
  census/frontier-packages/b_core/run.py
uv run python census/frontier-packages/b_core/smoke.py
uv run python census/frontier-packages/b_core/run.py
```

## Trust boundary

The DIMACS verdicts are `EMPIRICALLY VERIFIED` for the exact generated CNFs.
Every SAT assignment is replayed against the persisted clause set, every CNF
and model has a SHA-256 digest in `out/manifest.json`, and the B1 self-test plus
third-bisector UNSAT proofs were checked externally by `drat-trim`. None of the
package verdicts is a Lean theorem or a universal geometric claim. The B1
ingress theorem was replayed directly: `#print axioms b1_live_normalForm`
reported only `propext`, `Classical.choice`, and `Quot.sound`.  The SAT
named-local projection supplies no contradiction to replay and therefore no
closure of the universal leaf.

## Typed global-transport consumer contract (2026-08-05)

`B1Live.lean` now exposes the complete transport interface as
`B1GlobalTransportContext`, `B1GlobalGapOrClosedTerminal`, and
`false_of_b1_global_gap_or_closed_terminal`.  The consumer closes any of
three source-level outputs: a third carrier on the deleted-source bisector,
bisector-fiber cardinality at least three, or the universal escaped-shell
overlap lower bound of three.  A focused Lean build passes, and the targeted
axiom audit reports only `propext`, `Classical.choice`, and `Quot.sound`.

This is a **PROVEN consumer contract**, not a producer or a closure result.
The source audit found no existing theorem that supplies the disjunction:
the generic three-hit route has incompatible `oppApex1`/distinct-radius
hypotheses, while the seven-source critical-shell dichotomy has no bisector
or blocker conclusion.  `producer_contract.json` therefore records the
transport context and consumer while leaving `producer_theorem` and
`lift_theorem` null and the package non-promotable.
