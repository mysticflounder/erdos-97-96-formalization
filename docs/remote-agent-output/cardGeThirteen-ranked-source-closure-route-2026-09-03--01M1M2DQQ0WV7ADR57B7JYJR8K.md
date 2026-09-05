# Ranked source-level route for `false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`

Consult: `01M1KY4R7PK40KP3M985QX808W`

## Executive verdict

The best current route is a **cap-excess decomposition followed by a source-open local Kalmanson occurrence theorem for the genuinely unbounded MultiGrowth arm**.

This is preferable to:

- restricting the carrier;
- replaying an exact-card CNF through a partial label map;
- increasing QF_NRA timeouts;
- using the present one-row-per-center abstraction, which erases the second distinguished radius;
- or following an unrestricted blocker cycle without a proved geometric potential.

The key structural fact is that the cap arithmetic separates into:

1. three **pure-growth** families, each with an absolute bound from the ordered-cap count; and
2. one **MultiGrowth** residual in which at least two caps exceed their baseline sizes.

The three minimal MultiGrowth size profiles are exactly the three mixed card-14 profiles. They are useful theorem-discovery cells, but any lift must allow actual K4 supports to leave the 14 selected labels.

No source-clean global upper bound `D.A.card ≤ 17` exists in the caller stack. The production root is genuinely arbitrary-cardinality.

---

## 1. Source-current target and baseline facts

Write

```text
n  := D.A.card
s  := S.surplusCap.card
o1 := S.oppCap1.card
o2 := S.oppCap2.card
c  := S.oppApex2
```

The target supplies:

- `12 < n`;
- `surface : ExactFourPostCardElevenRobustSurface R`;
- two rows `firstRow secondRow : SelectedFourClass D.A c`;
- distinct positive radii;
- disjoint four-point supports;
- every positive-radius class at `c` has cardinality `< 5`.

Source-clean consequences are:

```text
5 ≤ s
4 ≤ o1
6 ≤ o2
s + o1 + o2 = n + 3.
```

The last lower bound uses the two disjoint rows: together they force at least four points in the strict second-opposite interior, hence at least six in the closed second-opposite cap.

The no-five hypothesis upgrades each supplied support to the full radius class at `c`: a four-point support is contained in its class, and that class has cardinality at least four and less than five.

The caller chain contains no field or theorem `n ≤ 17`. It begins from an arbitrary carrier with only `9 < A.card`; the card-ge-thirteen branch receives only `12 < D.A.card`.

---

## 2. First theorem: isolate pure growth from MultiGrowth

Define the baseline excess conditions without truncated subtraction:

```lean
def TwoCapExcess (S : SurplusCapPacket A) : Prop :=
  (6 ≤ S.surplusCap.card ∧ 5 ≤ S.oppCap1.card) ∨
  (6 ≤ S.surplusCap.card ∧ 7 ≤ S.oppCap2.card) ∨
  (5 ≤ S.oppCap1.card ∧ 7 ≤ S.oppCap2.card)
```

A pure arithmetic split is:

```lean
theorem capExcess_pure_or_multi
    {n s o1 o2 : ℕ}
    (hs : 5 ≤ s) (ho1 : 4 ≤ o1) (ho2 : 6 ≤ o2)
    (hsum : s + o1 + o2 = n + 3)
    (hn : 12 < n) :
    (6 ≤ s ∧ o1 = 4 ∧ o2 = 6) ∨
    (s = 5 ∧ 5 ≤ o1 ∧ o2 = 6) ∨
    (s = 5 ∧ o1 = 4 ∧ 7 ≤ o2) ∨
    (6 ≤ s ∧ 5 ≤ o1) ∨
    (6 ≤ s ∧ 7 ≤ o2) ∨
    (5 ≤ o1 ∧ 7 ≤ o2) := by
  omega
```

The first three arms are the pure surplus, pure first-opposite, and pure second-opposite growth cases. The final three arms are `TwoCapExcess`.

### Ordered-cap count adapter needed

The source-facing count theorem should be packaged for every indexed cap as something equivalent to:

```lean
theorem SurplusCapPacket.capByIndex_card_add_four_le_choose_complement
    (D : CounterexampleData)
    (S : SurplusCapPacket D.A)
    (i : Fin 3)
    (F : FaithfulCarrierPattern D.A) :
    (S.capByIndex i).card + 4 ≤
      Nat.choose (D.A \ S.capByIndex i).card 2
```

