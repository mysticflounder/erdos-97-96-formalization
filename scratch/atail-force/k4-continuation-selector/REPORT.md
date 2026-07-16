# All-center K4 continuation selector audit

Date: 2026-07-14

Status: **EXACT 24-CENTER DEFICIT TABLE; TWO-CENTER FRONTIER
CONTINUATION ISOLATED; ONE-ROW OUTSIDE-PAIR CONSUMER KERNEL-CHECKED;
DETERMINISTIC MEMBERSHIP SELECTOR OPEN.**

## Verdict

The exact 35-point total-`CriticalShellSystem` regression has 24 centers at
which every positive-radius class is a singleton.  Hence these centers do not
merely miss a preferred K4 row: they have no two-point distance coincidence at
all.  None can be the blocker center of any source in any exact critical-map
assignment on this model.

The two deficits reached specifically from the retained second-apex frontier
are `G` and `K`.  They are the two strict-`oppCap2` points in the exact
second-apex row

```text
{C,G,K,O}.
```

This is the concrete instance of the kernel-checked scratch theorem
`secondApex_two_globalK4_continuations`: an arbitrary live second-apex selected
four-class has at least two support points in

```text
oppCap2 \ (surplusCap ∪ oppCap1),
```

and global K4 supplies a selected four-class centered at each one.  Thus the
smallest genuinely new continuation is a **two-center packet**, although one
of its rows would be enough if a useful pair membership were forced.

The smallest direct existing-consumer target is:

```text
choose z in the strict-oppCap2 continuation set and a K4 row Kz at z;
force two already co-radial points a,b outside oppCap2 into Kz.support.
```

The first opposite apex is another center in `oppCap2`.  If its selected row
already contains `a,b`, then
`CapSelectedRowCounting.outsidePair_unique_capCenter` gives `False`
immediately.  `SelectorConsumer.lean` kernel-checks exactly this last step for
two arbitrary ordered-cap centers and two selected four-classes.  Its printed
axiom closure is

```text
propext, Classical.choice, Quot.sound.
```

What remains open is the membership selector.  Global K4 chooses an anonymous
four-point radius class at `z`; no current theorem forces that class to repeat
the first-apex outside pair, hit a cap endpoint, or realize one of the current
production cores.

## Exact enumeration of the 24 deficient centers

Notation:

- `S`, `O1`, and `O2` denote the surplus, first-opposite, and
  second-opposite caps;
- `f(x)=c : R` records the unique exact deletion-critical blocker candidate
  for source `x`, with blocker `c` and support `R`;
- hull indices are zero-based indices in the pinned 35-point strict hull.

Every row in the table has all of these exact properties:

1. maximum positive-radius class cardinality `1` (34 singleton classes);
2. exactly one critical blocker candidate as displayed;
3. no source can use the deficient point as a blocker center, even under a
   different critical-map choice; and
4. the point is not equidistant from the retained pair `q=E`, `w=D`.

