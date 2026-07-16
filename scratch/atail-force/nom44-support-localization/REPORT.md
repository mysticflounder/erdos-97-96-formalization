# No-M44 support-localization audit

Date: 2026-07-14

Status: **KERNEL-CHECKED TERMINAL NORMAL FORM; EXACT STRICT-CONVEX NEGATIVE
BOUNDARY; UNIFORM PRODUCER OPEN.**

This lane is scratch-only.  It does not edit production Lean, closure docs,
`SurplusM44`, the unique-row lane, the `(6,5,4)` lane, or either census.

## Verdict

The proposed one-row confinement

```text
K2.support subset Kq.support union T_r
```

is not a modest intermediate consequence of no-`M44`.  It is stronger than
the already-terminal direct output

```text
2 <= |K2.support intersect T_r|,
```

and that direct output is itself impossible by the existing double-apex
injectivity theorem.  The scratch Lean file proves, for every selected
four-class `K2` at `S.oppApex2`,

```text
|K2.support intersect T_r| <= 1,
T_r := first-apex radius-r class minus S.surplusCap.
```

Thus proving either the two-hit or the confinement from the full live binders
would close K-A immediately; neither should be described as a separately
available incidence producer.

The exact strict-convex regression now makes the missing input sharper.  Full
MEC/cap/no-`IsM44` geometry, the robust pair and two actual blockers, robust
second-apex double-deletion survival, and global K4 at every off-source point
of both blocker shells still allow both proposed targets to fail.  The only
live layers omitted by that exact model are:

1. all-center global K4 on the entire extended carrier; and
2. a total `CriticalShellSystem` on the entire extended carrier.

Consequently any positive localization theorem must visibly use the
continuation forced by those two global layers.  No current theorem bounds
that continuation inside a fixed local support packet, so no honest finite
producer has yet emerged.

## Required theorem-bank and indexed-corpus preflight

Before deriving the scratch lemmas, this lane inspected the registries
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Targeted `nthdegree docs search --lean` queries covered selected-class support
confinement, no-`M44` critical shells, opposite-apex escape, and ordered-cap
outside-pair uniqueness.  The closest sibling result is

```text
Problem97.C5D3B
  .two_le_qAllowedSelected_inter_rowOffAnchors_card_of_sameSideTerminal.
```

Its two-hit conclusion uses an explicit bounded-support field already stored
inside `U5QAllowedAuditSupport`.  It does not derive that field from global
K4, cap geometry, a `CriticalShellSystem`, or no-`M44`.  Most adjacent U5
bounded-support declarations also assume positive `D.IsM44`, which has the
wrong polarity for the live branch.  The legacy inventories contain no
replacement producer.

## What no-`M44` currently contributes

`SurplusCapPacket.IsM44` is definitionally only

```text
S.oppCap1.card = 4 and S.oppCap2.card = 4.
```

A source audit found that the only direct eliminations of the live
`hNoM44` hypothesis occur in the three finite-index branches of
`exists_secondLargeCap_of_noM44`.  That theorem turns the opposite-cap lower
bounds into one `j != i` with cap cardinality at least five.  Every later
occurrence passes the hypothesis through the wrapper tree.

K-A already receives that `j` and its `hj5` field.  The kernel-checked scratch
theorem

```text
not_isM44_of_nonSurplus_cap_card_ge_five
```

proves that `hjne` and `hj5` alone refute `IsM44` for the fixed packet.  It
does not use a no-`M44` hypothesis.  Hence the local packet consequence of
no-`M44` has already been spent before the critical-pair frontier is entered.

This is an audit of the current interfaces, not a logical independence claim
for the universally quantified no-`M44` predicate.  A new theorem could use
that global predicate through other Moser packets, but no such theorem was
found, and cardinality alone contains no selected-support membership.

## Direct target versus confinement

`NoM44SupportLocalization.lean` proves:

```text
secondApexFourClass_inter_firstApexMarginal_card_le_one

false_of_secondApexFourClass_two_hits_firstApexMarginal

not_isM44_of_nonSurplus_cap_card_ge_five
```

The first theorem maps every member of `K2.support intersect T_r` into the
full second-apex selected class at radius `K2.radius`, then applies production
`firstApex_marginal_inter_secondClass_card_le_one`.  The second theorem is
immediate cardinal arithmetic.

The existing kernel-checked
`u5-bounded-support-bridge/OneRowConfinementAdapter.lean` shows how the strong
confinement implies the direct two-hit: distinct centers bound
`|K2.support intersect Kq.support|` by two, so a four-point `K2` confined to
`Kq.support union T_r` has at least two points in `T_r`.  Therefore the exact
strength order is

```text
one-row confinement -> direct two-hit -> False.
```

