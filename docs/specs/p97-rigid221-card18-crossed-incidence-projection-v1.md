# P97 Rigid221 card-18 crossed-incidence projection contract (v1)

**Status: PROJECTION, AXIOM, CUSTODY, AND COVERAGE V2 GATES COMPLETE.**

Lane: `rigid221-card18-crossed-incidence-projection-20260827`.

Lane base: `68de8b1a7e7560e34c5efcc182d41a5190d48b60`.

## 1. Purpose and position in the revised order

`Rigid221Card18LabeledProjection` retains the exact `Fin 18` role labels and
three four-point supports for each crossed arm. The source leaf also retains a
proposition saying that the consumer's five-incidence conjunction does not
hold. It does not, however, expose the five individual incidence values as a
finite source-linked profile.

This checkpoint adds that profile before any Python serializer or solver work.
It implements the W4 consumer boundary from the 2026-08-26 CEGAR audit: the
five cells remain one named source-faithful packet, not five anonymous leaves.
The complete labeled source is retained beside the computed profile.

This is still an internal Lean boundary. It does not create canonical external
bytes, a Python reconstruction theorem, a solver encoding, a model, a
certificate, or a canary authorization.

## 2. Reuse preflight

The bounded current-project search

```text
proof-blueprint search --name '*FiveIncidenceContinuation*' --limit 20
```

found the `RobustApexFiveIncidenceContinuation` family. It is useful only as a
Prop-level structural pattern: it is indexed by a
`RobustApexThreeRowSurface`, carries one failed-membership witness, and does not
provide the five exact `Fin 18` membership values attached to this source.

The indexed corpus also surfaced
`ExactTwelveRigid221FullMembershipPrefixTerminalConsumer` as a broad Boolean
assignment pattern. It is a DIMACS/bank consumer whose proof path uses
`native_decide` and reverted generated evidence. Importing or adapting it
would cross this checkpoint's trust and dependency boundary.

The first missing antecedent in both cases is an exact source-linked `Fin 18`
five-membership profile theorem. This checkpoint supplies that theorem from
the already-exported role labels, support labels, and geometric source
negation. It imports neither prior consumer.

## 3. Exact five-incidence profile

`Rigid221FiveIncidenceProfile` contains exactly five `Bool` fields in the
semantic order used by the checked crossed-row consumer:

1. actual center one belongs to `BO`;
2. the second opposite apex belongs to `K1`;
3. actual center two belongs to `K1`;
4. the second opposite apex belongs to `K2`; and
5. actual center one belongs to `K2`.

For both crossed arms, every field is defined only as

```text
decide (stored role label ∈ stored labeled support)
```

There is no caller-supplied Boolean. The profile defines `allFive` as the
five-way Boolean conjunction and `conjunctionHasFalse` as its negation.

The `xv` arm preserves the single-point deletion
`D.A.erase source.packet.xv`; it must not be described or encoded as a
two-point `{x, v}` deletion. The `u` arm preserves
`D.A.erase source.P.u.1`. Both use the two actual centers, the same selected
supports `K1` and `K2`, and the exact deletion-dependent opposite support `BO`
already stored by the labeled source.

## 4. Kernel-checked source linkage

Ten public `iff` theorems, one for every arm/field pair, identify each Boolean
value with its exact geometric membership. Their proofs use only:

- `LabeledFourSupport.mem_labels_iff`;
- the stored `actualCenter1_point`, `actualCenter2_point`, and
  `oppApex2_point` equalities; and
- the dependent support identities already present in the labeled records.

For each arm, a theorem proves `conjunctionHasFalse = true`. It assumes the
computed conjunction is true, recovers all five geometric memberships through
the ten linkage theorems, and contradicts the corresponding stored
`missingIncidence` field. It does not select an arbitrary missing cell, invoke
an existence theorem, or detour through an unrelated open `False` leaf.

The implementation must contain no `sorry`, `admit`, added `axiom`,
`native_decide`, or `run_tac` evidence.

## 5. Typed projection and arm preservation

The crossed-arm projection records retain:

- the complete original `Rigid221XvDeletionLabeledData` or
  `Rigid221UDeletionLabeledData` value;
- the five-incidence profile;
- an equality proving that the profile is exactly the local computation from
  the retained labeled data; and
- the kernel proof that `conjunctionHasFalse = true`.

Consequently, the profile cannot independently choose an arm, role, center,
support, deletion, survival status, or blocker identity.

The output alternative has exactly three constructors in canonical manifest
order:

```text
BI, U, XV
```

