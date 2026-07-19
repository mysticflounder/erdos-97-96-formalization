# Planar Euclidean audit of the uniform tight-graph counterfamily

Date: 2026-07-19

Status: **THE CANONICAL COUNTERFAMILY IS UNIFORMLY NON-EUCLIDEAN, ALREADY
ON FOUR CONSECUTIVE LABELS.  THE UNIQUE SYMMETRIC WEAK-SUM NORMALIZATION THAT
MAKES ITS DISPLAYED TIGHT ROWS EQUIDISTANT IS ALSO NONPLANAR FOR EVERY
TRANSLATION.  THIS DOES NOT INVALIDATE THE FAMILY AS A GORDAN DUAL, AND THE
PLANAR-ONLY CLOSURE DIRECTION IS SUBSUMED BY A STRONGER EXACT 26-POINT LOCAL
EUCLIDEAN/MEC COUNTERMODEL.**

This is scratch theorem-discovery work.  It changes no production Lean and
closes no source `sorry`.

> **Closure warning.**  Do not promote this four-point obstruction into a
> planar-only parent strategy.  The exact 26-point model in
> `full-parent-t0t1-exact-model` already realizes substantially stronger local
> Euclidean/MEC/row data.  The only live redirect is to a total/global
> hypothesis omitted by that model.

## 1. Reuse preflight

The required theorem-bank registries and indexed Lean corpora were checked
before deriving another rank-two identity.  The reusable consumer already
exists in
[`../planar-rank-two-distance-identity/PlanarRankTwoDistanceIdentity.lean`](../planar-rank-two-distance-identity/PlanarRankTwoDistanceIdentity.lean):

```text
PlanarRankTwoDistanceIdentityScratch.
  false_of_six_distance_squares_of_determinant_ne_zero
```

It says that the three-vector centered Gram determinant formed from the six
squared distances of four actual points in `ℝ²` must vanish.  The scratch file
is source-clean and was previously kernel checked with only `propext`,
`Classical.choice`, and `Quot.sound`.  The present audit therefore searches
for certificate data for that existing consumer; it does not introduce a new
Lean theorem.

The exact computation follows the determinant implementation in
[`../variable-card-positive-dual-proof-audit/audit_alive_planarity.py`](../variable-card-positive-dual-proof-audit/audit_alive_planarity.py),
but also computes centered Gram matrices and the symbolic all-card formula.

## 2. Smallest exact card-twelve obstruction

For the canonical `n=12` table, the four consecutive labels

```text
{0,1,2,3}
```

have six distances

```text
d01 = 15,  d02 = 30,  d03 = 37,
d12 = 15,  d13 = 30,  d23 = 15.
```

Centering at label `0`, the three-vector Gram matrix reconstructed by
polarization is

```text
G = [225  450   347]
    [450  900  1022]
    [347 1022  1369].
```

Exact integer elimination gives

```text
det(G) = -24,206,400.
```

The associated five-by-five Cayley--Menger determinant is

```text
CM(0,1,2,3) = 8 * det(G) = -193,651,200.
```

Either nonzero value contradicts planar rank at most two.  The negative Gram
determinant is stronger: this four-point distance table is not Euclidean in
**any** dimension, because every Euclidean centered Gram matrix is positive
semidefinite.

This is a minimum-cardinality obstruction.  Every one- and two-point table is
trivial, and exact enumeration of all `choose(12,3)=220` triples gives
nonnegative two-vector Gram determinants.  Twelve triples are degenerate and
the rest are positive.  Thus no three-point Euclidean obstruction exists,
while `{0,1,2,3}` supplies one at cardinality four.  In fact all 495
card-twelve quadruple determinants are nonzero; 96 are negative and 399 are
positive.  Only the first consecutive quadruple is needed.

The exact certificate is
[`uniform_counterfamily_planar_n12_certificate.json`](uniform_counterfamily_planar_n12_certificate.json).
Replay it with

```bash
uv run python \
  scratch/atail-force/aggregate-positive-contour-discovery/uniform_counterfamily_planar_audit.py \
  scratch/atail-force/aggregate-positive-contour-discovery/tight_graph_uniform_n12_degree_four_counterexample.json \
  --output scratch/atail-force/aggregate-positive-contour-discovery/uniform_counterfamily_planar_n12_certificate.json
```

Deterministic replay and digest gate:

```bash
uv run python \
  scratch/atail-force/aggregate-positive-contour-discovery/uniform_counterfamily_planar_audit.py \
  scratch/atail-force/aggregate-positive-contour-discovery/tight_graph_uniform_n12_degree_four_counterexample.json \
  --output /tmp/uniform-counterfamily-planar-replay.json

cmp \
  /tmp/uniform-counterfamily-planar-replay.json \
  scratch/atail-force/aggregate-positive-contour-discovery/uniform_counterfamily_planar_n12_certificate.json

shasum -a 256 \
  scratch/atail-force/aggregate-positive-contour-discovery/tight_graph_uniform_n12_degree_four_counterexample.json \
  scratch/atail-force/aggregate-positive-contour-discovery/uniform_counterfamily_planar_n12_certificate.json \
  scratch/atail-force/aggregate-positive-contour-discovery/uniform_counterfamily_planar_audit.py
```

Expected SHA-256 digests are

```text
e6807d2701430c79b47332dff7d6622f7de3c7f6d96432b2a9d81c6888eb5b1f  input JSON
8335a22a9dccd1333846cea6089a85f234746dc680cd0a981663f63e52d00f5b  planar certificate
f1119d6e07e87c1e81c5d678e690062c090f1e8d26015641ba31654cbaffe8d8  audit script
```

## 3. Symbolic proof for every even card at least twelve

Let `n >= 12` be even and use the uniform split weights from
[`TIGHT_GRAPH_UNIFORM_ATTACK.md`](TIGHT_GRAPH_UNIFORM_ATTACK.md).  Put

```text
h = 3*n - 21,
q = 7*n - 47.
```

The orbit-count formula for the split metric gives, on four consecutive
labels,

```text
d01 = d12 = d23 = h,
d02 = d13 = 2*h,
d03 = q.
```

The centered Gram matrix is therefore

```text
G_n = [h^2    2h^2      (q^2-3h^2)/2]
      [2h^2   4h^2      (q^2+3h^2)/2]
      [(q^2-3h^2)/2  (q^2+3h^2)/2  q^2].
```

Subtracting twice the first row from the second exposes the factorization

```text
det(G_n)
  = -h^2 * (9*h^2-q^2)^2 / 4
  = -36*(n-7)^2*(n-8)^2*(8*n-55)^2.
```

Every factor after the minus sign is positive for `n >= 12`.  Hence

```text
det(G_n) < 0
```

for every member of the all-even family.  The Cayley--Menger determinant is
eight times this value:

```text
-288*(n-7)^2*(n-8)^2*(8*n-55)^2.
```

Thus uniform non-Euclideanity is **PROVED BY AN EXACT SYMBOLIC FORMULA**, not
extrapolated from the card-twelve computation.  This algebra is recorded and
replayed exactly by the audit script, but has not been imported into Lean.

There is also a simple geometric reading.  The equalities

```text
d02 = d01 + d12,
d13 = d12 + d23
```

would force `0,1,2,3` onto one Euclidean line with `d03=3*h`.  Instead

```text
3*h - q = 2*(n-8) > 0.
```

The negative determinant is the polynomial certificate of this inconsistent
pair of triangle equalities.

## 4. Weak-sum/translation audit

Planarity is not invariant under the weak-sum lineality of the Kalmanson
cone, so the pure split representative is not the only normalization worth
checking.

Let `beta` be the target potential in the tight-graph certificate.  A
symmetric correction `D(i,j)-p_i-p_j` makes the four displayed targets in
every row equidistant only if `p_x-beta_x` is constant on each target
co-occurrence component.  The card-twelve target co-occurrence graph is
connected, and the modular family has the same property.  Up to an absorbed
constant, the only such correction is therefore

```text
D_K(i,j) = D(i,j) - beta_i - beta_j + K     (i != j).
```

Two four-point planar minors suffice to exclude every `K`.  Exact symbolic
elimination uses the centered Gram determinants on label sets

```text
{0,1,2,3},  {0,1,3,4}.
```

At `n=12`, twice these determinants factor as

```text
(K-30)^2 * (K^4 - 68K^3 - 36K^2 + 36784K - 349448),

(K^2-62K+836) * (K^2-58K+802) * (K^2+26K-836).
```

Their exact resultant is

```text
114122861080204702654250528410686862336720896 != 0.
```