| hull | deficient center | cap | retained/model role | unique outward critical row |
|---:|---|---|---|---|
| 0 | `K` | O2 | second-apex support; forced continuation | `f(K)=A : {C,G,K,O}` |
| 1 | `X_k4_3` | O2 | strict O2 interior | `f(X_k4_3)=X : {O,X_k4_1,X_k4_2,X_k4_3}` |
| 2 | `X_k4_2` | O2 | strict O2 interior | `f(X_k4_2)=X : {O,X_k4_1,X_k4_2,X_k4_3}` |
| 3 | `X_k4_1` | O2 | strict O2 interior | `f(X_k4_1)=X : {O,X_k4_1,X_k4_2,X_k4_3}` |
| 4 | `I_k4_3` | O2 | strict O2 interior | `f(I_k4_3)=I : {O,I_k4_1,I_k4_2,I_k4_3}` |
| 5 | `I_k4_2` | O2 | strict O2 interior | `f(I_k4_2)=I : {O,I_k4_1,I_k4_2,I_k4_3}` |
| 6 | `I_k4_1` | O2 | strict O2 interior | `f(I_k4_1)=I : {O,I_k4_1,I_k4_2,I_k4_3}` |
| 7 | `F_k4_3` | O2 | strict O2 interior | `f(F_k4_3)=F : {O,F_k4_1,F_k4_2,F_k4_3}` |
| 8 | `F_k4_2` | O2 | strict O2 interior | `f(F_k4_2)=F : {O,F_k4_1,F_k4_2,F_k4_3}` |
| 12 | `t1_css_1` | S | total-CSS extension | `f(t1_css_1)=C : {t1,t1_css_1,t1_css_2,t1_css_3}` |
| 13 | `t1_css_2` | S | total-CSS extension | `f(t1_css_2)=C : {t1,t1_css_1,t1_css_2,t1_css_3}` |
| 14 | `t1_css_3` | S | total-CSS extension | `f(t1_css_3)=C : {t1,t1_css_1,t1_css_2,t1_css_3}` |
| 22 | `J` | O1 | first-apex marginal | `f(J)=F_k4_1 : {J,J_css_1,J_css_2,J_css_3}` |
| 23 | `J_css_1` | O1 | total-CSS extension | `f(J_css_1)=F_k4_1 : {J,J_css_1,J_css_2,J_css_3}` |
| 24 | `J_css_2` | O1 | total-CSS extension | `f(J_css_2)=F_k4_1 : {J,J_css_1,J_css_2,J_css_3}` |
| 25 | `J_css_3` | O1 | total-CSS extension | `f(J_css_3)=F_k4_1 : {J,J_css_1,J_css_2,J_css_3}` |
| 26 | `E` | O1 | retained `q`; first marginal; q-shell source | `f(E)=D : {A,E,F,I}` |
| 28 | `Y_k4_1` | O2 | strict O2 interior | `f(Y_k4_1)=Y : {C,Y_k4_1,Y_k4_2,Y_k4_3}` |
| 29 | `Y_k4_2` | O2 | strict O2 interior | `f(Y_k4_2)=Y : {C,Y_k4_1,Y_k4_2,Y_k4_3}` |
| 30 | `Y_k4_3` | O2 | strict O2 interior | `f(Y_k4_3)=Y : {C,Y_k4_1,Y_k4_2,Y_k4_3}` |
| 31 | `Z_k4_1` | O2 | strict O2 interior | `f(Z_k4_1)=Z : {C,Z_k4_1,Z_k4_2,Z_k4_3}` |
| 32 | `Z_k4_2` | O2 | strict O2 interior | `f(Z_k4_2)=Z : {C,Z_k4_1,Z_k4_2,Z_k4_3}` |
| 33 | `Z_k4_3` | O2 | strict O2 interior | `f(Z_k4_3)=Z : {C,Z_k4_1,Z_k4_2,Z_k4_3}` |
| 34 | `G` | O2 | second-apex support; forced continuation | `f(G)=A : {C,G,K,O}` |

The cap split is therefore `16` deficient O2 centers, `5` deficient O1
centers, and `3` deficient surplus-cap centers.

The `G,K -> A` arrows must not be read backwards.  They say that the
second-apex row centered at `A` is deletion-critical for sources `G` and `K`.
They do **not** produce any row centered at `G` or `K`.  In fact `A` is the
apex opposite O2, not a point of O2, so this critical row is not a legacy
same-cap blocker edge either.  The missing rows at `G,K` come only from global
K4.

`E` is also a named deficient frontier source, so global K4 at `E` is
available directly.  It is not the new continuation forced by the retained
second-apex row, and no current support theorem makes its anonymous K4 row
more useful than the rows at `G,K`.

## Exact consumer boundary

Let `K1` be a selected row centered at the first opposite apex and let `K2` be
the retained second-apex row.  Write

```text
I2 = oppCap2 \ (surplusCap ∪ oppCap1).
```

The checked continuation theorem gives

```text
2 ≤ (K2.support ∩ I2).card
∀ z ∈ K2.support ∩ I2, Nonempty (SelectedFourClass A z).
```

For a pair `a != b` in `K1.support` and outside `oppCap2`, the smallest
selector which reaches an existing terminal is

```text
∃ z ∈ K2.support ∩ I2,
  ∃ Kz : SelectedFourClass A z,
    a ∈ Kz.support ∧ b ∈ Kz.support.
```

Only one of the two forced continuation rows is needed after this selector.
The generic scratch theorem

```text
false_of_two_capCenter_rows_share_outsidePair
```

converts the two support memberships in `K1` and `Kz` directly to the two
equal-radius hypotheses of `outsidePair_unique_capCenter`.

In the exact regression, `a=q=E` and `b=w=D` both lie in O1, so they are
outside O2.  The abstract `CriticalPairFrontier`, however, retains only that
its chosen sources are off the surplus cap.  It does not retain that both lie
in O1.  A live producer using the exact `q,w` pair must therefore either:

1. refine the pair selection so both sources lie in O1; or
2. select a different two-point subset of the first-apex O1 hits and couple
   that pair to one continuation row.

This cap-placement prerequisite is separate from the continuation K4 row and
must not be silently inferred from the exact model.

