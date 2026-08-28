# P97 Rigid221 card-18 checked-search correspondence v1

**Status: C2 AND SAT POSITIVE-CONTROL EXTENSION COMPLETE; EXTERNAL GATES CLOSED.**

Date: 2026-08-27
Original design base: `467b58a186fe1d81b78be8d042d8ab4bf0e585bd`
C2 implementation base: `9119f0c728dd65a2f6a335bee7a3ba7d2391029b`

## 1. Outcome

The checked-search encoding uses three separate formulas for the BI,
U, and XV constructors of `Rigid221Card18AbstractPacket`. It will encode only
the pure abstract packet, never the noncomputable geometric source witness.

Version 1 uses one-hot `Fin 18` role selectors and eighteen membership bits per
support. This costs more base variables than a five-bit label encoding, but it
avoids six invalid bit patterns and makes role equality, inequality, and
selected-support membership kernel-transparent.

No symmetry quotient or canonical-label assumption is used. C2 defines the
three kernel formulas and proves exact assignment-to-packet correspondence.
External CNF/DIMACS emission, model enumeration, certificate generation, and
solver execution remain closed. The v1 formulas are now proved satisfiable,
so no external solver run is justified for this unchanged surface.

## 2. Existing semantic boundary

The completed pure layer already provides:

```lean
Rigid221Card18AbstractPacket.Valid
Rigid221Card18AbstractPacket.check
Rigid221Card18AbstractPacket.check_eq_true_iff
Rigid221Card18AbstractPacket.source_to_abstract_packet
```

`check_eq_true_iff` is the correct Boolean reflection of a known packet. It is
not yet a search encoding: a solver assignment must also encode the packet's
role labels and support sets consistently.

The final contradiction direction will be:

```text
exact-card-18 source alternative
  -> valid abstract packet
  -> satisfying assignment for the matching arm formula
  -> contradiction with a checked arm-formula UNSAT theorem
```

The middle implication must be proved before any UNSAT result can constrain the
source. The reverse assignment-to-valid-packet implication is also required so
that a SAT result is a genuine countermodel to the current abstraction rather
than an inconsistent collection of semantic atoms.

## 3. Reuse preflight

The concrete candidate is a theorem equating arm-formula satisfiability with
the existence of a valid packet of that arm. Its immediate consumer is the
future `no_valid_abstract_packet` theorem.

A project-indexed Lean search at source revision `467b58a18` found:

- `Rigid221Card18AbstractPacket.check_eq_true_iff`, the Prop-to-Bool packet
  reflection already in use;
- `Census554.CoverCnf.sinzClauses`, a deterministic Sinz at-most encoder;
- `Census554.SinzSat.sinz_sat`, which proves only the source-to-satisfying
  assignment direction for that encoder;
- specialized one-hot source-assignment proofs in `Census554.BaseSat`;
- selector allocation and source-satisfaction patterns in
  `ExactTwelveRigid221NextRowJobCnf` and
  `ExactTwelveRigid221FiveOmissionCnf`; and
- `CheckpointedRup` plus `CheckpointedRupSemanticBoundary`, which are later
  certificate-replay components, not formula-correspondence substitutes.

Neither the project corpus nor `Std.Sat` supplies a generic theorem saying that
CNF satisfaction is equivalent to `Finset.card = k`. The first missing
antecedent is therefore a kernel proof of both directions for the chosen
cardinality encoding. Reusing `sinz_sat` alone would be circularly incomplete
for model decoding.

## 4. Armwise base assignment

### 4.1 Semantic search choices

The common packet chooses ten labels:

```text
u, v, xu, xv, deleted,
source1, source2, deletedCenter, actualCenter1, actualCenter2
```

and two supports:

```text
selectedXvRow, deletedCenterRow
```

The BI arm adds four supports:

```text
uB1, uB2, xvB1, xvB2
```

Each crossed arm adds one independent label and three supports:

```text
oppApex2; K1, K2, BO
```

`oppApex2` must remain independent. Current `Valid` does not identify it with,
or separate it from, any common role.

### 4.2 Fixed base-variable counts

For an arm `a`, the base layout supplies:

```text
roleBit    : Role a    -> Fin 18 -> Var
supportBit : Support a -> Fin 18 -> Var
```

The base counts are deliberately equal:

| Arm | Role bits | Support bits | Total base variables |
| --- | ---: | ---: | ---: |
| BI | `10 * 18 = 180` | `6 * 18 = 108` | 288 |
| U | `11 * 18 = 198` | `5 * 18 = 90` | 288 |
| XV | `11 * 18 = 198` | `5 * 18 = 90` | 288 |

Variable allocation must be a total Lean definition with disjoint ranges.
Lean uses zero-based base indices `0 ... 287`. Derived variables begin at
internal index 288. Canonical DIMACS maps internal index `i` to variable
`i + 1`, so its base range is `1 ... 288` and its first derived variable is
289. No unused gap is permitted. Every range has a deterministic arm-specific
manifest.

U and XV use the same crossed layout but remain separate formulas. U orients
`(deleted, retained)` as `(u, xv)`; XV orients it as `(xv, u)`.

Only composition-required signals receive derived variables. Ordinary
role-selected support membership and nonmembership atoms use direct clauses.
The retained zero-gap derived layout is:

| Arm | Derived family | Internal range | Count |
| --- | --- | ---: | ---: |
| BI | physical mask | `288 ... 305` | 18 |
| BI | `deletedCenterRow ∩ physicalFive` | `306 ... 323` | 18 |
| BI | `uB1 ∩ uB2` | `324 ... 341` | 18 |
| BI | `xvB1 ∩ xvB2` | `342 ... 359` | 18 |
| U/XV | physical mask | `288 ... 305` | 18 |
| U/XV | `deletedCenterRow ∩ physicalFive` | `306 ... 323` | 18 |
| U/XV | five crossed-incidence signals | `324 ... 328` | 5 |

Thus BI has 72 derived and 360 total internal variables; each crossed arm has
41 derived and 329 total internal variables. The five crossed signals follow
the semantic atom order in Section 6.4. U and XV may share typed layout code,
but remain distinct arm values and formulas.

## 5. Representation constraints

Every role receives an exactly-one constraint over its eighteen selectors:

- one positive clause containing all eighteen bits; and
- one negative binary clause for every pair of distinct labels.

These clauses do not strengthen `Valid`. A Lean `Fin 18` role already has
exactly one value; the clauses merely characterize its Boolean representation.

The initial implementation must provide:

```lean
encodeBase : PacketOfArm a -> Nat -> Bool
baseWellFormed : SearchArm -> (Nat -> Bool) -> Prop
decodeBase : baseWellFormed a sigma -> PacketOfArm a

decode_encode : decodeBase (encodeBase p) ... = p
encode_decode_on_base : AgreesOnBase sigma (encodeBase (decodeBase h))
```

No `Classical.choose` operation may occur in the finite decoder. The selected
label must be recovered from the proved exactly-one finite selector by an
explicit finite construction.

## 6. Clause correspondence

### 6.1 Direct role-selected support atoms and retained signals

An ordinary positive atom `r ∈ S` emits, for every label `l`, the direct
clause

```text
not roleBit(r,l) or supportBit(S,l)
```

An ordinary negative atom `r ∉ S` emits

```text
not roleBit(r,l) or not supportBit(S,l)
```

Under exactly-one role selection, each eighteen-clause family must be proved
in both directions against membership or nonmembership of the decoded role in
the decoded support. These atoms receive no witness variable.

When a retained derived variable `m` must represent membership of role `r` in
support `S` for later Boolean composition, the formula emits, for every label
`l`:

```text
not roleBit(r,l) or not supportBit(S,l) or m
not roleBit(r,l) or     supportBit(S,l) or not m
```

Under exactly-one role selection, these clauses must prove both directions of
`m = supportBit(S, selectedLabel r)`. Version 1 uses this gadget only for the
five crossed-incidence signals that feed the final five-negative clause.
Derived variables are formula witnesses, not extra packet choices.

### 6.2 Role inequalities, physical roles, and intersection gadgets

Every semantic inequality uses the generic family:

```text
roleNe(r,s) := for each label l,
  not roleBit(r,l) or not roleBit(s,l)
```

Lean must prove that these eighteen binary clauses evaluate true exactly when
the two decoded roles differ. This family covers `source1 ≠ source2`, the two
actual-center roles, all ten pairs of physical roles, the five
`deletedCenter`-to-physical separations, and the four BI blocker-center
separations. Exactly-one constraints alone do not imply any cross-role
inequality.

For each unordered pair of the five physical roles and each label `l`, emit:

```text
not roleBit(r,l) or not roleBit(s,l)
```

The resulting 180 binary clauses must be proved equivalent to pairwise
distinctness of the five decoded roles and hence to `physicalFive.card = 5`.

When a derived variable `P_l` represents membership of `l` in the physical
five, emit both directions:

```text
not roleBit(r,l) or P_l                         -- for each physical role r
not P_l or roleBit(u,l) or roleBit(v,l) or
  roleBit(xu,l) or roleBit(xv,l) or roleBit(deleted,l)
```

For every decoded support intersection `A ∩ B`, a derived bit `I_l` must be
constrained by all three conjunction clauses:

```text
not I_l or A_l
not I_l or B_l
not A_l or not B_l or I_l
```

Lean must prove `I_l = true ↔ l ∈ decode(A) ∩ decode(B)` before applying an
at-most encoder to the `I_l` variables. This applies to both BI support
intersections and to `deletedCenterRow ∩ physicalFive`. No free or
one-directional intersection witness is accepted.

### 6.3 Direct cardinality clauses

Version 1 will not rely on the one-directional Sinz theorem. It will first add
a generic auxiliary-free subset encoder:

```lean
atMostClauses : List Var -> Nat -> Std.Sat.CNF Nat
atLeastClauses : List Var -> Nat -> Std.Sat.CNF Nat
cardEqClauses : List Var -> Nat -> Std.Sat.CNF Nat
```

The executable v1 implementation canonicalizes the variable universe with
`xs.toFinset.sort (fun a b => a <= b)` and enumerates combinations with
`List.sublistsLen`. Every guard and subtraction uses the deduplicated universe
cardinality. `Finset.toList` is excluded because Mathlib defines it as a
noncomputable choice operation; `Finset.powersetCard` may be used only in
propositional cardinality proofs.

For pairwise-distinct input variables, the required kernel theorems are:

```lean
eval_atMostClauses_iff
eval_atLeastClauses_iff
eval_cardEqClauses_iff
```

The public theorems require `xs.Nodup` and `k ≤ xs.length`. Definitions must
still be total, but no subtraction-based at-least theorem may silently use a
natural-number underflow outside that proved range.

`atMost k` forbids every true subset of size `k + 1`. `atLeast k` requires a
true variable in every subset of size `n - k + 1`. Exact cardinality is their
conjunction. This is larger than a sequential counter but has no auxiliary
counter semantics or missing converse theorem.

For eighteen support bits and cardinality four, the analytic clause count is
`choose(18, 5) + choose(18, 15) = 8,568 + 816 = 9,384` per support. This is a
design count, not a generated formula or performance claim. If the direct
encoding proves impractical, a later version may replace it only after proving
a full Sinz satisfaction iff theorem and revalidating the arm correspondence.

### 6.4 Exact atom map

The common formula mirrors exactly the twelve `Valid` atoms:

1. the two source labels differ;
2. the two actual centers differ;
3. `selectedXvRow.card = 4`;
4. `xv` and `u` lie in that row;
5. `source1` and `source2` lie outside that row;
6. the five physical roles are pairwise distinct, equivalently
   `physicalFive.card = 5`;
7. `deletedCenterRow.card = 4`;
8. `deletedCenter` lies in that row and outside the physical five; and
9. its intersection with the physical five has cardinality at most one.

The numbering groups related clauses but must prove equivalence to all twelve
conjuncts, not merely implication.

Each crossed formula adds exactly the twelve crossed atoms:

- the three support cardinalities;
- deleted absence from all three supports;
- retained membership in all three supports;
- the two source memberships; and
- the negation of the five recomputed incidences' conjunction.

