# Math-skeptic report: adaptive equality-core collision witness

Date: 2026-09-03
Target: `docs/audits/2026-09-03-rigid221-exactfive-hard-source-swap-adaptive-equality-core-collision-witness.md`
Base commit supplied for drift review: `d17914da70d555c2faafff9086b9b9a94fa94c53`

## Verdict

**CERTIFIED — label accuracy only.**

The target's `PROVEN` label is justified for exactly this statement: the two
fixed 13-generator ideals over `QQ`, with their displayed anchors, are proper
and each has a real common zero. The proof is the explicit collision witness,
not either timed-out Singular computation. The target correctly withholds every
source-realization, class-distinctness, strict-convexity, Lean, promotion, and
closure conclusion. The `B–O` gauge remains `CONJECTURED next work`.

There are no blocking findings. Certification follows the complete claim audit
below; it does not certify a source bridge or a Lean theorem.

## Evidence and audit method

- The two retained inputs are
  `scratch/runs/exactfive-hard-source-swap-adaptive-equality-core-20260903/run-0001/artifacts/target-gauge-z3/script.sing`
  and
  `scratch/runs/exactfive-hard-source-swap-adaptive-equality-core-20260903/run-0001/artifacts/target-gauge-cvc5/script.sing`.
  Their generators occur at lines 2–14 of each file.
- Independent canonical-JSON hashing of the ordered polynomial arrays returned
  `ee542a9066f8367de4aa877d3464925afdbe988ebee00ee0b7e41a502ec1c7bf`
  and
  `1f6d2bead88912f000514f1100988e0e9cca38613ff4e56c8da348ffc944b4e1`,
  matching the target at lines 16–17 and the pinned constants in
  `census/card_head/exactfive_hard_source_swap_adaptive_equality_core_collision_witness.py:50–57`.
- The focused test command completed with `27 passed in 0.64s`. In particular,
  the test asserts all 26 zero remainders at
  `census/card_head/tests/test_exactfive_hard_source_swap_adaptive_equality_core_collision_witness.py:41–54`,
  both anchor pairs at lines 57–64, assignment collisions at lines 67–95,
  mutation rejection at lines 98–170, AST rejection at lines 186–214, and CLI
  behavior at lines 217–245.
- A no-solver verbose checker invocation returned `generator_checks: 26`, the
  two expected anchor pairs, one unique remainder value `(0,0)`, and false
  flags for source realization, distinctness, convexity, Lean statement, Lean
  proof, and promotion. The implementation of those checks is at
  `census/card_head/exactfive_hard_source_swap_adaptive_equality_core_collision_witness.py:493–563`.
- No solver was run during this audit. The two upstream result audits record
  only target timeouts and no mathematical verdict at
  `docs/audits/2026-09-03-rigid221-exactfive-hard-source-swap-adaptive-equality-core-run-0001.md:16–22,35–40,64–68`
  and
  `docs/audits/2026-09-03-rigid221-exactfive-hard-source-swap-adaptive-equality-core-modular-prefilter-run-0001.md:16–28,36–41,65–70`.
- The target and its checker/test/wrapper are absent at the supplied base
  commit. Thus every target claim is new relative to that base; there is no
  pre-existing label whose upgrade could be accepted without new evidence.

## The 26 generator evaluations

Let

```text
P = (0,0),   R = (1,0),   T = (1/2,z),   z^2 = 3/4.
```

The assignment at
`census/card_head/exactfive_hard_source_swap_adaptive_equality_core_collision_witness.py:301–313`
puts `c000,c002` at `P`, `c001,c007,c008,c010` at `R`, and
`c003,c004,c005,c006,c009` at `T`. If `d` denotes squared distance, exact
arithmetic gives

```text
d(P,P)=d(R,R)=d(T,T)=0,
d(P,R)=1,
d(P,T)=1/4+z^2=1,
d(R,T)=1/4+z^2=1.
```