## Why the existing counting theorem does not choose the pair

`orderedCap_card_add_four_le_choose_outside` already runs global K4 at every
ordered-cap center, chooses at least one outside pair per interior center and
three outside pairs per endpoint center, and uses
`outsidePair_unique_capCenter` to prove all those pairs are distinct.  Its
conclusion is

```text
m + 4 ≤ choose((A \ cap).card, 2).
```

The relevant cardinalities leave substantial slack:

| carrier `n` | cap `m` | lower `m+4` | outside-pair capacity |
|---:|---:|---:|---:|
| 11 | 4 | 8 | 21 |
| 11 | 5 | 9 | 15 |
| 12 | 4 | 8 | 28 |
| 12 | 5 | 9 | 21 |
| 12 | 6 | 10 | 15 |
| 35 | 19 | 23 | 120 |

Thus the two new interior centers contribute two more **distinct** outside
pairs; basic pigeonhole counting does not force either pair to equal the
first-apex pair.  A stronger geometric selector or a different terminal is
required.

## Deterministic-selector and strict-rank bank audit

The required theorem-bank registries and indexed Lean corpora were searched
before this audit.  The closest current declarations are:

- `selectedFourClass_inter_capByIndex_card_le_two`;
- `outsidePair_unique_capCenter`;
- `orderedCap_outsidePairCount_sum_le`; and
- `orderedCap_card_add_four_le_choose_outside`.

They are upper bounds, collision consumers, and aggregate counting results.
None selects a prescribed pair in the row at a prescribed continuation
center.

The sibling rank machinery also starts strictly after the missing selector:

- `SameCapIncompatibleEdge` already contains a same-cap source, a same-cap
  blocker center, a chosen cap endpoint, and the equality between the source
  and that endpoint about the blocker;
- `source_pushout_left/right` consume that edge and endpoint exclusions;
- `rank_drop` consumes an already-proved strict rank-interval inclusion;
- `StrictLapPacket` already contains three strict pushes, while
  `strictLapPacket_nonreturn` only refutes the packet; and
- current `ArcBlockContiguity` transports already-supplied cap membership to a
  global boundary interval but does not produce a radius equality or endpoint
  hit.

A K4 row at `G` or `K` has four anonymous support points.  The same-cap theorem
gives at most two O2 hits, not at least one endpoint hit.  Therefore there is
no deterministic construction of a `SameCapIncompatibleEdge`, no first strict
rank inclusion, and no strict lap from the retained frontier plus the new row.

The production two-hit and confinement consumers do not consume this row
either.  They concern the support of the second-apex row `K2` itself (its
intersection with the first marginal, or its containment in a critical shell
union that marginal).  Adding a selected row centered at `z` does not change
either predicate.  The compact four-point production core would accept a
second center on the first-apex pair with the required boundary order, but in
the same-cap/outside-pair placement the direct `outsidePair` contradiction is
already stronger.

## Exact epistemic split

- **EXACT SYMBOLIC, NOT LEAN KERNEL:** the 24-center table, singleton distance
  profiles, unique outward critical candidates, lack of any incoming critical
  role, cap memberships, and `G,K` identification in the pinned 35-point
  model.
- **PROVEN IN LEAN:** the abstract two-center global-K4 continuation theorem
  in the sibling scratch lane and the conditional outside-pair consumer in
  this directory.  The latter has only the three standard axioms listed
  above.
- **SOURCE-AUDITED:** the current and legacy banks do not provide the required
  pair-membership selector or endpoint-spending alternative.
- **OPEN:** refine the frontier pair into O1 and force one continuation row to
  repeat it, or prove a disjunction sending every non-repetition branch into
  another current production core.

No K-A-PAIR closure is claimed.

## Reproduction

Pinned identities:

```text
35-point verifier source:
adbc3583b5bfefc0d2cf80af45b3a09a2a0d47ede836168d9bb61683083e1ff7

35-point coordinate payload:
c5289a5ded63bca9c2c56b40211c2ec53009a83df66f9594815b9c5681db7dce

deficient-center analyzer:
327377c97551a133b4373bda7858018daa075ab89acadc87ce9461a101b4409b

selector consumer:
9f5b43520de02424042c12e1d3b63f5e9b2069eb9ebcd71dd2bc9cf9b9d67ec2
```

From the repository root:

```bash
.venv/bin/python \
  scratch/atail-force/k4-continuation-selector/analyze_deficient_centers.py

cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/k4-continuation-selector/SelectorConsumer.lean
```

Only files under `scratch/atail-force/k4-continuation-selector/` were created
or changed by this lane.