The incidence clause must use role-selected support membership derived from
`actualCenter1`, `actualCenter2`, and `oppApex2`. It may not accept five free
incidence bits.

The BI formula adds exactly the fourteen BI atoms:

- four support cardinalities;
- four named nonmemberships;
- two decoded intersection bounds; and
- the four blocker-derived center separations already present in `Valid`.

## 7. Required exact theorems

The implementation gate is not a clause-count receipt. Lean must prove both
directions separately for each arm:

```lean
valid_extends_to_model :
  p.Valid →
    ∃ sigma, Std.Sat.CNF.eval sigma (armCnf a) = true ∧
      AgreesOnBase sigma (encodeBase p)

model_decodes_to_valid :
  Std.Sat.CNF.eval sigma (armCnf a) = true →
    Nonempty {p : PacketOfArm a // p.Valid ∧ AgreesOnBase sigma (encodeBase p)}
```

The public correspondence theorem is:

```lean
armCnf_sat_iff :
  (∃ sigma, Std.Sat.CNF.Sat sigma (armCnf a)) ↔
    Nonempty {p : PacketOfArm a // p.Valid}
```

In Lean 4.27, `Std.Sat.CNF.Sat` is assignment-indexed; it is not itself an
existential satisfiability predicate. The existential assignment above is part
of the public theorem statement.

Only after all three instances of this theorem build may a SAT model be called
an abstract-packet countermodel or an UNSAT certificate contribute to
`no_valid_abstract_packet`.

The later DIMACS boundary requires a canonical ASCII serializer, a strict
parser, and theorems relating parsed literal numbering and clause evaluation to
`armCnf`. For each arm, Lean or an independently checked boundary must establish:

```text
parse(encode(armCnf, variableMap)) = the canonical formula and map
encode(parse(bytes)) = bytes
DIMACS evaluation under variableMap = armCnf evaluation
```

The parser must fail closed on malformed headers, count mismatches, zero
literals inside clauses, out-of-range variables, missing terminators, duplicate
metadata, trailing payload, and noncanonical whitespace or ordering.

The frozen manifest must bind schema and algorithm versions, base revision,
formula-module and transitive dependency digests, serializer/parser source
digests, variable-map and clause-order digests, variable/clause/literal counts,
raw DIMACS SHA-256, and a structured self-hash. Fresh no-follow reads must
reconstruct the formula and reproduce the bytes exactly; path identity or a
committed receipt alone is not authentication.

## 8. CEGAR refinement rule

A SAT packet is diagnostic evidence about the current finite abstraction, not
a Euclidean realization. Inspect its decoded roles and supports to choose one
new source-derived consequence.

Every refinement must land in this order:

1. prove the new finite consequence from the enriched source alternative;
2. if the consequence needs new data, first extend the abstract packet, its
   source projection, the arm layout, and encode/decode bridge;
3. add it to `Rigid221Card18AbstractPacket.Valid` and repair
   `source_to_abstract_packet`;
4. extend the arm formula; and
5. repair both correspondence directions.

Strengthening only the external formula is forbidden. It would prove UNSAT for
a schema that no longer over-approximates every Lean source packet.

## 9. Symmetry policy

Version 1 performs no symmetry reduction.

- `oppApex2` may alias any common role under current `Valid`.
- The eleven source roles are not all known distinct.
- U/XV exchange changes constructor, deletion orientation, and support roles.
- Source1/source2 exchange also changes actual-center and K1/K2 orientation.

A future normalization must define a permutation action on roles, supports,
constructors, and assignments and prove preservation of `Valid`, formula
evaluation, and encode/decode semantics before fixing any canonical labels.

## 10. Certification and trust

The preferred UNSAT path after correspondence is a Lean-authored CNF with a
kernel-checked zero-RAT replay using the existing checkpointed RUP boundary.
An LRAT or other checker would require a separate review. The existing semantic
boundary does not provide artifact custody or source binding.