The direct target is the smaller closing statement.  Neither target is an
additional neutral structure field.

## Exact strict-convex regression

`check.py` pins and invokes

```text
scratch/atail-force/robust-four-center/
  verify_strict_convex_local_gap.py
```

at source SHA-256

```text
98a069a5d763436c11f93dafb51bf7173a1909873abaeef7b74a96a451389698
```

and coordinate SHA-256

```text
b07182bc396ee9b6131961e2a80f5ce420706bf9bb6f292d90471d80300c83c4
```

The exact symbolic construction has 29 distinct vertices in a certified
strict convex order, unique equilateral/non-obtuse MEC boundary `{A,C,O}`,
cap cards `(5,8,19)`, and no `IsM44` orientation among all permutations of
that unique MEC triangle.  Its relevant rows are

```text
T_r = {C,D,E,J}
K2  = {C,G,K,O}
Kq  = {A,E,F,I}.
```

The pair is `q=E`, `w=D`.  Both lie in `T_r`; deleting both preserves the
second-apex K4 witnessed by `K2`.  The chosen `q`-blocker row is exact and
deletion-critical.  Nevertheless

```text
|K2 intersect T_r| = 1,
K2 is not a subset of Kq union T_r.
```

The model also supplies selected K4 rows at every off-source support center
of the two actual blocker shells and verifies that none of those centers is
equidistant from `q,w`.  Thus the robust support-center pair-hit route also
fails on this exact local surface.

This is **EXACT SYMBOLIC SYMPY EVIDENCE WITHIN THE ENCODED MODEL**, not Lean
kernel evidence and not a K-A counterexample.  The verifier explicitly lists
the carrier points lacking K4; consequently it does not instantiate
`CounterexampleData.K4` or a total `CriticalShellSystem`.

## All-center continuation and the first missing theorem

The global layers do have a precise existing interface:

- `exists_faithfulCarrierPattern_with_two_classes` extends any two prescribed
  selected rows to one selected row at every carrier center using global K4;
  and
- `Census554.GeneralCarrierBridge.blocker_row_support_eq_shell` identifies
  the globally selected row at every actual blocker center with the exact
  row chosen by the total critical system.

So all-center continuation can already be represented as a finite row pattern
on the full carrier.  What is absent is a **uniform bounded-closure theorem**:
no result says that starting from `K2`, the two blocker shells, and `T_r`, a
bounded number of global-row/critical-row expansions either stays inside a
fixed bounded support or reaches one of the existing terminals.  Since K-A is
unbounded in ambient cardinality, merely observing that the whole carrier is
finite does not create a fixed certificate packet.

The first honest new theorem must therefore consume the all-center pattern
and total critical map and produce one of:

1. a direct two-hit in `T_r` (immediate contradiction);
2. two distinct support-point rows containing the frontier pair (the checked
   perpendicular-bisector sink);
3. a cross-deletion failure / mutual critical incidence / usable cap-local
   blocker packet already consumed by the current terminals; or
4. a support-escape continuation with a strictly monotone cap-order measure,
   so iteration terminates uniformly without assuming an ambient card bound.

Item 4 is the smallest plausible route to a finite general-`n` producer, but
the required strict-progress theorem is **CONJECTURED / OPEN**.  No banked
cap-order theorem currently relates an arbitrary selected-row escape to a
later escape in this way.

## Validation

Direct scratch Lean validation succeeded:

```text
cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/nom44-support-localization/NoM44SupportLocalization.lean
```

All three printed declarations depend exactly on:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, custom axiom, or native-decision boundary.

The exact regression passed:

```text
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/nom44-support-localization/check.py
```

Expected terminal line:

```text
PASS: exact strict-convex/no-M44 local model refutes both the two-hit and one-row-confinement targets; only all-center K4 and total criticality remain omitted
```

## Epistemic ledger

- **PROVEN IN LEAN:** every second-apex selected four-class meets `T_r` in at
  most one point; a two-hit gives `False`; `hjne + hj5` refute `IsM44` for the
  fixed packet.
- **PROVEN INTERFACE BOUNDARY:** current no-`M44` elimination produces only the
  second-large-cap cardinality witness, already present at K-A.
- **EXACTLY VERIFIED WITHIN THE ENCODED STRICT-CONVEX MODEL:** MEC/cap/no-M44
  plus the robust local rows and K4 at every relevant blocker-support center
  do not force either two-hit or confinement.
- **NOT PROVEN:** that the full live K-A hypotheses are satisfiable, that
  no-`M44` is logically redundant globally, or that all-center continuation
  can avoid every current terminal.
- **OPEN-PROOF:** a theorem using all-center K4 and total criticality to force
  a terminal or a uniformly terminating cap-order continuation.