The underlying theorem is `orderedCap_card_add_four_le_choose_outside`. The remaining work is a general indexed-cap adapter: enumerate the complete cap in boundary order, construct `MinorCapSideHypotheses` and `StrictCapOrder`, and handle a wrapping cap by a cyclic recut. This is Lean plumbing if the full cap-order and faithful-row fields are available; it must not be replaced by an exact-card-only enumeration.

### Pure-growth bounds

If only the surplus cap grows, then `o1=4`, `o2=6`, and the complement of the surplus cap has cardinality seven. Hence

```text
s + 4 ≤ choose(7,2) = 21,
n = s + 7,
therefore n ≤ 24.
```

If only the first-opposite cap grows, its complement has cardinality eight:

```text
o1 + 4 ≤ choose(8,2) = 28,
n = o1 + 8,
therefore n ≤ 32.
```

If only the second-opposite cap grows, its complement has cardinality six:

```text
o2 + 4 ≤ choose(6,2) = 15,
n = o2 + 6,
therefore n ≤ 17.
```

This gives a precise source theorem of the form:

```lean
inductive TwoRadiusGrowthOutcome (D : CounterexampleData)
    (S : SurplusCapPacket D.A) : Prop
| surplusOnly
    (h1 : S.oppCap1.card = 4)
    (h2 : S.oppCap2.card = 6)
    (hcard : D.A.card ≤ 24)
| firstOppositeOnly
    (hs : S.surplusCap.card = 5)
    (h2 : S.oppCap2.card = 6)
    (hcard : D.A.card ≤ 32)
| secondOppositeOnly
    (hs : S.surplusCap.card = 5)
    (h1 : S.oppCap1.card = 4)
    (hcard : D.A.card ≤ 17)
| multiGrowth
    (h : TwoCapExcess S)
```

and

```lean
theorem twoRadiusGrowthOutcome_of_postCardEleven ... :
    TwoRadiusGrowthOutcome D S
```

The proof consists of the arithmetic split, three complement-card calculations, the three indexed ordered-cap inequalities, and `norm_num`/`omega`.

### Arithmetic guardrail

There is no global bound from the generic cap inequalities alone.

The first-opposite family

```text
(s,o1,o2,n) = (5,t,t,2t+2)
```

and the surplus family

```text
(s,o1,o2,n) = (t,t,t,3t-3)
```

satisfy the baseline bounds, cap sum, and all three inequalities

```text
m + 4 ≤ choose(n-m,2)
```

for arbitrarily large `t`. Therefore previous tentative whole-arm bounds `n≤24` and `n≤32` are invalid; those numbers apply only to the pure-growth subcases. The full second-opposite arm is bounded because its other two caps are fixed at baseline.

---

## 3. Best unbounded target: a source-open MultiGrowth theorem

The sole genuinely unbounded residual should be isolated as:

```lean
theorem false_of_twoRadius_noFive_multiGrowth
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ r, 0 < r →
      (SelectedClass D.A S.oppApex2 r).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hdisjoint : Disjoint firstRow.support secondRow.support)
    (hmulti : TwoCapExcess S) : False
```

This theorem is not presently proved. It is the right mathematical residual because it covers every arbitrarily large cap profile.

### Why the three mixed card-14 cells matter

The minimal closed-cap profiles for the three MultiGrowth arms are:

```text
surplus + firstOpposite excess:  (6,5,6)
surplus + secondOpposite excess: (6,4,7)
firstOpposite + secondOpposite:   (5,5,7)
```

Each has total cardinality 14 after accounting for the three shared Moser vertices. Thus the mixed card-14 cells are the smallest local witnesses of MultiGrowth.

However, exact-card CNF UNSAT does not automatically lift. In the ambient carrier, a K4 row selected at one of the skeleton points may use support points outside the selected 14 labels. The first non-hereditary family is `k4_everywhere`; blocker-existence and exact cap-exhaustion clauses have the same problem.

The correct finite object must therefore be **source-open**:

- select the cap skeleton inside the original `D.A`;
- retain the two distinguished `c`-centered rows;
- whenever a proof core uses a row at a selected center, introduce its actual four support points as roles, permitting fresh roles outside the skeleton;
- store their original `BoundaryIndexing D.A` positions and cap memberships;
- never assert that the skeleton is a new `CounterexampleData`, has K4 internally, or exhausts a cap.

A Lean-facing packet can be shaped as:

```lean
structure TwoRadiusMultiGrowthLocalPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) where
  boundary : BoundaryIndexing D.A
  firstRow secondRow : SelectedFourClass D.A S.oppApex2
  radii_ne : firstRow.radius ≠ secondRow.radius
  supports_disjoint : Disjoint firstRow.support secondRow.support
  fullClass_first :
    firstRow.support = SelectedClass D.A S.oppApex2 firstRow.radius
  fullClass_second :
    secondRow.support = SelectedClass D.A S.oppApex2 secondRow.radius
  growthKind : Fin 3
  -- Injective selected cap roles witnessing one of the three excess pairs.
  capRoles : ...
  capRoles_mem : ...
  -- Actual ambient rows used by a local certificate; their supports are open.
  rows : Fin k → SelectedFourClass D.A (rowCenter ·)
  rowSource : ...
  rowSource_mem : ...
```

The packet constructor is source-level and uniform in `n`; the terminal occurrence theorem is the hard new mathematics.

---

## 4. Immediate geometric sink to formalize

The current card-14 work exposed a missing generic six-role theorem. For six boundary roles in strict order

```text
a < b < c < d < e < f
```

and selected rows centered at `a`, `b`, and `f` satisfying

```text
{d,e} ⊆ Ka.support
{c,d} ⊆ Kb.support
{c,e} ⊆ Kf.support,
```

the following contradiction is source-independent:

```lean
theorem false_of_six_ccw_three_shell_equalities_034_123_524 ... : False
```

Proof:

1. Strict Kalmanson on `(a,b,c,d)`, followed by `Kb.same_radius c d`, gives
   `dist a d < dist a c`.
2. The complementary strict Kalmanson inequality on `(a,c,e,f)`, followed by
   `Kf.same_radius c e`, gives `dist a c < dist a e`.
3. `Ka.same_radius d e` gives `dist a d = dist a e`.
4. `linarith`.

This should be placed in the lowest acyclic Kalmanson module and its full D6 orbit normalized. An independent classifier finds 36 equality triples in three D6 orbits for six-role, three-row, two-Kalmanson contradictions. The current 40-template finite bank should be reconciled with that exact 36-family before completeness claims.

This theorem is a terminal, not a source occurrence producer. The missing source theorem is a disjunction asserting that every source-open MultiGrowth packet contains one of a finite bank of such local occurrences.

---

## 5. Required computation: hereditary-core CEGAR, not larger NRA

For each of the three minimal mixed profiles:

1. Add the complete normalized local Kalmanson no-good bank, beginning with the 36 six-role/two-K2/three-row schemas.
2. Solve the exact incidence/order abstraction.
3. For each UNSAT core, classify every clause as:
   - local/hereditary;
   - exact-cardinality dependent;
   - cap-exhaustion dependent;
   - `k4_everywhere` dependent;
   - blocker-coverage dependent.
4. Replace every used universal K4 row with an **open support row** whose other support points may be fresh ambient roles, then rerun.
5. Only a core surviving that open-support replay is a candidate for `false_of_twoRadius_noFive_multiGrowth`.

Outcomes:

- If all three source-open mixed packets are UNSAT with local exact certificates, formalize the occurrence disjunction and the MultiGrowth terminal. This closes every unbounded cardinality at once.
- If any packet is SAT, cap excess plus the current local row data do not force a contradiction. Do not add a wrapper; move to the blocker/deletion trace layer.
- QF_NRA should be used only on the small exact survivors of the Kalmanson/Farkas layer, not on the whole carrier or all positive equalities.

---

## 6. Fallback: preserve the eight fixed sources and their actual blocker rows

Let

```text
U := firstRow.support ∪ secondRow.support.
```

A source-clean bounded packet is constructible:

- `U.card = 8`;
- every `q ∈ U` belongs to `D.A`;
- `q` belongs to its chosen row `H.selectedAt q`;
- `H.blockerVertex q ≠ q`;
- `surface.secondApex_robust` implies `H.blockerVertex q ≠ S.oppApex2`;
- each chosen row has cardinality four, positive radius, and exact same-radius equations;
- each chosen row meets either distinguished `c`-row in at most two points;
- equal actual blockers force equal selected supports;
- every blocker fiber has cardinality at most four;
- one global boundary indexing exists.

The eight sources, at most eight blockers, and the three non-source support points per blocker row use at most

```text
1 + 8 + 8 + 8·3 = 41
```

unique roles, independent of `n`.

A possible source theorem is:

```lean
theorem nonempty_twoRadiusEightSourceBlockerPacket ... :
    Nonempty (TwoRadiusEightSourceBlockerPacket D S H firstRow secondRow)
```

This directly repairs the one-row-per-center abstraction: retain the ordinary critical row system and attach the second exceptional row at `S.oppApex2`.

### Why this packet is not yet a terminal

The bare packet admits an abstract private-support model:

- give each of the eight sources a distinct blocker;
- let its row contain that source and three private points;
- make all blockers and private points distinct;
- use any cyclic boundary order.

Then blocker fibers have size one, row intersections are zero, each row meets `U` in only its source, and every current shared-pair Kalmanson consumer is absent. A long one-point-overlap cycle can also satisfy global connectivity without producing a shared pair.

Therefore the first genuinely new antecedent is one of:

- a positive return incidence: some blocker row contains a second named point from a distinguished radius class;
- a shell-containment statement forcing a blocker row into the eight-source set;
- or a deletion trace theorem that turns repeated fresh escapes into a bounded Kalmanson/curvature occurrence.

No current source theorem supplies these. This packet is the correct fallback after a source-open MultiGrowth survivor, not a proof by itself.

---

## 7. Pure-growth finite track

In parallel, the pure profiles form only three one-parameter finite families:

```text
surplusOnly:       (s,o1,o2) = (n-7,4,6),  13 ≤ n ≤ 24
firstOppositeOnly: (s,o1,o2) = (5,n-8,6),  13 ≤ n ≤ 32
secondOppositeOnly:(s,o1,o2) = (5,4,n-6),  13 ≤ n ≤ 17.
```

These may be attacked by exact finite ingress and certificate replay. Before any coordinate solver:

- include the complete local Kalmanson occurrence bank;
- quotient positive distance equalities;
- search opposite-vector strict comparison pairs;
- then use exact rational Farkas certificates;
- reserve QF_NRA for the residual equality/order cells.

A finite certificate closes only its exact pure profile unless its proof core passes the same hereditary/open-support audit.

---

## 8. Rejected or conditional routes

### Proper subcarrier

Invalid. K4, cap/MEC data, `CriticalShellSystem`, frontier fields, and minimality are not hereditary. Under minimality, a nonempty proper subset explicitly fails global K4.

### Partial label map replay of the full exact-card formula

Invalid without support closure. The `k4_everywhere` row for a retained center may leave the image; blocker and exact-cap clauses are also non-hereditary.

### Global cap-count bound

False. Only the three pure-growth subcases are bounded. First-opposite and surplus MultiGrowth admit unbounded arithmetic families.

### Bare blocker cycle

Insufficient. The blocker map has no fixed point and has a periodic orbit, but there is no strict potential in cap index, boundary rank, radius, apex distance, or deletion rank. Existing abstract cyclic row systems satisfy nonfixedness, row cardinality, pair-codegree, and support connectivity.

### Bare eight-source packet

Insufficient without positive return incidence or a trace theorem, as above.

### Longer identical QF_NRA runs

Not recommended. UNKNOWN supplies no mathematical information. The next solver work should change the formula structurally and remain tied to exact local source packets.

---

## 9. Lean-oriented implementation order

1. **Arithmetic:** add `TwoCapExcess`, `capExcess_pure_or_multi`, and the pure-arm cardinality lemmas.
2. **Cap adapter:** prove a general indexed `capByIndex_card_add_four_le_choose_complement`, including cyclic recut for a wrapping cap.
3. **Dispatcher:** construct `TwoRadiusGrowthOutcome` from the target hypotheses, without changing the live target body yet.
4. **Generic geometry:** add `false_of_six_ccw_three_shell_equalities_034_123_524` and normalize its D6 orbit/certificate schema.
5. **Source-open packet:** define and construct `TwoRadiusMultiGrowthLocalPacket`; do not include surjectivity or internal K4.
6. **CEGAR:** close or refute the three source-open mixed packets.
7. **Occurrence theorem:** only after successful open-support replay, prove the finite local-occurrence disjunction and then `false_of_twoRadius_noFive_multiGrowth`.
8. **Pure profiles:** build exact finite ingress/replay for the three bounded one-parameter families.
9. **Final target:** dispatch on `TwoRadiusGrowthOutcome`; every arm must end in a source-clean terminal. Do not land an unconsumed split as a claimed closure.

## Final recommendation

The best route is not “prove all card 13/14 certificates and hope for monotonicity.” It is:

```text
cap-excess pure/MultiGrowth split
→ bounded pure-profile closures
→ source-open minimal MultiGrowth packets
→ exact local Kalmanson/Farkas occurrence theorem
→ target dispatch.
```

The single most important missing geometric fact is a **source occurrence theorem**: two-cap excess, together with the two pinned full radius classes and the critical-row/deletion packet, must force a bounded positive cross-incidence/order pattern. Cardinality and blocker nonfixedness alone do not force it. That premise must be discovered and falsified computationally before it is added to Lean.