Every proof/certificate receipt must bind the arm, exact formula and DIMACS
hashes, variable/clause/literal counts, variable-map and clause-order hashes,
solver and trimming-tool identities, proof bytes, checker configuration, and
the final Lean replay consumer. Formula emission, solver output, certificate
trimming, shard manifests, and final composition remain separately
authenticated stages. No certificate may be replayed against a formula that is
merely extensionally similar or regenerated under a different manifest.

The first implementation may use ordinary kernel reduction for closed helper
tables. It may not use `native_decide`, `Lean.ofReduceBool`, `run_tac`, an
external oracle, `unsafe`, `implemented_by`, or an unapproved custom axiom.

## 11. Commit order

1. Complete: add the typed 288-variable base map, exactly-one role clauses,
   constructive decode, and base roundtrip proofs.
2. Complete: add the generic direct cardinality encoder and its full evaluation
   iff theorems.
3. Complete: add the reduced typed derived layout, direct membership/nonmembership,
   role inequality, physical mask, intersection gadgets, and cardinality
   bridges. Do not define `armCnf` in this checkpoint.
4. Complete: assemble common, BI, and crossed formulas and prove both
   correspondence directions plus `armCnf_sat_iff` for every arm.
5. Complete: add explicit valid BI/U/XV packets and derive formula satisfiability through the
   checked correspondence.
6. Strengthen the live bi-survival source packet by one source-derived relation connecting the two
   fixed-center deletion views.
7. Only after that relation justifies a v2 projection, revise the formula and reconsider a canonical
   DIMACS boundary. Solver execution remains a later gate.

Each commit receives its own lane checkpoint, governed build, declaration-level
axiom audit, independent semantic review, and exact-path staged hygiene.

## 12. Design evidence

- The reuse preflight searched the project Lean corpus at revision
  `467b58a18` and found no generic exact-cardinality CNF evaluation iff theorem.
- The concrete direct-cardinality reuse preflight at `38f6b0ced` again found no
  full generic theorem. `Census554.CoverCnf.sinz_sat` supplies only the
  source-to-satisfying direction, so using it here would leave the future
  model-to-`Valid` direction circularly incomplete.
- The state audit confirmed 288 base variables in every arm and the correct
  U/XV deletion orientation.
- Independent semantic review returned GO after requiring exact role-inequality,
  physical-mask, and intersection gadgets, bounded cardinality theorems, and
  unambiguous internal/DIMACS numbering.
- Independent trust review returned GO for the two-way correspondence gate,
  strict DIMACS readback/custody contract, certificate binding, and CEGAR
  refinement order.
- The later search-base and direct-cardinality checkpoints implement the first
  two kernel layers. A review against revision `78178bc8` confirmed that direct
  membership macros preserve every current `Valid` atom and reduce derived
  allocation to 72 variables for BI and 41 for U/XV.
- The C1 checkpoint implements that reduced typed layout, the direct and typed
  gadgets, the canonical physical-five/cardinality bridge, and generic support
  and derived-family cardinality theorems. Its final ten-import aggregate build,
  focused tests, independent semantic review, and executable-trust review pass.
- The C2 checkpoint implements the frozen common, BI, U, and XV block order,
  proves exact totals of 61,969 clauses for BI and 51,333 for each crossed arm,
  and proves `valid_extends_to_model`, `model_decodes_to_valid`, and the generic
  `armCnf_sat_iff`. Independent semantic and trust review returned GO.
- No DIMACS artifact, model enumeration, certificate, or solver run has been produced. The later
  positive-control checkpoint proves satisfiability for all three v1 formulas in Lean.
- Exact-path staged hygiene passed with zero issues and no foreign staged path.

## 13. Nonclaims

This design does not provide:

- a generated CNF or variable map;
- a serialized geometric source witness;
- an UNSAT result or checked certificate;
- `no_valid_abstract_packet`;
- closure of a BI, U, or XV source alternative; or
- a lift from exact cardinality eighteen to the live unbounded residual.

C2 and the v1 positive controls are complete. The unchanged formulas are checked satisfiable and
remain useful only as diagnostic CEGAR seeds. The next mathematical boundary is a source-derived
relation connecting the two fixed-center views in the live bi-survival rectangle. DIMACS,
enumeration, certificate, and solver gates remain closed unless a justified v2 projection replaces
the current surface.