Every retained generator is therefore a difference of two entries with the
same value. The following table enumerates all 26, rather than inferring them
from the checker's aggregate count. A displayed scalar zero is the quotient
pair remainder `(0,0)`.

| Gauge and generator | Exact retained source | Evaluation | Remainder |
|---|---|---:|---:|
| `z3`, `p1` | `target-gauge-z3/script.sing:2` | `d(R,T)-d(R,T)=1-1` | `(0,0)` |
| `z3`, `p2` | `target-gauge-z3/script.sing:3` | `d(R,T)-d(R,P)=1-1` | `(0,0)` |
| `z3`, `p3` | `target-gauge-z3/script.sing:4` | `d(R,T)-d(R,T)=1-1` | `(0,0)` |
| `z3`, `p4` | `target-gauge-z3/script.sing:5` | `d(R,T)-d(R,P)=1-1` | `(0,0)` |
| `z3`, `p5` | `target-gauge-z3/script.sing:6` | `d(P,R)-d(P,T)=1-1` | `(0,0)` |
| `z3`, `p6` | `target-gauge-z3/script.sing:7` | `d(P,R)-d(P,T)=1-1` | `(0,0)` |
| `z3`, `p7` | `target-gauge-z3/script.sing:8` | `d(P,R)-d(P,T)=1-1` | `(0,0)` |
| `z3`, `p8` | `target-gauge-z3/script.sing:9` | `d(P,R)-d(P,T)=1-1` | `(0,0)` |
| `z3`, `p9` | `target-gauge-z3/script.sing:10` | `d(P,R)-d(P,R)=0` | `(0,0)` |
| `z3`, `p10` | `target-gauge-z3/script.sing:11` | `d(P,R)-d(P,R)=0` | `(0,0)` |
| `z3`, `p11` | `target-gauge-z3/script.sing:12` | `d(P,T)-d(P,T)=1-1` | `(0,0)` |
| `z3`, `p12` | `target-gauge-z3/script.sing:13` | `d(P,T)-d(P,T)=1-1` | `(0,0)` |
| `z3`, `p13` | `target-gauge-z3/script.sing:14` | `d(P,T)-d(P,R)=1-1` | `(0,0)` |
| `cvc5`, `p1` | `target-gauge-cvc5/script.sing:2` | `d(R,T)-d(R,T)=1-1` | `(0,0)` |
| `cvc5`, `p2` | `target-gauge-cvc5/script.sing:3` | `d(R,T)-d(R,P)=1-1` | `(0,0)` |
| `cvc5`, `p3` | `target-gauge-cvc5/script.sing:4` | `d(R,T)-d(R,T)=1-1` | `(0,0)` |
| `cvc5`, `p4` | `target-gauge-cvc5/script.sing:5` | `d(R,T)-d(R,P)=1-1` | `(0,0)` |
| `cvc5`, `p5` | `target-gauge-cvc5/script.sing:6` | `d(P,R)-d(P,T)=1-1` | `(0,0)` |
| `cvc5`, `p6` | `target-gauge-cvc5/script.sing:7` | `d(P,R)-d(P,T)=1-1` | `(0,0)` |
| `cvc5`, `p7` | `target-gauge-cvc5/script.sing:8` | `d(P,R)-d(P,T)=1-1` | `(0,0)` |
| `cvc5`, `p8` | `target-gauge-cvc5/script.sing:9` | `d(P,R)-d(P,T)=1-1` | `(0,0)` |
| `cvc5`, `p9` | `target-gauge-cvc5/script.sing:10` | `d(P,R)-d(P,R)=0` | `(0,0)` |
| `cvc5`, `p10` | `target-gauge-cvc5/script.sing:11` | `d(P,R)-d(P,R)=0` | `(0,0)` |
| `cvc5`, `p11` | `target-gauge-cvc5/script.sing:12` | `d(P,T)-d(P,T)=1-1` | `(0,0)` |
| `cvc5`, `p12` | `target-gauge-cvc5/script.sing:13` | `d(P,T)-d(P,T)=1-1` | `(0,0)` |
| `cvc5`, `p13` | `target-gauge-cvc5/script.sing:14` | `d(P,T)-d(P,R)=1-1` | `(0,0)` |

