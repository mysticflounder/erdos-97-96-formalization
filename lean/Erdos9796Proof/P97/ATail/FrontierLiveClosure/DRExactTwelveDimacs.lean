/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Std.Data.HashSet

/-!
# DIMACS mirror of the D-R exact-12 two-family structural CNF

Plan item P3.4a of `docs/plans/2026-09-01-dr-two-radius-branch-closure.md`.

This module is a definition-only mirror of the Python encoder
`census/card_head/dr_exact12_structural.py` evaluated as
`build("none", families=("two_circle_same_arc",
"five_point_circle_isosceles_order"))`, the wave-5 "two-family CNF":
254,412 clauses over 6,281 variables, DIMACS sha256
`e29d1b2646d763425598fe0e5b1364118033b61df5aacdf5b907b6d0dad3bcb0`
(header `p cnf 6281 254412`), reference file
`scratch/runs/dr-two-radius-20260901/q1b-wave-5/artifacts/cnf-core2-none.cnf`
with per-family counts recorded in `cnf-manifest-core2-none.json`:
transitivity 137,280; two_circle_same_arc 1,980;
five_point_circle_isosceles_order 7,920; second_apex_rows 379;
first_apex_class 1,505; k4_everywhere 23,772; blockers 51,514;
ingress 30,062.

`clauses` reproduces the encoder's output clause for clause and literal for
literal: the variable layout (2,145 relation variables `eq(e, e')` over the 66
edges of the twelve labels in `EDGES` order, then the selector variables in
`CNF.new_variable` allocation order), one generator per clause family in the
encoder's emission order, and the literal order of `CNF.add` (duplicates
dropped, sorted by absolute value).  The Python test
`census/card_head/tests/test_dr_exact12_lean_dimacs.py` evaluates `clauses`
through `lake env lean --run` and compares the emitted DIMACS with the
encoder's output line by line and by sha256.

There is no theorem here about the mathematics of the D-R branch; the file
states nothing about satisfiability, realizability, or the target theorem.
Every `def` names the encoder construct it mirrors.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace DRExactTwelveDimacs

/-! ## Labels and the cyclic order -/

/-- `LABELS`: the twelve labels `0, …, 11`. -/
def labels : List Nat := List.range 12

/-- `A2`, the second apex (`oppApex2`). -/
def secondApex : Nat := 0

/-- `A1`, the first apex (`oppApex1`). -/
def firstApex : Nat := 1

/-- `A3`, the third apex. -/
def thirdApex : Nat := 2

/-- `IS`: the surplus interior (chord `a1 a2`). -/
def surplusInterior : List Nat := [3, 4, 5]

/-- `I1`: the first-opposite interior (chord `a2 a3`). -/
def firstOppositeInterior : List Nat := [6, 7]

/-- `I2`: the second-opposite interior (chord `a3 a1`). -/
def secondOppositeInterior : List Nat := [8, 9, 10, 11]

/-- `IQ`: `interior_q`. -/
def interiorQ : Nat := 6

/-- `IW`: `interior_w`. -/
def interiorW : Nat := 7

/-- `CYCLIC_ORDER`: one boundary orientation of the carrier, `a1, Is, a2, I1, a3, I2`. -/
def cyclicOrder : List Nat := [1, 3, 4, 5, 0, 6, 7, 2, 8, 9, 10, 11]

/-- `POSITION[label]`: the index of a label in `cyclicOrder`. -/
def position (label : Nat) : Nat := cyclicOrder.findIdx (fun z => z == label)

/-- `_forward`: the labels `i, j, k` appear in this order going forward along
`cyclicOrder` (`((pos[j] - pos[i]) % 12) < ((pos[k] - pos[i]) % 12)`). -/
def forward (i j k : Nat) : Bool :=
  (position j + 12 - position i) % 12 < (position k + 12 - position i) % 12

/-- `_same_arc(q, v, u, y)`: `u` and `y` lie on the same arc of the chord `q v`. -/
def sameArc (q v u y : Nat) : Bool := forward q u v == forward q y v

/-- `others(center)`: every label other than `center`, in label order. -/
def others (center : Nat) : List Nat := labels.filter (fun z => z != center)

/-! ## Enumeration helpers (`itertools`) -/

