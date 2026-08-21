# Bi-apex schemas for the exact-twelve Rigid221 terminal

Date: 2026-08-20. Companion to
`pentagon-circumfan-schemas-2026-08-19.md` (kernels K0–K5, Theorems A–D are
cited from there and not reproved). Status labels as before:
{{PROVED-HERE}}, {{NEEDS-LEAN}}, {{NEEDS-BANK-DEDUP}}, {{USED-LEAF-FACT}}.

Target, as posed: *"No exact-twelve A5 carrier realizes the physical
five-row cycle, the disjoint four-point first-apex fiber Q, the three
remaining carrier points, the good/bad-source bounds, one of the
adjacent-pair or alternating deletion patterns, and a source-faithful
escape row satisfying the U-family cap and support conditions."*

## 0. Decode and identification ({{USED-LEAF-FACT}}, confirm)

Mapping of the sentence onto repo objects, as best the tree supports:

- **exact-twelve carrier** — `D.A.card = 12` with the surplus five-class
  (`S.surplusCap.card = 5`), first cap of four (`S.oppCap1.card = 4`), as
  in the three `pentagonOffClassBlocker_*_missingIncidence` leaves of
  `Rigid221SourceHeavy.lean` and the `ExactTwelveRigid221*` CNF/ingress
  lane (`Fin 12` labels). Partition `12 = 5 ⊕ 4 ⊕ 3`: the physical class
  `C` about `P₂ := oppApex2` at radius `ρ`, the first-apex fiber `Q`
  about `P₁ := oppApex1` (disjoint from `C`), and three remaining
  carriers.
- **physical five-row cycle** — the pentagon trace cycle
  `u → xu → deleted → v → xv → u` with its five blockers, in the
  **off-class-blocker** branch (`centerAt xv = c ∉ C`).
- **good/bad-source bounds** — the `goodSource`/`badSources`
  classification of `ExactFourRobustCapExpansion.lean`.
- **adjacent-pair / alternating deletion patterns** — the two placements
  of the joint-deletion pair on the five-cycle (the
  `interiorDeletion`/`uDeletion`/`threeCenterDeletion` arms and
  `TwoDeletionCollision.lean`).
- **source-faithful escape row, U-family** — a `FaithfulCarrierPattern`
  row in the `SourceEqU` context, under the frozen-safe-candidate /
  surplus-escape cap and support side conditions.

If the sentence instead names a consolidated model not yet pushed (the
clone read here ends at `377db68`, 2026-08-19), the schemas below still
apply: they consume only ConvexIndep, the two pinned classes, and the
Dumitrescu two-witness bound, and are cardinality-generic.

Current state of the lane, for calibration: 37 ordered-v4 learned cuts
replayed into reusable Lean consumers (checkpoint 2026-08-08); one
kernel-checked duplicate-center nogood in the terminal ingress; three
`missingIncidence` leaves still `sorry`, each of the form
"¬(five-conjunct incidence packet) → False".

## 1. Portability matrix from the circumfan document

What transfers to this terminal unchanged, what weakens, what dies:

- **K0 (half-plane), K1 (open half-circle)** — port verbatim, and now
  **twice**: the class `C` lies in an open half-circle of
  `Γ₂ = sphere P₂ ρ`, and the fiber `Q` lies in an open half-circle of
  `Γ₁ = sphere P₁ ρ₁`. Both are gate-A consequences of ConvexIndep plus
  the pinned memberships.
- **K2, K3 (bisector representation; off-arc parameter > ½)** — port
  verbatim for both apexes.
- **K5 / Theorem C(a) (exhaustion nogoods)** — port and **strengthen**:
  at `|A| = 12` every carrier is named, so the nogood family is complete
  over the CNF's membership atoms rather than partial.