In every row the two displayed squared distances have the same exact value;
the nonzero distances are all `1`. This table also independently checks the checker's loop at
`census/card_head/exactfive_hard_source_swap_adaptive_equality_core_collision_witness.py:516–541`.

## Quotient, real point, and properness

The target sentence at
`docs/audits/2026-09-03-rigid221-exactfive-hard-source-swap-adaptive-equality-core-collision-witness.md:19–28`
is: “The checker evaluates all 26 actual generator strings with a closed AST
whitelist and exact arithmetic in `K = Q[z]/(4 z^2 - 3)`.” This is accurate.
Because `4` is a unit in `Q`, division by `z^2-3/4` gives a degree-below-two
representative `a+bz`; the multiplication formula at
`census/card_head/exactfive_hard_source_swap_adaptive_equality_core_collision_witness.py:164–171`
is precisely reduction by `z^2=3/4`. The code checks the modulus at lines
215–237 and restricts parsed expressions to integer literals, names,
`+,-,*`, and bounded literal powers at lines 241–298.

The target sentence at lines 61–66 is: “The polynomial `4 z^2 - 3` has the two
real roots `z=√3/2` and `z=-√3/2`: squaring either root gives `3/4`, so
substitution gives `4(3/4)-3=0`.” This is correct. Substitution of either root
defines a real evaluation of every displayed coordinate. The 26 zero quotient
remainders above therefore become 26 zero real values.

The next target sentence is: “A common zero prevents `1` from belonging to the
target ideal.” This is correct for each ideal in the characteristic-zero rings
declared at line 1 of the two retained `script.sing` files: evaluation at the
real point sends every generator, hence every ideal element, to zero, while it
sends `1` to `1`. Thus `1` is outside each ideal and each ideal is proper. No
irreducibility or field claim about the quotient is needed for this direction.

## Exhaustive target-claim inventory

Each item quotes the target exactly and gives an explicit label judgment.

1. **Result claim.** Target `:5–6`: “**PROVEN:** the 13-polynomial equality core
   is proper and has a real solution under each of the two authenticated affine
   gauges.” **Accurately PROVEN.** The 26-row calculation and evaluation-map
   argument above establish the claim for the exact scripts. Authentication is
   enforced by source, terminal, context, request, polynomial, and artifact
   checks at checker lines 344–475.

2. **Equality-only scope.** Target `:6–7`: “This is a result only about the
   equality core. It is not a source realization.” **Accurate.** The producer
   omits signed areas, radius disequality, source strict inequality,
   distinctness saturation, and source realization at
   `census/card_head/exactfive_hard_source_swap_adaptive_equality_core_piqd.py:100–106,650–659`.

3. **Custody reconstruction.** Target `:9–11`: “The exact checker imports the
   completed characteristic-zero producer, reads its immutable terminal and
   target artifacts, and reconstructs the two authenticated target polynomial
   lists.” **Accurate.** See checker lines 24–26, 412–475 and producer lines
   596–664,759–830.

4. **No transport.** Target `:11–12`: “It never calls the producer's
   transport-capable run entry point.” **Accurate.** Reconstruction calls
   `build_target_query` and `_validate_query_artifact` at checker lines 457–464,
   not `run_diagnostic`; the explicit mutation guard is tested at focused-test
   lines 134–159.

5. **Fail-closed completed tree.** Target `:12`: “A missing or incomplete
   completed tree is an error.” **Accurate.** Regular-file, terminal-hash,
   terminal-schema, manifest-context, and artifact validation occur at checker
   lines 91–125 and 412–471; missing-tree failure is tested at focused-test
   lines 150–159.

6. **Local artifact replay.** Target `:12–14`: “Each existing target artifact
   is replayed locally against the rebuilt query.” **Accurate in the project's
   custody sense.** Exact script bytes and source context are compared at
   producer lines 759–781, and the terminal must match replayed records at
   checker lines 461–471. This does not rerun Singular.