The BI constructor retains `Rigid221BothDeletionsLabeledData` unchanged. The U
and XV constructors retain their complete labeled source through the new
projection records. The total conversion only pattern matches an existing
`Rigid221ExactCardEighteenLabeledAlternative`; it performs no choice and calls
no source existence theorem.

## 6. Predicate-coverage effect

The completed crossed-incidence custody root includes this module, and the
published, freshly attested coverage-v2 manifest binds its declarations. The
source bundle `profile.crossed_missing_incidence` has therefore moved from
`PROP_AVAILABLE_NOT_EMITTED` to finite profile data. It covers exactly these
twelve candidate predicates:

```text
cross.u_deletion.incidence.c1_in_bo
cross.u_deletion.incidence.c1_in_k2
cross.u_deletion.incidence.c2_in_k1
cross.u_deletion.incidence.conjunction_has_false
cross.u_deletion.incidence.opp_apex_2_in_k1
cross.u_deletion.incidence.opp_apex_2_in_k2
cross.xv_deletion.incidence.c1_in_bo
cross.xv_deletion.incidence.c1_in_k2
cross.xv_deletion.incidence.c2_in_k1
cross.xv_deletion.incidence.conjunction_has_false
cross.xv_deletion.incidence.opp_apex_2_in_k1
cross.xv_deletion.incidence.opp_apex_2_in_k2
```

This Lean checkpoint does not mutate the frozen predicate-coverage v1
manifest. Its projection, axiom, custody, and durable coverage-v2 gates are
complete. The twelve-row change is limited to coverage status; it does not
grant source entitlement or any external admission.

Even after this one bundle is upgraded, sixteen Prop-only bundles and all
seven bundles absent from the labeled export remain blockers. In particular,
the cap and cyclic-order tables, selected-row trace, radius/physical links,
K4/minimality projection, parent live facts, and complete bi semantic
projection are not supplied here.

All candidate `source_entitled` flags remain false. All `hard_clause_admission`
flags remain false. Global serializer, solver, and canary admission remain
false.

The remaining bundle counts are not a requirement to project all 188
historical packet predicates. The reviewed next proof-facing consumer is a
pure finite Lean abstraction with a source-to-valid-packet theorem; this
projection supplies its crossed-incidence input without serializing the
noncomputable geometric source.

## 7. Acceptance gates

This checkpoint is complete only after:

1. the governed target build of
   `Rigid221Card18CrossedIncidenceProjection` succeeds;
2. a source scan confirms the absence of forbidden proof mechanisms;
3. declaration-level axiom reports for both per-arm missing-incidence theorems
   and the total conversion contain no `sorryAx` or native/external evidence;
4. independent review checks all ten Boolean-to-geometric mappings, both
   stored-negation proofs, record provenance, and BI/U/XV association;
5. a new isolated custody checkpoint re-mines and authenticates the exact
   kernel dependency set rooted at this module;
6. a revised coverage checkpoint binds the new custody and declarations while
   preserving all remaining blockers; and
7. the lane's staged hygiene gate passes for its exact owned paths.

Passing the Lean build alone does not authenticate source bytes or upgrade the
frozen coverage manifest. Passing all gates still does not authorize a Python
serializer, a solver run, or a canary. `CANARY AUTHORIZED` remains false.

## 8. Checkpoint evidence

On 2026-08-27:

- the governed target build completed all 11,031 jobs;
- the focused source scan found no `sorry`, `admit`, added `axiom`,
  `native_decide`, `run_tac`, `Lean.ofReduceBool`, direct `Classical.choice`,
  or direct `Classical.choose` in this module;
- `proof-blueprint axioms` on both per-arm `conjunctionHasFalse` theorems and
  the total alternative conversion reported only `propext`,
  `Classical.choice`, and `Quot.sound`, inherited through the imported source
  chain;
- the durable axiom receipt is 2,266 bytes with file SHA-256
  `604059c92e9ea71affd44ba2e4d0026da07afb185c824eed7954cdd7760cbf2f`
  and canonical body self-hash
  `f5d2b07cdbddb4fb4d6448f5bcc52ec7e8411659f8512676b4c0e311f5b83e52`;
- independent review returned **GO** for all ten semantic mappings, exact
  deletion identities, both stored-negation proofs, projection provenance,
  canonical BI/U/XV association, and the no-authorization language; and
- both owned files have no line longer than 100 characters.

Fresh source custody now exists for this root and has passed its local and
durable gates. The isolated coverage-v2 artifact also passes canonical
readback, fresh live attestation, and independent review. No historical
receipt expands that result, and source entitlement, serialization, solver,
and canary admission remain false.