- **Theorem A / Theorem D (full arc coordinates; order rigidity; the O2
  kill)** — **do not port.** This lane sits under
  `pentagonOffClassBlocker`, so of the three on-class midpoint equations
  only `centerAt u = xv` survives (`α(xv) = α(xu)/2` relative to `u`);
  the class retains two free angular parameters until further blockers
  are identified per arm. Any order-rigidity statement here must be
  branch-conditional. Theorem B survives only in the weak form "chord
  order = gap order within the half-circle".

## 2. New schemas

Angular conventions: for a pinned class about apex `P`, K1 gives angle
coordinates `α` on an open interval of length `< π`; on a circle, the
class's convex-position cyclic order equals the angular order about the
center (no fan lemma needed — order on a circle *is* angular order about
its center). Two distinct carriers never share a direction from a third
(no-three-collinear).

### S1 (on-class blocker localization; adjacent-pair obstruction). {{PROVED-HERE}}

Let `C` be a pinned class about `P` (all at distance `ρ > 0`), and let
`z ∈ C` be equidistant from distinct `p, q ∈ C`. Then:

1. `α(z) = (α(p) + α(q))/2` exactly (K2(2), with `t > 0` from K0 and the
   norm pinning `t`; the mid-angle formula is branch-free by K1).
2. Hence `z` lies **strictly between `p` and `q` in the class's cyclic
   order**; in particular a pair of *consecutive* class points has **no
   on-class blocker at all** — its second equidistant witness (if any,
   after `P`, by the Dumitrescu bound) is off-class.
3. Uniqueness: at most one point of `C` can serve a given pair (distinct
   class points have distinct directions from `P`).

*Retro-verification against exact-17 (order O1: `u, v, deleted, xv, xu`;
coordinates `0, a, 1.5a, 2a, 4a`):* traces `{u,xu}`, `{v,xv}`, `{xv,u}`
are non-consecutive and their blockers `xv, deleted, v` sit at the exact
mid-angles `2a, 1.5a, a` ✓; trace `{xu,deleted}` is non-consecutive but no
class point sits at `2.75a`, so its blocker `e` is off-class ✓; trace
`{deleted, v}` is **consecutive**, so S1 *forces* its blocker off-class —
which is precisely `c`. S1 thus explains, rather than assumes, the
off-class facts of the pentagon table, and at exact-twelve it converts
every (class-order × trace-cycle × blocker-identification ×
deletion-pattern) combination into one-line arithmetic that either checks
or refutes the arm. This is the direct pruning tool for the
adjacent-pair-versus-alternating split. Fiber version: identical about
`P₁`; for `|Q| = 4` only the two diagonal pairs admit on-fiber blockers,
and each blocker is the exact mid-angle point.

### S2 (universal-witness budget for pinned pairs). {{PROVED-HERE}}

`P₂` is equidistant from **every** pair of class points; by the proved
bound `Dumitrescu.perpBisector_apex_bound` each pair admits at most two
equidistant carriers. Hence each of the ten class pairs has **at most one
equidistant carrier besides `P₂`**, and the five pentagon traces consume
five of these slots with the five named blockers. Boolean form, complete
at exact-twelve because all centers are named:

- for each class pair `{p, q}` and any two distinct centers
  `x, y ∉ {P₂}`: `¬({p,q} ⊆ R_x ∧ {p,q} ⊆ R_y)`;
- for each pentagon trace with named blocker `b`: for every center
  `x ∉ {P₂, b}`: `¬({p,q} ⊆ R_x)`;
- for consecutive class pairs, combine with S1(2): the unique free
  witness, if it appears in any row pattern, is off-class.

Symmetrically for the six fiber pairs with `P₁` as universal witness.
{{NEEDS-BANK-DEDUP}} against the perp-bisector chain family: the chains
kill *three* witnesses; the content here is that the apex is a **free
first witness for every pair simultaneously**, which halves each pair's
budget before any row is even selected.

### S3 (cross-apex intersection pinning). {{PROVED-HERE}}

