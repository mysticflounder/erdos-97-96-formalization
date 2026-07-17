# Paired exact-five common-deletion nonreturn audit

Date: 2026-07-17

Status: **THE CURRENT PAIRED PACKET DOES NOT SUPPORT A WELL-FOUNDED
NONRETURN THEOREM.  THE SOURCE-FAITHFUL LOCAL GEOMETRY PRODUCES AN OMISSION
SUCCESSOR AT EVERY PHYSICAL STRICT-CAP SOURCE, AND AN EXACT RATIONAL FINITE
METRIC MODEL REALIZES A TWO-CYCLE WHILE RETAINING THE FULL EXACT-FIVE,
TOTAL-CRITICAL-SHELL, AND PAIRED-COMMON-DELETION SEMANTICS.**

This is a negative interface audit, not a counterexample to Problem 97.  A
positive terminal theorem can still use joint Euclidean embedding, convexity,
MEC/cap separation, or a genuinely global critical-row coupling absent from
the finite metric model.

## Verdict

The tempting theorem shape

```text
LargeCapUniqueFiveTwoCommonDeletionSources
  -> paired successor recursion has a strict rank / cannot return
```

is not justified by the current packet.  The two origin-tagged deletions share
the unused source's actual blocker and the physical apex, but the actual
critical blockers of the two deleted physical sources remain independent.
Neither source must lie in the other's actual critical shell.

The checked positive normal form goes in the opposite direction.  Put

```text
P = physical exact-five class ∩ strict physical cap.
```

Then `|P| >= 3`, and for every `q in P`:

```text
|P ∩ actualCriticalSupport(q)| <= 2,
```

so there is a distinct `w in P` omitted by `actualCriticalSupport(q)`.  By the
source-exact cross-deletion equivalence, deleting `w` preserves K4 at the
actual blocker of `q`.

Thus the current exact-five geometry supplies a total fixed-point-free
omission-successor relation on a finite set.  Finiteness produces recurrence,
not descent.  A terminal proof must rule out the resulting source-exact cycle
using information not present in the current paired packet.

## Kernel-checked source theorem

`ExactFivePhysicalOmissionSuccessor.lean` proves:

```lean
actualCriticalSupport_physicalInterior_inter_card_le_two

exists_distinct_physicalInterior_not_mem_actualCriticalSupport

exists_distinct_physicalInterior_survives_actualBlocker
```

The first theorem is genuinely geometric.  If an actual critical row at a
physical strict-cap source contained three physical strict-cap members, two
of them would localize its blocker into the same cap.  The ordered-cap
two-point bound would then contradict those three support hits.

The second theorem subtracts the at-most-two row intersection from the
at-least-three physical strict-cap class.  The third transports the omission
through
`cross_deletion_survives_iff_not_mem_selected_support`.

All three declarations elaborate with exactly:

```text
propext, Classical.choice, Quot.sound
```

and no `sorryAx`.

This theorem does not itself close a branch.  Its value is to identify the
honest recurrent normal form and to prevent another false rank target.

## Exact finite-metric regression

`exact_five_paired_cycle_model.py` constructs an exact rational metric on 24
vertices.  All nonzero distances lie in `[1, 3/2)`, so the triangle inequality
is automatic; the script checks every ordered triple.

The model simultaneously verifies:

- global K4 at every center;
- one total deletion-critical blocker and exact four-shell at every source;
- distinct-center large-class intersection at most two;
- a physical center whose unique K4 radius class has cardinality exactly five;
- a labelled six-point cap and three physical-class strict-cap hits;
- an unused cap source outside the physical class;
- an unused-source actual critical shell omitting both chosen physical
  sources;
- the canonical common-deletion rows for both sources at the same unused
  blocker/physical-center pair;
- distinct actual blockers for the two physical sources; and
- the genuine paired successor cycle `1 -> 2 -> 1`.

The pinned model digest is:

```text
db4d45278e5f412212fbef2f5903959a831ef952434ee892642d7f5f779242aa
```

The two packets use the exact rows

```text
source 1: unused row {13,14,15,17}, physical row {2,3,5,8}
source 2: unused row {13,14,15,17}, physical row {1,3,5,8}.
```

The actual critical shells of sources `1` and `2` omit the other source, and
their blockers are respectively `20` and `21`.  Hence each other source is a
legal fresh successor and the blocker changes on both cycle edges.

The model is **EXACT WITHIN ITS STATED FINITE-METRIC ABSTRACTION**.  It is not
claimed to embed in `R^2`; it does not instantiate `CounterexampleData`,
`ConvexIndep`, the MEC witnesses, or the geometric half-plane content of
`SurplusCapPacket`.  It therefore refutes geometry-free paired termination,
not a theorem which visibly consumes those omitted fields.

## Cap-order regression

Adding only a local cap rank does not repair the route.  In this model the two
sources occupy different positions in the displayed cap order, but the two
cycle edges traverse that order in opposite directions.

Independently,
`strict-oppcap-cross-classifier/directed-cycle-geometry/DirectedCycleCountermodel.lean`
already supplies an exact Euclidean, strict-convex, non-obtuse MEC cap with an
exact five-point physical-apex circle and a directed three-cycle of local pair
bisectors.  That model does not carry the global critical system, but it shows
that local between-ness or a separately chosen boundary rank cannot forbid the
wrap edge.

The two regressions delimit the missing ingredient:

```text
finite exact-five + total criticality + paired provenance   permits return;
Euclidean convex/MEC cap order + local bisectors            permits wrap.
```

A positive theorem must couple these two layers on the same source-exact
cycle.  Merely adjoining their marginal conclusions is not enough.

## The honest next theorem surface

Do not target an anonymous `Nat` rank on common-deletion packets.  The next
source-faithful normal form should retain a finite cycle whose vertices are
physical strict-cap members and whose edges satisfy

```text
q_(i+1) notin H.selectedAt(q_i).support
deleting q_(i+1) preserves K4 at H.centerAt(q_i)
all q_i lie in the same exact-five physical radius class and fixed cap.
```

Call this, descriptively, a **physical-class actual-critical omission cycle**.
It follows from the checked per-source successor theorem plus finite function
iteration.  The terminal consumer must then prove that some edge has one
additional source-derived property, for example:

- a named third common physical-shell incidence feeding the existing
  same-cap row contradiction;
- a fixed, globally anchored cap interval which strictly shrinks and whose
  return edge is forbidden by a proved no-wrap invariant; or
- a cumulative-deletion carrier on which global K4 is actually preserved.

None of those properties is a field or consequence of the current paired
packet.  The first is the smallest existing-consumer-facing extension.  The
second must use one common cut/history object across the whole cycle; local
between statements are already regression-blocked.  The third requires new
cumulative survival, not the ambient one-deletion survivals currently stored.

## Theorem-bank preflight

Before deriving the normal form, the audit checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- indexed Lean searches for paired common deletion, exact-five critical
  blockers, source transitions, cycles, and nonreturn.

The closest current declarations are
`cross_deletion_survives_iff_not_mem_selected_support`, the blocker-center
cross-membership equivalences, and the generic common-deletion expansion/cycle
normal forms.  No bank theorem consumes two different deleted sources at the
same center pair, and no bank theorem produces the missing source-exact
no-wrap or terminal cross-incidence.

## Validation

The exact model was replayed with:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/paired-common-deletion-nonreturn-audit/\
exact_five_paired_cycle_model.py
```

and returned `status: PASS` with the pinned digest above.

The scratch Lean file was checked directly against current production imports:

```bash
cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/paired-common-deletion-nonreturn-audit/\
ExactFivePhysicalOmissionSuccessor.lean
```

It exited successfully and printed only the three approved core axioms for
all new declarations.