7. **Polynomial hashes.** Target `:14–17`: “Their ordered polynomial hashes are
   [the two displayed digests].” **Accurate.** Independent recomputation matched
   both digests; checker lines 50–57 and 379–408 fail closed on drift.

8. **Exact checker coverage and parser.** Target `:19–24`: “The checker evaluates
   all 26 actual generator strings with a closed AST whitelist and exact
   arithmetic in `K = Q[z]/(4 z^2 - 3)`.” **Accurate.** Parser and arithmetic are
   at checker lines 134–212 and 241–298; exact coverage is at lines 516–541 and
   is independently enumerated above.

9. **No unsafe or numeric evaluation.** Target `:26`: “No call to `eval`,
   `exec`, a numeric solver, or floating arithmetic is present.” **Accurate for
   this checker and its witness path.** The parser recursively interprets the
   whitelisted AST; the arithmetic values are `Fraction`s. The focused AST scan
   at test lines 206–214 rejects `eval`/`exec`, and reconstruction is the
   no-transport path described in item 4.

10. **Pair multiplication and modulus.** Target `:27–28`: “The pair
    representation `a + b z` reduces each multiplication with `z^2 = 3/4`. The
    declared modulus has degree two and reduces to zero in `K`.” **Accurate.**
    See checker lines 134–171 and 215–237 and focused-test lines 20–38.

11. **Witness-label definitions.** Target `:32–37`: “For the witness display,
    write [the eleven displayed label-to-class assignments].” **Accurate as a
    definition.** The complete map is checker lines 314–326 and test lines
    67–80.

12. **Separation from source-role names.** Target `:39–40`: “These uppercase
    witness labels name quotient classes; they are separate from the producer's
    lower-case source-role fields.” **Accurate.** The artifact class map records
    source roles separately, while checker lines 314–326 introduce display-only
    labels. In particular, display `B` denotes `c000`, whose source roles are
    `U,c1`; it is not asserted to be a pre-existing source-role field.

13. **Common assignment.** Target `:40–54`: “The common assignment is [the
    displayed three-location assignment]” and “In class IDs, this is [the
    displayed assignment].” **Accurate.** Checker lines 301–334 and test lines
    81–95 match every coordinate.

14. **Anchors.** Target `:56–58`: “The first target pins `c000=(0,0)` and
    `c010=(1,0)`. The second pins `c000=(0,0)` and `c008=(1,0)`. Thus the same
    assignment satisfies both anchor pairs.” **Accurate.** The pinned pairs are
    checker lines 70–73,517–521 and are tested at test lines 57–64.

15. **Zero remainders.** Target `:58–59`: “Every one of the 13 reconstructed
    generators in each target has exact remainder `(0,0)` in the pair
    representation.” **Accurately PROVEN.** See the complete 26-row table.

16. **Real roots.** Target `:61–62`: “The polynomial `4 z^2 - 3` has the two
    real roots `z=√3/2` and `z=-√3/2`: squaring either root gives `3/4`, so
    substitution gives `4(3/4)-3=0`.” **Accurately PROVEN** by direct arithmetic.

17. **Real common zeros.** Target `:63–64`: “Applying either root to the
    quotient assignment gives a real common zero of each equality target.”
    **Accurately PROVEN.** The root substitution carries each quotient zero in
    the 26-row table to real zero.

18. **Proper ideals.** Target `:64–66`: “A common zero prevents `1` from
    belonging to the target ideal. This proves equality-core real feasibility
    and ideal properness without depending on the timed-out Singular target
    computations.” **Accurately PROVEN.** The evaluation-map argument is given
    above; the two run audits cited in the evidence section establish that the
    Singular results supplied no verdict used here.