/-- `itertools.combinations(xs, k)`: the `k`-element sublists of `xs`, in
lexicographic order of positions. -/
def combinations : List Nat → Nat → List (List Nat)
  | _, 0 => [[]]
  | [], _ + 1 => []
  | x :: xs, k + 1 => (combinations xs k).map (x :: ·) ++ combinations xs (k + 1)

/-- `itertools.combinations(xs, 2)` as pairs. -/
def pairs (xs : List Nat) : List (Nat × Nat) :=
  (combinations xs 2).filterMap fun
    | [a, b] => some (a, b)
    | _ => none

/-- `itertools.permutations(xs, k)`: the injective `k`-tuples of `xs`, in
lexicographic order of positions. -/
def permutations (xs : List Nat) : Nat → List (List Nat)
  | 0 => [[]]
  | k + 1 => xs.flatMap fun x => (permutations (xs.erase x) k).map (x :: ·)

/-- The position of the pair `(l, r)`, `l < r`, in `combinations(range(n), 2)`:
`l` pairs with the `n - 1 - l` larger elements after `l * (n - 1) - l * (l - 1) / 2`
pairs with a smaller first element. -/
def pairIndex (n l r : Nat) : Nat := l * (n - 1) - l * (l - 1) / 2 + (r - l - 1)

/-! ## Variable layout

Variables are numbered in `CNF.new_variable` allocation order: the 2,145
relation variables first, then `X`, `Y`, `U`, the `K4` selectors, `chi`,
`src`, `deleted`, `B2:X`, `B2:Y`. -/

/-- `EDGES`: the 66 edges `(a, b)`, `a < b`, in `itertools.combinations` order. -/
def edges : List (Nat × Nat) := pairs labels

/-- `_EDGE_INDEX` / `edge(a, b)`: the position of the edge `{a, b}` in `edges`. -/
def edgeIndex (a b : Nat) : Nat := pairIndex 12 (min a b) (max a b)

/-- `equal(e, e')`: the relation variable `eq(e, e')` of two distinct edge
indices, numbered `1, …, 2145` in `combinations(range(66), 2)` order. -/
def equalVar (e e' : Nat) : Nat := pairIndex 66 (min e e') (max e e') + 1

/-- `same(center, a, b)`: `a` and `b` are equidistant from `center`. -/
def sameVar (center a b : Nat) : Nat := equalVar (edgeIndex center a) (edgeIndex center b)

/-- The number of relation variables, `C(66, 2)`. -/
def relationVarCount : Nat := 66 * 65 / 2

/-- `CNF.new_variable` over a key list: the keys receive `base + 1, base + 2, …`
in list order. -/
def allocate (base : Nat) (keys : List α) : List (α × Nat) :=
  keys.zipIdx.map fun (key, i) => (key, base + i + 1)

/-- The variable allocated to a key (`0` if the key was never allocated). -/
def lookup [BEq α] (table : List (α × Nat)) (key : α) : Nat :=
  ((table.find? fun (k, _) => k == key).map (·.2)).getD 0

/-- `X:z` for `z ∈ others(A2)`. -/
def xVars : List (Nat × Nat) := allocate relationVarCount (others secondApex)

/-- `Y:z` for `z ∈ others(A2)`. -/
def yVars : List (Nat × Nat) := allocate (relationVarCount + xVars.length) (others secondApex)

/-- `U:z` for `z ∈ others(A1)`. -/
def uVars : List (Nat × Nat) :=
  allocate (relationVarCount + xVars.length + yVars.length) (others firstApex)

/-- `x[z]`. -/
def xVar (z : Nat) : Nat := lookup xVars z

/-- `y[z]`. -/
def yVar (z : Nat) : Nat := lookup yVars z

/-- `u[z]`. -/
def uVar (z : Nat) : Nat := lookup uVars z

/-- The first `K4` selector is allocated after `U`. -/
def k4Base : Nat := relationVarCount + xVars.length + yVars.length + uVars.length

/-- The number of four-element subsets of `others(center)`, `C(11, 4)`. -/
def quadCount : Nat := (combinations (others secondApex) 4).length

/-- `K4:center:quad` for `quad ∈ combinations(others(center), 4)`: the selectors
of one center are allocated consecutively, center by center. -/
def k4Selectors (center : Nat) : List (List Nat × Nat) :=
  allocate (k4Base + center * quadCount) (combinations (others center) 4)

/-- The first `chi` variable is allocated after the `K4` selectors. -/
def chiBase : Nat := k4Base + labels.length * quadCount

/-- The candidate blockers of `z`: every label other than `z` and `A2`. -/
def blockerCenters (z : Nat) : List Nat :=
  labels.filter fun c => c != z && c != secondApex

/-- `chi:z:c` for `c ∈ blockerCenters z`, allocated label by label. -/
def chiVars (z : Nat) : List (Nat × Nat) :=
  allocate (chiBase + ((List.range z).map fun z' => (blockerCenters z').length).sum)
    (blockerCenters z)

