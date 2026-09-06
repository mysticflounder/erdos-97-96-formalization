# Native-bank replacement audit

Date: 2026-09-05. Repository lane base: `7a54ca3f9e9f10398de1b3e63729abd66125b3ec`.

This audit asks which general mathematical arguments can replace the repository's
`native_decide` computations. It does not change a proof, refresh a frozen bank,
or certify a Prove2Me transfer. Source references describe the inspected working
tree; the inventory records content hashes because other lanes are active.

## Scope and evidence

The accompanying `native-bank-inventory.json` and `audit_native_banks.py` define
the reproducible census scope and distinguish token occurrences from proof
dependencies. A token count is not a count of independent mathematical claims.

The completed `--scope all` census (23:51 UTC) scanned **24,774 available tracked
Lean files**, including generated sources. One tracked file was absent:
`scratch/B1EndpointProducerFiniteCountermodel.lean`. It is recorded rather than
silently treated as a file without native calls. Untracked files and `.lake`
dependencies are outside this census.

| Scope | Scanned files | Files containing native tokens | Native token sites |
| --- | ---: | ---: | ---: |
| Main first-party `lean/` (including generated, excluding `lean/scratch`) | 6,496 | 2,549 | 5,035 |
| `lean/scratch` | 97 | 2 | 2 |
| Tracked attic archive | 11,795 | 11,755 | 368,006 |
| Tracked repository scratch | 6,364 | 223 | 5,377 |
| Other tracked roots, including the Prove2Me packet | 22 | 0 | 0 |
| Total available tracked files | 24,774 | 14,529 | 378,420 |

The complete file-level inventory includes hashes, site counts, line locations,
and path-based family labels. Indexed declaration names are attached only when
the source hash matches the index. These names are navigation aids, not newly
elaborated theorem spans. Historical/scratch copies are not deduplicated across
paths; do not add their totals to a count of live proof obligations.

Largest families in the **main first-party** tree:

| Family | Native-bearing files | Native sites | Initial assessment |
| --- | ---: | ---: | --- |
| `ATail/CardElevenUniqueFourCertificate` | 1,128 | 1,331 | Replay instances, geometric clause production, and ledger agreement |
| `ATail/FrontierLiveClosure` | 549 | 767 | Mixed generated/replay leaves and frontier refinements; not one mathematical bank |
| `EndpointCertificate/ShadowSearchShards` | 124 | 480 | Finite shadow search/classification; coverage needs a structural replacement |
| `ATail/BlockerVExactSeventeenSixteenthModelRefinements` | 1 | 224 | Many finite refinement checks in one module |
| `SurplusCertificate/RelaxedSplit` | 137 | 141 | Polynomial identities and aggregate checks |
| `SurplusCertificate/RowZeros` | 137 | 137 | Rule/mask alignment and semantic zero assignments |
| `EndpointCertificate/Patterns` | 118 | 118 | Concrete polynomial identity payloads and aggregate checks |

This is a complete lexical inventory of the stated available tracked scope, with
a targeted mathematical review of the principal families. It is not a completed
proof-by-proof analysis of all 378,420 historical and current occurrences.

The repository allows `Lean.ofReduceBool` and `Lean.trustCompiler` in
`.blueprint.toml`. Removing them is a stronger trust requirement than the current
project's. A theorem quantified over arbitrary finite point sets can still depend
on a fixed finite certificate and native evaluation. Generality of its statement
does not establish that its proof avoids native computation.

The cached blueprint index has 70,413 source declarations and 308,079 dependency
edges. Its mine timestamps range from September 1 to September 5, 06:48 UTC. A
read-only transitive query found 41,759 reachable symbols from
`Problem97.erdos97_rhs` and 41,768 from `Problem96.erdos96_rhs`. Those are cached
discovery results, not fresh source/olean consistency or trust audits. There are
no cached final-root axiom records. The configured mining exclusions also omit
detailed generated EndpointCertificate and SurplusCertificate internals. We must
not infer native independence from a missing edge.

## First concrete replacement: finite-set partition counting

**Package-1 replacement complete and validated.**

Before package 1, both `BlockerVExactFifteenFourRowCoverage.outsideHits_card_eq_two` and
`BlockerVExactSixteenFourRowCoverage.outsideHits_card_eq_two` used
`native_decide +revert` to prove this fact about an arbitrary Boolean row:

- the row has four members;
- it contains two specified distinct members of the long cap;
- it contains at most two members of that cap;
- therefore its outside slice has two members.

The repository already contains a proof for arbitrary types:

```lean
Problem97.ATailBlockerVExactSeventeenSourceNormalForm.outsideSlice_card_eq_two
    {α : Type*} [DecidableEq α]
    (support cap : Finset α) (a b : α)
    (hsupport : support.card = 4)
    (hcap : (support ∩ cap).card ≤ 2)
    (ha : a ∈ support ∩ cap) (hb : b ∈ support ∩ cap)
    (hab : a ≠ b) : (support \ cap).card = 2
```

Its body, at `BlockerVExactSeventeenSourceNormalForm.lean:640`, proves the two
specified points form a subset of the intersection, then uses
`Finset.card_sdiff_add_card_inter` and `omega`. No finite search occurs in that
body. This was found by an indexed corpus search for the outside-hit cardinality
statement, rather than by constructing another duplicate lemma.

The general mathematical statement behind it is:

> For finite sets S, C, T, if |S| = r + s, T ⊆ S ∩ C, |T| = r, and
> |S ∩ C| ≤ r, then |S ∖ C| = s.

**Complete finite-set argument:** subset monotonicity gives r ≤ |S ∩ C|, hence
|S ∩ C| = r. The disjoint decomposition S = (S ∩ C) ∪ (S ∖ C) gives
r + s = r + |S ∖ C|. Cancellation gives the conclusion. This is a proof on paper;
the more general r,s statement has not been added to Lean in this audit.

**Exact adapters, now discharged:** `support` is the Boolean row's filtered universe
and `cap` is the labels satisfying `longLabelBool`. For each of the four rows, the
two fixed labels are distinct and lie in that cap. The proofs establish that
`outsideLabel` is injective and maps `outsideHits` onto `support \ cap`, then
transport cardinality through that map. The six-label and seven-label tables use
only small label facts, not a search over arbitrary row membership functions.

**Consumers:** each `outsidePairOfMembership` uses this cardinality theorem;
`false_of_positionEmbedding_membershipRows` then feeds the exact-15/exact-16
branches of `ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean` (cached dependency
edges, also visible in source). Package 1 extracted the counting proof to the
shared `P97/FiniteRowCardinality.lean` module.

**Package-1 result:** the two native proof sites were replaced with one reusable counting
argument and explicit label adapters. The package-2 exact-15 classifier pilot has since
replaced `exists_metricMotif_of_pairwiseSeparated` with a core-only structural proof;
see the [exact-15 coverage audit](../docs/audits/2026-09-05-native-exact15-coverage.md).
The exact-16 classifier remains a separate native dependency.

## General coverage argument already present

`ATailBlockerVExactSeventeenSourceNormalForm.unused_or_exactCover` at line 672
proves that four two-point slices of an eight-point outside set either omit a
point or give an exact partition. Its proof uses incidence multiplicity, not a
search over all supports.

The same argument works for any finite family of subsets Sᵢ ⊆ O with
Σᵢ |Sᵢ| = |O|: either some point of O is absent from every Sᵢ, or every point of O
belongs to exactly one Sᵢ. If no point is absent, every multiplicity is at least
one; their sum equals the number of points, so each multiplicity is one.

This is a complete counting argument on paper and an existing special-case Lean
proof. A future generalized Lean statement must use a finite index type or
finite index set explicitly. It is useful for source coverage and relabeling,
but the audit has not identified a native contradiction theorem that follows
from this counting fact alone. Do not count it as a bank removed.

## Structural metric candidates versus finite classification

The exact-15 and exact-16 banks dispatch their finite patterns to the already
cardinality-independent theorems in `ATail/KalmansonThreeEqualitySchemas.lean`
and `ATail/KalmansonFourEqualitySchemas.lean`. For example, six distinct vertices
in increasing CCW order cannot satisfy all three equalities

```text
d(0,1) = d(0,3), d(4,1) = d(4,2), d(5,2) = d(5,3).
```

The source theorem
`CapCrossingKalmansonBridge.false_of_six_ccw_three_shell_equalities_013_412_523`
derives three strict quadrilateral inequalities and combines them with these
equalities using `linarith`. The ambient number of polygon vertices is arbitrary.