19. **Collision description.** Target `:70–75`: “The witness succeeds by
    collision. In source-role names, its additional coordinate identifications
    include [the three displayed groups].” **Accurate.** The retained class map
    gives `c000={U,c1}`, `c002={c2,q}`, `c001={O}`, `c007={u}`,
    `c008={v}`, `c010={y}`, `c003={a}`, `c004={d}`, `c005={p,s}`,
    `c006={t,e}`, and `c009={x}`; checker lines 301–313 then put exactly the
    listed groups at common locations.

20. **Three locations and failed geometry.** Target `:77–79`: “Consequently
    eleven quotient classes occupy only three geometric locations. The omitted
    source-required distinctness conditions fail, and strict convex orientation
    cannot hold for this collapsed configuration.” **Accurate.** The assignment
    partitions the eleven class IDs into blocks of sizes 2, 4, and 5. Distinct
    class IDs collide, and any strict orientation system for eleven labeled
    points is impossible when multiple labels have identical coordinates. The
    equality-core specification explicitly lists all distinctness saturation
    and 165 signed-area inequalities as omitted at
    `docs/specs/p97-exactfive-hard-source-swap-adaptive-equality-core-v1.md:61–72`.

21. **No stronger conclusion.** Target `:79–81`: “The witness therefore does
    not establish source realization, distinctness, convexity, a Lean statement,
    a Lean proof, or promotion. All six of those claims remain false.”
    **Accurate as claim-status language.** The checker writes those six false
    flags at lines 554–563. The sentence does not assert that no relevant Lean
    statement could ever be written; it states correctly that this witness
    supplies none.

22. **Required future constraints.** Target `:83–87`: “Future source-facing
    computation must add the required noncollision conditions and orientation
    constraints. For real coordinates, a squared-distance nonvanishing condition
    excludes a collision; the exact source ledger must say which pairs are
    required. Signed-area conditions must then enforce the intended strict
    orientation. A positive equality-only witness cannot bypass either gate.”
    **Accurate boundary statement.** Over real coordinates, squared distance is
    zero exactly when both coordinate differences are zero. The producer's
    omission ledger at producer lines 100–106 shows that neither those factors
    nor signed-area inequalities are in this ideal.

23. **Collision-stratum substitution.** Target `:91–102`: “**PROVEN
    bookkeeping reduction, limited to this collision stratum:** use the `z3`
    gauge and substitute [the displayed coordinates] ... The remaining ring
    coordinates are exactly those of `c003,c004,c005,c006,c009`, hence ten
    variables.” **Accurately PROVEN.** The `z3` ring has 18 variables at retained
    script line 1. Substituting the coordinates of `c001,c002,c007,c008` removes
    eight coordinates and leaves the five named two-coordinate classes.

24. **Five polynomial identities.** Target `:101–106`: “Number the original 13
    target generators in their producer order as `p1,...,p13`. Direct
    substitution gives `p4=p2`, `p8=p5`, `p9=0`, `p10=0`,
    `p13=p11-p7`.” **Accurately PROVEN.** Reading retained `z3` script lines
    2–14 after the displayed substitution gives the first four identities
    literally. For the last,
    `p11=||c004||^2-||c006||^2` and
    `p7=1-||c006||^2`, so `p11-p7=||c004||^2-1=p13`.

25. **Eight generators.** Target `:108–112`: “Therefore the substituted ideal
    is generated by the eight retained images `p1,p2,p3,p5,p6,p7,p11,p12`.”
    **Accurately PROVEN.** The five identities in item 24 express every removed
    image as zero, a retained image, or a linear combination of retained images;
    the retained eight are images of original generators, so both ideal
    containments follow.

26. **Reduction scope.** Target `:114–117`: “This reduction is safe for
    replaying or studying the displayed collision stratum: every removed image
    is zero or an explicit combination of retained images. It is not a reduction
    of the distinct source problem because its substitutions impose the
    collisions that source-facing work must exclude.” **Accurate.** Item 24
    proves the first sentence; the assignment collisions and omitted-ledger
    evidence prove the scope warning.