/-- `chi[(z, c)]`. -/
def chiVar (z c : Nat) : Nat := lookup (chiVars z) c

/-- The first `src` variable is allocated after `chi`. -/
def srcBase : Nat := chiBase + (labels.map fun z => (blockerCenters z).length).sum

/-- `src:z` for every label. -/
def srcVars : List (Nat × Nat) := allocate srcBase labels

/-- `src[z]`. -/
def srcVar (z : Nat) : Nat := lookup srcVars z

/-- The labels that may be the deleted point: outside `IS` and not `A1`. -/
def deletedKeys : List Nat :=
  labels.filter fun d => !surplusInterior.contains d && d != firstApex

/-- `deleted:d` for `d ∈ deletedKeys`. -/
def deletedVars : List (Nat × Nat) := allocate (srcBase + srcVars.length) deletedKeys

/-- `B2:X`. -/
def b2x : Nat := srcBase + srcVars.length + deletedVars.length + 1

/-- `B2:Y`. -/
def b2y : Nat := b2x + 1

/-- `cnf.n_variables`: the last allocated variable, `B2:Y` (evaluates to 6,281). -/
def variableCount : Nat := b2y

/-! ## Clause construction (`CNF.add` and the cardinality helpers) -/

/-- A positive literal. -/
def pos (v : Nat) : Int := v

/-- A negative literal. -/
def neg (v : Nat) : Int := -(v : Int)

/-- `CNF.add`: `tuple(sorted(set(literals), key=abs))`. -/
def normalize (literals : List Int) : List Int :=
  literals.eraseDups.mergeSort fun a b => a.natAbs ≤ b.natAbs

/-- `_exactly_one`. -/
def exactlyOne (vars : List Nat) : List (List Int) :=
  normalize (vars.map pos) ::
    (combinations vars 2).map fun pair => normalize (pair.map neg)

/-- `_exactly_k`: at least `k` by `(n - k + 1)`-subsets, then at most `k` by
`(k + 1)`-subsets. -/
def exactlyK (vars : List Nat) (k : Nat) : List (List Int) :=
  ((combinations vars (vars.length - k + 1)).map fun subset => normalize (subset.map pos)) ++
    ((combinations vars (k + 1)).map fun subset => normalize (subset.map neg))

/-- `exact_class(family, center, member)`: `member[z]` holds exactly for the
points of one full class at `center`. -/
def exactClass (center : Nat) (member : List (Nat × Nat)) : List (List Int) :=
  (pairs (others center)).flatMap fun (a, b) =>
    let ma := lookup member a
    let mb := lookup member b
    let s := sameVar center a b
    [normalize [neg ma, neg mb, pos s],
      normalize [neg ma, pos mb, neg s],
      normalize [pos ma, neg mb, neg s]]

/-! ## Clause families, in emission order -/

/-- Family 1, `transitivity`: for every three edge indices `first < second < third`,
the three resolution clauses of `eq` being an equivalence relation. -/
def transitivity : List (List Int) :=
  (combinations (List.range 66) 3).flatMap fun
    | [first, second, third] =>
      let fs := equalVar first second
      let ft := equalVar first third
      let st := equalVar second third
      [normalize [neg fs, neg st, pos ft],
        normalize [neg fs, neg ft, pos st],
        normalize [neg ft, neg st, pos fs]]
    | _ => []

