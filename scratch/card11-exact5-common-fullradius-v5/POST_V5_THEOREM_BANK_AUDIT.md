# Post-v5 theorem-bank audit

Date: 2026-07-30

## Verdict

The four verified v5 models are not all compatible with the already-proved
general-n U5 metric kernels.  Two source-proved, import-reachable consumers give
sound no-new-variable CNF families at the same SAT-to-geometry trust boundary
as v5:

1. `Problem97.u5_nontriple_equilateral_on_p_circle_incompatibility`
   rejects the current `s2_o0` model.
2. `Problem97.u5_common_bisector_triple_incompatibility`
   rejects the current `s3_o9` model.

The current `s2_o9` and `s3_o0` valuations do not witness either family, nor
the two tested U5 critical-triple class incompatibilities.  Thus these cuts are
a justified v6 strengthening, not a closure result.  A new SAT run is required:
the old models only show that the two families are non-vacuous.

## Evidence from the four verified models

The audit is reproducible with:

```bash
node scratch/card11-exact5-common-fullradius-v5/audit_post_v5_bank_predicates.mjs
```

Here `E_c(a,b)` is the v5 local equal-distance variable at center `c`, and
`y[q,p,R]` is the source choice asserting that selected row `R` at center `p`
is the exact local class containing source `q`.

| case | selected supports that are entire local `E` classes | nontriple kernel | common-bisector kernel |
|---|---:|---:|---:|
| `s2_o0` | centers `3,4,6,8` | one witness | none |
| `s2_o9` | centers `0,2,5,7,8` | none | none |
| `s3_o0` | centers `2,5,6,8` | none | none |
| `s3_o9` | centers `0,2,5,8` | none | one witness |

Neither
`U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility` nor
`U5QCriticalTripleClass.two_triple_centers_third_common_incompatibility`
has a witness in any of the four valuations.

### `s2_o0`: nontriple equilateral witness

Take

```text
q=8, p=4, R={1,2,8,10}, T=R\{q}={1,2,10}, t=1, x=3
Bt={3,4,5,9}, Bx={1,4,5,7}.
```

The positive source choice `y[8,4,row103]` makes `R` the exact `q`-containing
class at `p`.  Hence `dist p t = dist p q`, while `x ∉ R` gives
`dist p x ≠ dist p q`.  At center `t=1`, the model has the local class
`{3,4,5,9,10}`, so `Bt` is a q-free four-point equal-radius subset containing
`p,x`.  At center `x=3`, it has class `{1,4,5,7}`, so `Bx` is a q-free
four-point equal-radius subset containing `p,t`.  These are exactly the
premises of `u5_nontriple_equilateral_on_p_circle_incompatibility`.

The corresponding concrete clause, using the current manifest IDs, is

```dimacs
-37023 -41067 -41074 -41078 -41150 -41164 -41166 0
```

It is violated by `s2_o0` and satisfied by the other three current models.

### `s3_o9`: common-bisector witness

Take

```text
q=8, p=2, R={4,8,9,10}, (t1,t2,t3)=(4,9,10), x=7,
Bx={2,4,9,10}.
```

The positive source choice `y[8,2,row12]` supplies the three dangerous-radius
equalities at `p`.  At center `x=7`, the local class
`{0,1,2,3,4,5,6,9,10}` contains `Bx`.  Thus `Bx` is a q-free four-point
equal-radius subset containing `p,t1,t2,t3`.  Strict convex position supplies
the required noncollinearity of the three distinct `ti`, and `p ≠ q` supplies
the positive dangerous radius.  These are exactly the premises of
`u5_common_bisector_triple_incompatibility`.

The corresponding concrete clause is

```dimacs
-36904 -41338 -41342 -41343 0
```

It is violated by `s3_o9` and satisfied by the other three current models.

The two displayed clauses are audit witnesses only.  A v6 encoder should emit
the complete predicate families below, rather than only blocking these two
assignments up to their present labels.

## Exact v6 CNF predicates

### Family A: nontriple equilateral on the dangerous `p`-circle

For every source choice `y[q,p,R]`, write `T = R \ {q}`.  For every
`t ∈ T`, every `x ∉ R ∪ {p}`, every four-element
`Bt ⊆ V \ {q,t}` containing `{p,x}`, and every four-element
`Bx ⊆ V \ {q,x}` containing `{p,t}`, emit

```text
¬y[q,p,R]
∨ (∨ z ∈ Bt\{p}, ¬E_t(p,z))
∨ (∨ z ∈ Bx\{p}, ¬E_x(p,z)).
```

Equivalently, forbid the conjunction

```text
y[q,p,R]
∧ ∧ z ∈ Bt\{p}, E_t(p,z)
∧ ∧ z ∈ Bx\{p}, E_x(p,z).
```

The source-choice exactness supplies both the dangerous-radius equality for
`t` and the off-circle inequality for `x`.  The local equalities construct the
two q-deleted four-point witness classes.  No global `G` literal is needed.

### Family B: common bisector of the dangerous triple

For every source choice with four-point support
`R = {q,t1,t2,t3}` and every `x ∉ R ∪ {p}`, emit

```text
¬y[q,p,R] ∨ ¬E_x(p,t1) ∨ ¬E_x(p,t2) ∨ ¬E_x(p,t3).
```

The order/strict-convex adapter supplies noncollinearity, so no order-selector
literal is mathematically necessary.  If the implementation exposes
noncollinearity only under an explicit selected-order guard, emit the same
clause guarded by `¬O_pi` for each order selector `O_pi`; this is only an
adapter-shape distinction.

Both families use existing variables and are invariant under relabeling.

## Theorem and bank status

The two consumers are in
`lean/Erdos9796Proof/P97/U5GlobalIncidenceKernels.lean`, at lines 112 and 146.
Their proof bodies are direct metric arguments, and that source file contains
no `sorry` or `admit`.  The file is import-reachable through

```text
U5FiniteExtraction
→ U3ToU5Terminal
→ RemovableVertexAxiom.PinnedSurplusGeneralM
→ RemovableVertexAxiom.PinnedSurplusBank
→ RemovableVertexAxiom.Continuation
→ RemovableVertexAxiom
→ Descent
→ UniversalLocal
→ UpstreamBridge
→ Erdos9796Proof
```

Classification: **source-proved and import-reachable**, but not freshly
kernel-built or transitively axiom-audited in this task.

The remaining bank families do not presently furnish additional sound clauses:

- The 96 sibling general-n U5 incidence families are real theorem-bank
  consumers, but the two tested critical-triple class predicates have no
  witness in the four models.  Further use requires an exact premise matcher,
  not similarity of support shapes.
- The 18 unimported U1 row-slot contradiction consumers require
  `RowSlotLabelPacket`/ordinal classification data absent from the v5
  vocabulary.  `u1TwoLargeCapObstruction` likewise lacks a cap/large-cap
  producer in these models.
- The card-11 exact-four/count-row closures require live
  `FirstApexUniqueRadiusExactFourResidual` or `SurplusCapPacket` hypotheses
  (including minimality, containment, endpoint, and pin data).  A v5
  `E/G/y/order` valuation does not provide those interfaces.
- The legacy and older-general theorem-bank candidates are predominantly
  N9-specific coordinate, cell, Radon, or polynomial contradictions.  Their
  required coordinate/order-cell premises are not encoded here, so they are
  not valid local cuts on the present abstraction.

Finally, v5's arbitrary equivalence extension of global `G` remains a trust
boundary, but it is irrelevant to the two proposed families: they depend only
on `y`, local `E`, carrier distinctness, and strict convexity.