27. **Conjectured gauge.** Target `:121–123`: “**CONJECTURED next work:** a
    `B–O` source-facing gauge, using classes `c000` and `c001` in the display
    above, may be a better normalization because this relaxed witness already
    places them at distinct locations.” **Correctly CONJECTURED.** The last
    clause is established by the assignment, but “may be a better
    normalization” is explicitly not upgraded to a result.

28. **Gauge prerequisites.** Target `:123–126`: “Before using that gauge, the
    formal source layer must prove that the intended source points satisfy
    `B ≠ O` and that the normalization preserves every live source configuration
    under review.” **Accurate as an obligation, not a claimed theorem.** Nothing
    in the checker supplies either source-facing bridge.

29. **Next-work boundary.** Target `:126–127`: “The proposed gauge is a
    direction for the next faithful encoding, not a conclusion of this
    checker.” **Accurate.** It matches the checker docstring at checker lines
    1–6 and false claim flags at lines 554–563.

30. **Default CLI behavior.** Target `:131–135`: “The checker is silent on
    success: [the displayed command].” **EMPIRICALLY VERIFIED within the focused
    test.** The wrapper calls `witness.main()` at
    `scripts/check_exactfive_hard_source_swap_adaptive_equality_core_collision_witness.py:1–8`;
    checker lines 571–582 print only on error or `--verbose`, and test lines
    217–232 cover both successful modes.

31. **Verbose/error CLI behavior.** Target `:137–139`: “Pass `--verbose` for one
    canonical JSON record containing the two anchor checks, all 26 zero
    remainders, source hashes, the modulus check, and explicit false claim flags.
    Errors are always printed to standard error.” **EMPIRICALLY VERIFIED within
    the focused test and no-solver checker invocation.** The payload fields are
    constructed at checker lines 542–563; output/error branches are lines
    571–582; focused tests are lines 217–245.

## Lean, `sorry`, and promotion dependency audit

There is **no hidden Lean or `sorry` dependency in the certified claim**.

The actual dependency path for the result is:

```text
two retained characteristic-zero polynomial lists
  -> authenticated reconstruction by Python
  -> explicit quotient assignment
  -> 26 exact substitutions
  -> either real root of 4z^2-3
  -> real common zero
  -> proper ideal over QQ.
```

No node in that path names, imports, builds, or consumes a Lean declaration.
The checker imports only the Python equality-core producer at checker lines
24–26; that producer constructs the 13 strings from class/row records at
producer lines 551–664. The producer itself says that it makes no mathematical,
source, Lean, or promotion claim at producer lines 1–6 and carries false Lean
flags at lines 88–99. Accordingly there is no Lean theorem consumer whose
transitive axiom closure could hide `sorryAx`, and there is no Lean ingress
binding or publication claim to audit.

A stronger source or closure statement would have an open bridge, but the
target does not make it. The upstream order/equality specification records that
Lean does not yet prove the alias profiles exhaust all live source instances and
therefore withholds live closure and theorem promotion at
`docs/specs/p97-exactfive-hard-source-swap-order-piqd-v1.md:7–22`. The equality
specification separately withholds source realization, a Lean statement/proof,
and promotion at
`docs/specs/p97-exactfive-hard-source-swap-adaptive-equality-core-v1.md:8–18,61–72`.
Those are explicit non-dependencies for the narrow result and explicit blockers
for any later lift.

## Final label table

| Claim family | Target label/status | Skeptic result |
|---|---|---|
| Two fixed equality ideals have real points and are proper | `PROVEN` | `PROVEN` |
| 26 quotient evaluations | exact-zero claim | `PROVEN`, enumerated above |
| Collision-stratum eight-generator reduction | `PROVEN bookkeeping reduction` | `PROVEN` |
| Source realization | false/withheld | correctly withheld |
| Class distinctness and strict convexity | false for this witness | correctly rejected |
| Lean statement, Lean proof, promotion, closure | absent/withheld | correctly withheld; no hidden `sorry` edge |
| `B–O` source-facing gauge | `CONJECTURED next work` | correctly conjectured |
| CLI/test behavior | operational claim | `EMPIRICALLY VERIFIED` |