Suppose a row `R_z` contains a class pair `{p, q} ⊆ C` and a fiber pair
`{s, t} ⊆ Q`. Then `z` lies on `bisector(p q) ∋ P₂` and on
`bisector(s t) ∋ P₁`. Consequences:

1. Since `|R_z| = 4`, the row is exactly `{p, q, s, t}` and there is at
   most one such row per (class pair, fiber pair) combination.
2. If the two bisectors are distinct lines, they meet in one point, so
   `z` is **that** point; `z` is then simultaneously the unique free
   witness of both pairs (consistent with S2's budget, which it
   consumes on both sides).
3. If the bisectors coincide, the common line carries `P₁`, `P₂`, `z`;
   no-three-collinear forces `z ∈ {P₁, P₂}` — i.e. the only way a
   coincident-bisector mixed row exists is centered at an apex, with the
   two apexes and the two chord midpoints collinear.

Boolean form: for each of the `10 × 6` (class pair, fiber pair)
combinations, at most one center may host the mixed row, and hosting it
spends the free-witness slot of both pairs. Together with S2 this makes
mixed rows nearly extinct in the exact-twelve table: any arm that needs
two of them on overlapping pairs dies at the Boolean level.

### S4 (fiber trace bound). {{NEEDS-LEAN}} {{NEEDS-BANK-DEDUP}}

Any row centered off `P₁` meets `Q` in at most two points (two distinct
circles), the `Γ₁` analog of
`actualLateRow_secondClass_card_le_two`; likely already derivable from
the banked two-circle kernel — bank only if the fiber instantiation is
absent.

## 3. Honest limits: what this layer cannot reach

The three live `sorry`s are `missingIncidence` residues: each asserts the
**failure** of a five-conjunct packet such as
`d ∈ SelectedClass (A \ {xu}) P₂ ρ ∧ P₂ ∈ K_c.support ∧ u ∈ K_c.support ∧
P₂ ∈ K_xv.support ∧ d ∈ K_xv.support`, and asks for `False`. Discharging
them means **forcing** radius-level incidences — a blocker landing on
`Γ₂`, the apex landing in specific supports. The circumfan layer
localizes *directions* (bisector rays, mid-angles, `t > ½`) and never
norms; nothing in K0–K5 or S1–S3 can force `dist P₂ e = ρ`. Those
conjuncts belong to the survival/deletion machinery (the common-arm CEGAR
lane's stated producer gap). So the posed sentence is **not** provable
from the order/bisector layer alone; the realistic contribution is the
same shape as exact-17: S1–S3 prune the Boolean space — plausibly
killing entire deletion-pattern arms via S1(2) — and the residue that
survives is genuinely metric.

## 4. Suggested sequencing

1. Confirm the §0 decode, especially which consolidated model file (if
   any) the sentence names; if it is the ordered-v4 CNF, S1–S3
   instantiate over its membership atoms directly.
2. Formalize S1 (smallest, sharpest): the mid-angle identity is K2
   verbatim plus one betweenness line; run it against the deletion-arm
   trace tables to see which of the adjacent-pair arms die outright.
3. Bank S2's apex-budget clauses (order-free, complete at twelve) and
   S3's mixed-row pins; dedup per §2 notes.
4. Route the surviving arms back to the missing-incidence producers —
   that residue is where new mathematics is actually required, and no
   schema in this document or its companion substitutes for it.

## 5. Author's verification statement

Proved here by hand: S1, S2, S3 (with S2/S3 resting on the repo's proved
`Dumitrescu.perpBisector_apex_bound` and no-three-collinear from
ConvexIndep). Read in-repo but not kernel-checked: the exact-twelve leaf
hypotheses, the cap-cardinality pins, the good/bad-source and
faithful-pattern definitions. Not claimed: closure of any leaf, the
posed non-realizability statement, or novelty beyond the flagged dedup
points. The single highest-value item is S1 run against the
deletion-pattern arms: it is one lemma, already three-quarters
formalized by the companion document's K2, and it is the only place in
this terminal where a purely order-level argument can still delete whole
branches.
