# Recovered cap-radius-drop proof and status

**Recovered from the preceding visible assistant answer.** These are previously
reported results, not a new repository audit or Lean certification.

Previously reported source revision:
`2bb06af72f01a0b5cfc422427375c029b3eebc7f`.

## 1. Strict radius drop for a same-cap interior pair

Let O be the first physical apex and

    C = SelectedClass(A, O, r).

Take distinct q,w in C, both in the strict interior of the same opposite cap.
Suppose a carrier center c != O satisfies

    |cq| = |cw| = s.

The claimed source-dependent conclusion is s < r.

The geometric dependencies reported in the preceding answer were:

1. the carrier bisector-localization theorem puts c in that strict cap;
2. the cap-order theorem places c strictly between q,w in cap order;
3. `CGN6b_nonacute_of_minorCapChainModel` gives

       <q-c, w-c> <= 0.

Consequently

    |qw|^2 >= 2*s^2.

For the strict inequality at O, normalize the endpoints and opposite apex as

    L=(-1,0), R=(1,0), O=(u,-v).

The source normalization is claimed to give

    -1 <= u <= 1, v > 0, u^2+v^2 >= 1,
    q=(x,y), w=(z,t), -1 <= x,z <= 1, y>0, t>0.

Then the algebraic identity is

    2*<q-O,w-O>
      = (1-u)*(1+x)*(1+z) + (1+u)*(1-x)*(1-z)
        + 2*(u^2+v^2-1) + 2*v*(y+t) + 2*y*t.

Every term is nonnegative and 2*v*(y+t) is positive. Hence

    <q-O,w-O> > 0,
    |qw|^2 < 2*r^2.

Combining the two estimates gives s < r, using positivity of the radii.

The scalar identity is not by itself a proof that an arbitrary packet admits
this normalization. A formalization must establish the actual source
hypotheses and the cap-order/CGN adapters, not add them silently.

## 2. Application to the physical exact-five residual

Let a,d be the two original strict-interior sources and z the fresh source.
Write e=beta(z), and let K_z be its canonical four-row with radius rho.

If a,d both belong to K_z, the radius-drop claim gives rho < r. Therefore the
subcase with both sources in K_z and rho >= r is contradictory.

The surviving double-hit case was further described as

    K_z intersect C = {a,d},
    K_z intersect cap_1 = {a,d},
    K_z = {a,d,z,t},

where e is strictly in the first cap and z,t are outside that cap. The proof
uses carrier bisector localization, the distinct-circle intersection bound,
and the cap's own-center two-hit bound. Exact set equalities require all
source-distinctness and row-cardinality hypotheses.

The smaller-radius double-hit configuration was NOT proved impossible.

## 3. Large-radius trace corollary

Let I_C be the strict-interior slice of the first five-class. For a selected row
K at a carrier center different from O,

    radius(K) >= r  implies  |K intersect I_C| <= 1.

For a canonical row sourced by q in I_C, own-source membership strengthens this
to

    radius(K_q) >= r  implies  K_q intersect I_C = {q}.

The restriction to I_C is essential. This is not a one-point intersection bound
for every point of C, including its adjacent-cap points.

## 4. Four-point obstruction to a common enclosing disk

The preceding answer gave the following points from an earlier local negative
control:

    O=(0,-1/10), P=(1,0), q=(-1,0),
    d=(3401/3385,-416/3385).

Any disk having O and P on its boundary has center

    J=(1/2,-1/20) + lambda*(-1/10,1).

The reported exact containment inequalities are

    q contained  implies  lambda >= 5,
    d contained  implies  lambda <= -8/261.

Thus no disk contains these four points with both O,P on its boundary. This
explains why that local model cannot simply acquire the source's physical-apex
MEC roles by relabeling.

This bundle does not contain the original 23-point model or its checker.

## 5. Previously reported verification — originals unavailable

The preceding answer reported exact polynomial checks, 6,174 rational sign
cases, and 100 strict-cap examples with 2,400 supporting-edge checks. The
original program and output are unavailable here. These counts are recorded as
prior claims only; they were NOT independently rerun during archive creation.

It also reported examples with s/r approaching 1. Strict radius drop alone
therefore did not supply a uniform contraction or a descent theorem.

## 6. Remaining proof boundary

- Double hit with fresh-row radius at least r: claimed prose contradiction via
  the source-dependent radius-drop theorem; needs formalization and checking.
- Double hit with smaller radius: OPEN, with the two-inside/two-outside support
  structure retained.
- A fresh blocker row omitting at least one original source: OPEN.
- Source-controlled second-row bypass: previously specified but not reported as
  integrated at the quoted revision.
- Full exact-five physical contradiction: OPEN.
- Original scalar Lean draft: previously described as unelaborated and absent
  from this recovered-text bundle.