/-- Family `two_circle_same_arc` (`_geometry_nogoods`): for every chord `q < v`
and every pair `u < y` of other labels on the same arc of that chord, not both
`qu = qy` and `uv = yv`. -/
def twoCircleSameArc : List (List Int) :=
  (pairs labels).flatMap fun (q, v) =>
    let rest := labels.filter fun z => z != q && z != v
    (pairs rest).filterMap fun (u, y) =>
      if sameArc q v u y then
        some (normalize [neg (equalVar (edgeIndex q u) (edgeIndex q y)),
          neg (equalVar (edgeIndex u v) (edgeIndex y v))])
      else none

/-- `core_instances("five_point_circle_isosceles_order")`: the injective label
tuples `[W, F, P, X, Z]`, in `itertools.permutations` order, whose orientation
data holds: `WFZ` and `XFZ` have different signs (`opposite`) and the chords
`FX` and `PZ` cross (`cross`: exactly one of `P`, `Z` is forward between `F`
and `X`). -/
def circleIsoscelesInstances : List (List Nat) :=
  (permutations labels 5).filter fun
    | [w, f, p, x, z] => (forward w f z != forward x f z) && (forward f p x != forward f z x)
    | _ => false

/-- `core_clause("five_point_circle_isosceles_order", labels, equal)`: the
all-negative clause of the equalities `WF = WX`, `WF = WZ`, `PZ = XZ`. -/
def circleIsoscelesClause : List Nat → List Int
  | [w, f, p, x, z] =>
    [neg (equalVar (edgeIndex w f) (edgeIndex w x)),
      neg (equalVar (edgeIndex w f) (edgeIndex w z)),
      neg (equalVar (edgeIndex p z) (edgeIndex x z))]
  | _ => []