The exact-15 classifier pilot now has a core-only combinatorial argument about cyclic
separation of four two-point outside supports. This proves the finite coverage
statement while leaving its geometric motif dispatch explicit. The corresponding
exact-16 classifier remains a candidate research task: its proof must establish
that the same admissibility hypotheses force one of the existing metric motifs.
Existing metric contradictions do not prove that coverage statement. Neither
enlarging the outside set nor dropping a cyclic-order hypothesis is justified by a
bounded classifier.

The former exact-15 implementation specified `2 * 15^4` patterns; its current
structural proof no longer enumerates that search space. The exact-16 source still
specifies `2 * 7 * choose(7, 2)^4`. These counts describe encoded search spaces,
not numbers of geometrically realizable configurations.

## Card-eleven SAT/replay banks

The cached export graph reaches 2,060 indexed files under
`ATail/CardElevenUniqueFourCertificate`. This makes that family important for
trust removal, but a large file count does not mean 2,060 independent geometric
lemmas.

The coordinator splits the eleven-point exact-four residual into direct/reflected
P4 exact-two, P5 exact-two, and aligned-P5 cases. Its production consumer is
`ATailCardElevenUniqueFourCertificate.false_of_firstApexUniqueRadiusExactFourResidual`.
The residual includes minimality, absence of M44, an exact four-point radius class,
uniqueness of that radius, obstruction by every class member, and interior/bisector
conditions. Removing those hypotheses would be a new mathematical problem.

There are at least three different kinds of work inside this family:

1. **Geometric clause production.** Radius partitions, mutual transport, cyclic
   alternation and Kalmanson conditions already have mathematical soundness
   arguments. Those are the right objects to mine for smaller contradictory cores.
2. **Data agreement.** `P4FullLedgerSatisfaction.lean:128–148` natively checks a
   19,048-clause length and two normalized-membership directions. Line 196 checks
   a literal-index bound. Structural list construction and bounded encoding lemmas
   could remove such checks; this is proof engineering, not a new geometric result.
3. **Instance refutation.** Compact replay-window checks prove specific encoded
   formulas unsatisfiable. General replay soundness is already proved in
   `Certificate/CheckpointedRupCompactBoundary.lean`, conditional on successful
   replay. Reusing that theorem does not prove its success premise without native
   computation.

**Unresolved replacement:** find a geometric/cyclic-order contradiction covering
each of the coordinator's terminals with its actual hypotheses, or extract a
smaller symbolic contradiction from the clause core. A direct proof for one
terminal can retire its whole replay subtree; no such new terminal proof is
claimed here. If no structural argument is found, kernel-checkable replay remains
a separate fallback, not the requested mathematical generalization.

## Endpoint and surplus all-cardinality wrappers

The previous bank registry already records all-cardinality contradiction consumers:

- `EndpointCertificate.Variables.false_of_endpointShadowInBank_of_metricShadow`;
- `SurplusCertificate.RelaxedSplit.Bank.RowZeros.false_of_shadowInBank_of_metricShadow`.

Their hypotheses include membership in a particular finite bank. The historical
trust audit reports native dependencies. These statements are not replacements
for those dependencies: their proofs consume the banks. Nor do they construct the
geometric shadow or prove that it lies in the bank. Replacing the bank proof and
proving a missing geometric producer are separate tasks.

### What the polynomial bank actually needs

The polynomial audit inspected 135 surplus row-zero instance modules: 101 direct
and 34 product modules. These instantiate general semantic lemmas but each also
checks a concrete `rulesValidForPid ... = true` condition. The relaxed-split
payloads separately carry 101 direct certificate identity checks and 34 product-sum
identity checks; endpoint patterns carry 105 direct and 12 product-sum identity
checks. These are family-specific counts from inspected source, not the complete
repository census.

Existing general arguments include:

| Source declaration | Mathematical content | What it does not establish |
| --- | --- | --- |
| `Problem97.EndpointCertificate.evaluationZeros_of_computedProductBlocks` in `EndpointCertificate/ProductCertificateSoundness.lean:36` | If every generator vanishes, every coefficient-times-generator product vanishes. | That the finite sum of products is the constant one. |
| `false_of_checkProductSum` in `EndpointCertificate/Soundness.lean:461` | Successful identity check plus vanishing products gives a contradiction. | Success of the identity check for a concrete payload. |
| `evaluationZeros_of_rulesValidForPid` in `SurplusCertificate/RowZeros/DirectSoundness.lean:262` | Valid rules and the specified metric/mask hypotheses imply all rule polynomials vanish. | Concrete rule alignment, mask membership, or geometric production of that mask. |
| `evalPoly_sqDistToCenterDiffPoly_eq_zero_of_sqDist_eq` in `EndpointCertificate/PolynomialGeometry.lean` | Equality of squared distances implies the corresponding polynomial vanishes. | Any row-specific polynomial identity or bank coverage. |

These are already the bank's semantic layer. Merely invoking them again leaves
the native premises in place. A structural alternative would need a proof that
a whole parameterized family of generators has an explicit symbolic combination
equal to one, with its coefficients derived by proved operations. Until such a
family invariant is found, arbitrary lists of generated coefficients do not
support a new universal geometric conclusion. The finite identity can instead be
proved symbolically or by kernel-checkable evaluation, but that is a different
route from discovering new geometry.

## Five-point geometric replacement candidate

The most concrete geometric theorem identified by the reuse audit is
`Problem97.Census554.FivePointCircleIsoscelesOrderBridge.false_of_two_selected_rows_of_ccw`
in `Census554/FivePointCircleIsoscelesOrderBridge.lean:68`.

**Existing source proof, not freshly compiled in this audit.** Given a finite
convex-independent set, an injective CCW boundary enumeration with that exact
image, and five indices W < F < P < X < Z, the following is impossible:

- a selected equal-radius row centred at W contains F, X, Z;
- a selected equal-radius row centred at Z contains P, X.

The row at W therefore supplies d(W,F) = d(W,X) = d(W,Z), and the row at Z
supplies d(Z,P) = d(Z,X). The source proof derives the signed-side and crossing
conditions from the cyclic order and calls the circle-isosceles geometric core.
It works for arbitrary ambient cardinality. The previous 555/654 mining audit
records this shape for 230 cores; that is historical coverage evidence, not a
fresh claim that 230 current bank payloads can simply be deleted.

**Required producer:** extract the five ordered distinct vertices and those exact
memberships from each candidate bank case. An unordered equality pattern alone
does not supply the cyclic-order antecedent. This is a promising route to retire
several finite cases together, provided that adapter can be proved. It is already
a geometric theorem; the missing work is case coverage, not a new proof of the
same five-point contradiction.

## Recommended order of work

1. Replace the exact-15/exact-16 outside-slice computations using the existing
   finite-set theorem and explicit injective label adapters. This is the smallest
   concrete removal of native dependence found in this audit.
2. Match five-point circle-isosceles and Kalmanson core hypotheses against finite
   cases, recording uncovered cases explicitly. Prove a structural coverage lemma
   only where its hypotheses are actually supplied by the source geometry.
3. Isolate the card-eleven terminal branches and mine smaller contradictory
   geometric clause cores. Keep ledger-encoding cleanups distinct from terminal
   mathematics.
4. Treat polynomial identity families separately: seek shared symbolic identities,
   otherwise evaluate kernel-checkable identity proofs as a fallback. Do not count
   existing checker-soundness lemmas as native-bank replacements.

## Validation limits

The independent claim review is in `native-bank-audit-review.md`. It confirms
the finite-set arguments and identifies the required label/coverage adapters;
it does not certify a Lean build or the census totals. The census scanner has
separate checks for comments, nested comments, quoted text, escaped quotes,
primed names, and large encoded strings.

Reproduce the full tracked-source inventory from this directory with:

```bash
uv run --no-project python audit_native_banks.py --scope all
```

Use `--scope lean` for the canonical Lean tree, including generated modules.
Neither scope scans untracked files or Lake dependencies. Archived and tracked
scratch files are discovery material; they are not assumed to be imported.

This is a source-and-index audit. No full Lean build, fresh final-root axiom probe,
certificate refreeze, solver rerun, or Prove2Me proof submission was performed.
Existing source proofs are candidates for reuse until compiled with their actual
imports and audited at the consumer. New statements above are labelled as paper
arguments or research candidates; no new Lean proof closure is claimed.
