# Lean implementation handoff — repeated prescribed deletion pair

**Date:** 2026-09-01  
**Purpose:** source-ready decomposition of the next exact-five/Rigid221 producer.

## 1. Files

Recommended split:

```text
P97/ATail/RepeatedDeletionTraceSystem.lean
P97/ATail/RepeatedDeletionTraceAdapter.lean
```

The first file should be purely finite. The second may import the first-apex
override, robust second-apex trace bound, critical-shell support transport, and
prescribed joint-deletion constructor.

## 2. Pure data representation

Prefer the finite carrier-label subtype:

```lean
abbrev CarrierLabel (A : Finset alpha) := {x // x in A}
```

The pure theorem can instead use an arbitrary finite type `alpha`; this keeps
all geometry out of the counting proof.

Suggested predicates:

```lean
def Mutual (P : RepeatedDeletionTraceSystem alpha) (x y : alpha) : Prop :=
  x != y and y notin P.row x and x notin P.row y

def AvailablePair
    (P : RepeatedDeletionTraceSystem alpha)
    (x y d e : alpha) : Prop :=
  d != e and
  d in P.physicalClass and e in P.physicalClass and
  d notin P.row x and d notin P.row y and
  e notin P.row x and e notin P.row y
```

Represent an unordered edge by `Finset alpha` of cardinality two, or define a
small ordered record with a normalization proof. Avoid `Sym2` unless an
existing local API makes its finite counting substantially easier.

## 3. Strong conclusion type

```lean
inductive RepeatedDeletionWitness (P : RepeatedDeletionTraceSystem alpha)
  | star
      (y x1 x2 d e : alpha)
      (hy : y notin P.firstClass)
      (hx1 : x1 in P.firstClass)
      (hx2 : x2 in P.firstClass)
      (hx12 : x1 != x2)
      (h1 : Mutual P x1 y)
      (h2 : Mutual P x2 y)
      (hav1 : AvailablePair P x1 y d e)
      (hav2 : AvailablePair P x2 y d e)
  | internal
      (x1 y1 x2 y2 d e : alpha)
      (outside : ...)
      (edges_ne : ({x1,y1} : Finset alpha) != {x2,y2})
      (h1 : Mutual P x1 y1)
      (h2 : Mutual P x2 y2)
      (hde : ({d,e} : Finset alpha) =
        P.firstClass inter P.physicalClass)
      (hav1 : AvailablePair P x1 y1 d e)
      (hav2 : AvailablePair P x2 y2 d e)
```

The theorem:

```lean
theorem exists_repeatedDeletionWitness
    (P : RepeatedDeletionTraceSystem alpha)
    (hcard : 11 <= Fintype.card alpha) :
    Nonempty (RepeatedDeletionWitness P)
```

## 4. Finite lemmas

Useful small lemmas:

```lean
card_sdiff_ge_two_of_card_four_inter_le_two
five_sdiff_union_le_two_card_le_one_forces_two_two_disjoint
two_subsets_of_three_eq_or_union_eq
three_trace_classes_samePairCount
directedArcCount_le_three_mul
nonmutual_and_sameTrace_arc_lower_bound
```

For the trace-class estimate, avoid optimizing the three class sizes. Use the
pointwise arithmetic fact

```lean
a <= Nat.choose a 2 + 1.
```

Summing it over the three two-subsets of the three-set gives

```lean
Y.card <= sameTracePairs.card + 3.
```

For the final arithmetic, rewrite `Nat.choose m 2` using the available
choose-two formula and let `omega` close the `7 <= m` contradiction.

## 5. No-repeat as a local contradiction hypothesis

Do not add a `noRepeat` field to the structure. Inside the proof use:

```lean
by_contra h
push_neg at h
```

where `h` says no `RepeatedDeletionWitness` exists. The STAR branch is produced
immediately whenever one outside source leaves at least two common physical
candidates.

After STAR has been excluded, all outside traces are disjoint two-subsets of a
fixed three-set. Every mutual edge inside `Y` then has the same candidate pair,
so the contradiction hypothesis gives `mutualEdgesY.card <= 1`.

## 6. Source adapter

Instantiate on the carrier subtype. Define each source row from the critical
support and map it to carrier labels using its support-subset proof.

Required geometry lemma:

```lean
theorem same_two_physical_trace_bidirectional
    (hyF : y notin F)
    (hzF : z notin F)
    (hyz : y != z)
    (htrace : trace y = trace z)
    (hcard : (trace y).card = 2) :
    y in sourceRow z and z in sourceRow y
```

Proof steps:

1. extract distinct `p,q` from the two-point trace;
2. prove `O2`, `beta(y)`, and `beta(z)` are carrier points equidistant from
   `p,q`;
3. use second-apex robustness for `beta(y),beta(z) != O2`;
4. use the carrier perpendicular-bisector bound to prove blocker equality;
5. use `selectedSupports_eq_of_actualBlockers_eq`;
6. finish with the two `q_mem_support` facts.

## 7. Prescribed packets

For every `AvailablePair`, call the current
`exactFourMutualOmissionJointDeletion_of_prescribed` twice, once at `d` and once
at `e`. Its endpoint vertices may lie outside the physical class; only the
prescribed deleted point must lie in the physical class.

Store both packet equalities:

```text
first.deleted = d,
second.deleted = e.
```

Do not immediately flatten them into the historical exact-four packet.

## 8. Validation gates

Before changing reachability:

1. build the pure finite file;
2. `#print axioms` on `exists_repeatedDeletionWitness`;
3. build the source adapter;
4. `#print axioms` on `same_two_physical_trace_bidirectional`;
5. build the exact-five/Rigid221 caller;
6. retain an exact `|A|=10` abstract countermodel as a negative threshold
   regression;
7. add positive unit tests for both STAR and INTERNAL witness constructors;
8. regenerate the obligation registry and private-edge reachability.