Therefore no real translation `K` makes both minors vanish at card twelve.
The symbolic resultant for arbitrary `n` is stored in the JSON certificate.
Its factors are the positive linear factors `2n-13`, `4n-29`, three
nonvanishing quadratics, two quartics, and one degree-eight polynomial.  After
putting `t=n-12`, all coefficients of the first quartic and the degree-eight
factor are positive.  The second quartic is `-9801` at `n=12`, while after
putting `s=n-13` it is

```text
71s^4 + 1322s^3 + 8211s^2 + 17060s + 299,
```

which is positive.  The three quadratic factors are respectively always
positive, positive and increasing from value 19 at `n=12`, and positive and
increasing from value 211.  Hence the resultant is nonzero for every integer
`n >= 12`, in particular every even member of the family.

So even the unique symmetric weak-sum normalization of this particular
counterfamily that restores row equidistance is uniformly nonplanar for all
translations.  This is an **EXACT SYMBOLIC RESULT**, not a numerical root
search.

## 5. Proof-route consequence and limit

The result identifies a very small planar consumer: once a source-faithful
table forces the six distances of four consecutive roles to the displayed
values, the existing Lean rank-two theorem closes it immediately.

It does **not** repair the generic product-box theorem.  The positive
circular-split table was constructed as a Gordan separator, and a Gordan dual
variable is not required to be an actual Euclidean distance table.  Its
non-Euclideanity therefore does not invalidate the exact refutation in
`TIGHT_GRAPH_UNIFORM_ATTACK.md`.

Nor does this audit prove that the same 48-edge support admits no completely
different positive split separator or no unrelated Euclidean realization.
It excludes the canonical uniform metric and its entire symmetric weak-sum
row-equal normalization family.  A closure proof must apply planar rank to
the **actual source-faithful distance table**, or prove that the parent data
forces one of these explicit four-point packets.  Simply adding “the dual is
planar” to Gordan's alternative would be unsound.

### Cross-check against the full-parent Euclidean/MEC countermodel

The stronger audit in
[`../full-parent-t0t1-exact-model/REPORT.md`](../full-parent-t0t1-exact-model/REPORT.md)
constructs an exact rational 26-point configuration in the actual Euclidean
plane.  It simultaneously realizes strict convex order, the support-triangle
MEC and cap roles, the physical exact-five shell, three complete reverse rows,
source-faithful unequal/disjoint T0/T1, the retained frontier metric split, an
unused critical row, and two common-deletion sources.  Nevertheless all three
reverse outside pairs avoid the demanded first-apex co-radial return.

Therefore the present four-point obstruction only explains why the **chosen
abstract dual representative** is artificial.  It does not make local
planarity, MEC, cap order, the currently displayed rows, or their conjunction
a closure route.  That stronger exact model already satisfies them.

The route must visibly consume at least one ingredient omitted from the
26-point model:

1. the total common `CriticalShellSystem`, especially actual rows at the
   frontier and other unrepresented sources;
2. global K4 at every source and after every relevant deletion;
3. full deletion minimality, not merely strong connectivity of one selected
   row graph; or
4. `noM44` or another global full-filter constraint.

The exact model does not decide which item is sufficient, so selecting one as
a proved producer would overstate the evidence.  It does decisively redirect
work away from another planar-only or MEC-local obstruction.  The next
source-faithful theorem must use a total/global field absent from that model,
with the model retained as its regression gate.

## 6. Epistemic ledger

- canonical `n=12` Gram and Cayley--Menger values: **EXACT INTEGER REPLAY**;
- smallest obstruction cardinality four: **EXHAUSTIVE EXACT `n=12` AUDIT**;
- canonical all-even determinant formula: **PROVED BY EXACT SYMBOLIC
  FACTORIZATION; NOT YET KERNEL CHECKED**;
- weak-sum row-equal family, no planar translation `K`: **PROVED BY EXACT
  SYMBOLIC RESULTANT; NOT YET KERNEL CHECKED**;
- every separator on the same support is nonplanar: **NOT PROVED**;
- local planarity/MEC/current-row data close the parent: **REFUTED BY THE
  STRONGER EXACT 26-POINT LOCAL COUNTERMODEL**;
- one particular omitted global hypothesis is sufficient: **NOT DECIDED**;
- generic product-box theorem restored: **FALSE**;
- original geometric A-tail branch: **NOT DECIDED; NO SOURCE `sorry` CLOSED**.