/-- Family `five_point_circle_isosceles_order` (eager generic core): one clause per
distinct literal set, in first-occurrence order over `circleIsoscelesInstances`
(the encoder's `seen` set). -/
def fivePointCircleIsoscelesOrder : List (List Int) :=
  let step (state : Std.HashSet (List Int) × Array (List Int)) (labelTuple : List Nat) :=
    let clause := normalize (circleIsoscelesClause labelTuple)
    if state.1.contains clause then state else (state.1.insert clause, state.2.push clause)
  (circleIsoscelesInstances.foldl step (Std.HashSet.emptyWithCapacity 8192, #[])).2.toList

/-- Family 3, `second_apex_rows`: `X` and `Y` are full classes at `A2` with two
points in `I2` and one point in each adjacent closed cap; `X` and `Y` are disjoint. -/
def secondApexRows : List (List Int) :=
  ([xVars, yVars].flatMap fun member =>
    exactClass secondApex member ++
      exactlyK (secondOppositeInterior.map (lookup member)) 2 ++
      exactlyK ((surplusInterior ++ [firstApex]).map (lookup member)) 1 ++
      exactlyK ((firstOppositeInterior ++ [thirdApex]).map (lookup member)) 1) ++
    (others secondApex).map fun z => normalize [neg (xVar z), neg (yVar z)]

/-- Family 4, `first_apex_class`: `U` is a full class at `A1` containing
`interior_q` and `interior_w`, with one point in each adjacent closed cap, and
every four points pairwise equidistant from `A1` lie in `U`. -/
def firstApexClass : List (List Int) :=
  exactClass firstApex uVars ++
    [normalize [pos (uVar interiorQ)], normalize [pos (uVar interiorW)]] ++
    exactlyK ((surplusInterior ++ [secondApex]).map uVar) 1 ++
    exactlyK ((secondOppositeInterior ++ [thirdApex]).map uVar) 1 ++
    (combinations (others firstApex) 4).flatMap fun quad =>
      let pairwise := (pairs quad).map fun (a, b) => neg (sameVar firstApex a b)
      quad.map fun z => normalize (pairwise ++ [pos (uVar z)])

/-- Family 5, `k4_everywhere`: each `K4` selector forces its quad to be pairwise
equidistant from its center, and every center has a selected quad. -/
def k4Everywhere : List (List Int) :=
  labels.flatMap fun center =>
    let selectors := k4Selectors center
    (selectors.flatMap fun (quad, selector) =>
      (pairs quad).map fun (a, b) => normalize [neg selector, pos (sameVar center a b)]) ++
      [normalize (selectors.map fun (_, selector) => pos selector)]

/-- Family 6, `blockers`: every `z` has exactly one blocker `c ∉ {z, A2}`; under
`chi[(z, c)]` the class of `z` at `c` has at least four points (a `K4`
selector containing `z`), at most four, and every other class at `c` has at
most three points; the late system sends `U` to `A1`. -/
def blockers : List (List Int) :=
  (labels.flatMap fun z =>
    let centers := blockerCenters z
    exactlyOne (centers.map (chiVar z)) ++
      centers.flatMap fun c =>
        let guard := neg (chiVar z c)
        let rest := labels.filter fun l => l != z && l != c
        [normalize (guard :: (k4Selectors c).filterMap fun (quad, selector) =>
          if quad.contains z then some (pos selector) else none)] ++
          ((combinations rest 4).map fun quad =>
            normalize (guard :: quad.map fun s => neg (sameVar c z s))) ++
          ((combinations rest 4).map fun quad =>
            normalize (guard :: (pairs quad).map fun (a, b) => neg (sameVar c a b)))) ++
    (others firstApex).map fun z => normalize [neg (uVar z), pos (chiVar z firstApex)]

/-- Family 7, `ingress`: a unique source whose blocker is not `A1`; a unique
deleted point in `U`; a unique row `B2 ∈ {X, Y}` avoiding the deleted point;
under `src[z]` and `chi[(z, c)]` the deleted point is outside the class of `z`
at `c` (the deleted point is not the source), and no three candidates of `B2`
lie in that class. -/
def ingress : List (List Int) :=
  exactlyOne (labels.map srcVar) ++
    ((others firstApex).map fun z => normalize [neg (srcVar z), neg (chiVar z firstApex)]) ++
    exactlyOne (deletedVars.map (·.2)) ++
    (deletedVars.map fun (d, var) => normalize [neg var, pos (uVar d)]) ++
    exactlyOne [b2x, b2y] ++
    (deletedVars.flatMap fun (d, var) =>
      if d == secondApex then []
      else [normalize [neg b2x, neg var, neg (xVar d)], normalize [neg b2y, neg var, neg (yVar d)]]) ++
    labels.flatMap fun z =>
      (blockerCenters z).flatMap fun c =>
        let guard := [neg (srcVar z), neg (chiVar z c)]
        let candidates := labels.filter fun t => t != secondApex && t != c
        (deletedVars.filterMap fun (d, var) =>
          if d == z then some (normalize [neg (srcVar z), neg var])
          else if d == c then none
          else some (normalize (guard ++ [neg var, neg (sameVar c z d)]))) ++
          [(b2x, xVars), (b2y, yVars)].flatMap fun (row, member) =>
            (combinations candidates 3).map fun triple =>
              normalize (guard ++ [neg row] ++ (triple.map fun t => neg (lookup member t)) ++
                ((triple.filter fun t => t != z).map fun t => neg (sameVar c z t)))

/-! ## The CNF -/

/-- `cnf.clauses` of `build("none", families=("two_circle_same_arc",
"five_point_circle_isosceles_order"))`, in emission order. -/
def clauses : List (List Int) :=
  transitivity ++ twoCircleSameArc ++ fivePointCircleIsoscelesOrder ++ secondApexRows ++
    firstApexClass ++ k4Everywhere ++ blockers ++ ingress

/-- `cnf.counts`: the clause count of each family, computed from the generated lists. -/
def familyCounts : List (String × Nat) :=
  [("transitivity", transitivity.length),
    ("two_circle_same_arc", twoCircleSameArc.length),
    ("five_point_circle_isosceles_order", fivePointCircleIsoscelesOrder.length),
    ("second_apex_rows", secondApexRows.length),
    ("first_apex_class", firstApexClass.length),
    ("k4_everywhere", k4Everywhere.length),
    ("blockers", blockers.length),
    ("ingress", ingress.length)]

/-- One DIMACS clause line: the literals separated by spaces, terminated by `0`. -/
def dimacsLine (clause : List Int) : String :=
  String.intercalate " " (clause.map toString) ++ " 0"

end DRExactTwelveDimacs
end ATailFrontierLiveClosure
end Problem97
