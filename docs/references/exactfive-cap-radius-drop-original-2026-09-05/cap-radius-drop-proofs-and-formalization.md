# Exact-five physical continuation: strict cap-radius drop

**Date:** 2026-09-05  
**Repository:** `mysticflounder/erdos-97-96-formalization`  
**Pinned source:** `2bb06af72f01a0b5cfc422427375c029b3eebc7f`  
**Result:** A prose-proved, cap-specific strict radius inequality and its physical-leaf consequences. The algebraic proof core is supplied as a complete **unelaborated** Lean draft.  
**Not claimed:** closure of the physical exact-five theorem, a new global counterexample, a successful Lean build, or a delivered nthdegree request.

## 1. Current source and delivery status

At the pinned revision, `Rigid221Closure.lean` still has both direct exact-five admissions:

```lean
false_of_exactFiveDistinct_threeCenter_distinctFresh_physical
false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence
```

The file's Git blob is still `77e357f15b4c3bc7278f5af5f53d9c8851bfe315`. The source-controlled double-deletion-row bypass from the preceding checkpoint has not been wired into this file. Its specification and unelaborated draft remain applicable. Replacing that row still requires regeneration of the strict fresh source.

This turn replayed every hash in the preceding `exact5-next-work-2026-09-05` bundle and reran its local rational checker successfully. No Lean/Lake executable is installed here; direct raw-source requests fail DNS. The GitHub connector successfully read the pinned sources.

Nthdegree is listed as installed and enabled by plugin discovery, but neither its name nor its exact plugin ID exposes callable tools in this conversation. No posting call could be made. The updated request is saved locally, not delivered. No permission setting was changed.

## 2. Main theorem: an interior pair forces a smaller radius

Let `D` be the original counterexample data, `S` its nonobtuse MEC-triangle cap packet, and write

```text
O = S.oppApex1
C = SelectedClass D.A O r
I = S.capInteriorByIndex S.oppIndex1.
```

Assume

\[
q,w\in C\cap I,\qquad q\ne w,
\]

and let `c∈D.A`, `c≠O`, satisfy

\[
|cq|=|cw|=s.
\]

Then

\[
\boxed{s<r.}
\tag{RD}
\]

No global choice of blocker is required for this statement. It applies to any carrier center bisecting the selected strict-interior pair. In particular, it applies to a canonical actual blocker whenever its selected support contains both sources.

### 2.1 Localize the second center and its cap order

The current public theorem

```lean
FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior
```

already proves `c∈I` from these hypotheses. Equality of distances and `q≠w` imply `c≠q,w`.

Choose an ordered-cap representation of the same indexed cap. The public theorem

```lean
CGN.index_strictly_between_of_equidistant
```

puts the index of `c` strictly between those of `q,w` (after swapping the latter if needed). The source of this theorem is `P97/CapSelectedRowCounting.lean`.

The normalized-cap theorem

```lean
CGN.CGN6b_nonacute_of_minorCapChainModel
```

then gives, after transporting back through the positive similarity,

\[
\langle q-c,w-c\rangle\le0.
\tag{NA}
\]

The actual CGN theorem returns this inner-product inequality; no informal angle convention is needed.

### 2.2 The opposite apex sees any two strict-cap points acutely

Normalize the opposite chord to

\[
L=(-1,0),\qquad R=(1,0),\qquad O=(u,-v).
\]

Because the original MEC support triangle is nondegenerate and nonobtuse at all three vertices,

\[
-1\le u\le1,\qquad v>0,\qquad u^2+v^2\ge1.
\tag{T}
\]

The first two inequalities come from the endpoint angles; the last comes from

\[
(L-O)\cdot(R-O)=u^2+v^2-1\ge0.
\]

Write the two strict-cap points as `q=(x,y)` and `w=(z,t)`. They lie strictly above the chord and in the normalized diameter disk, so

\[
-1\le x,z\le1,\qquad y,t>0.
\tag{C}
\]

For completeness, the diameter-disk containment does not silently assume that the original enclosing disk has its center on the chord. In this normalization the original circle center has coordinates `(0,k)` with `k≤0`, and its radius squared is `1+k²`. A point above the chord inside that disk satisfies

\[
x^2+(y-k)^2\le1+k^2
\quad\Longrightarrow\quad
x^2+y^2\le1+2ky\le1.
\]

The `MinorCapSideHypotheses` and normalized CGN coordinates already encode this geometric situation. Strictness of `y,t` follows from strict-interior membership and convex independence; a third carrier point on the endpoint chord would be collinear with its endpoints.

Now use the division-free identity

\[
\begin{aligned}
2\langle q-O,w-O\rangle={}&
(1-u)(1+x)(1+z)+(1+u)(1-x)(1-z)\\
&+2(u^2+v^2-1)+2v(y+t)+2yt.
\end{aligned}
\tag{A}
\]

Every term is nonnegative, and `2v(y+t)>0`. Thus

\[
\langle q-O,w-O\rangle>0.
\tag{AC}
\]

This part does not use `|Oq|=|Ow|`: any two strict points of this opposite minor cap satisfy the acute-apex inequality.

### 2.3 Compare the two radii

The two polarization identities are

\[
|qw|^2=|Oq|^2+|Ow|^2-2\langle q-O,w-O\rangle<2r^2
\]

and

\[
|qw|^2=|cq|^2+|cw|^2-2\langle q-c,w-c\rangle\ge2s^2.
\]

Hence `s²<r²`, and nonnegativity of the distances gives `s<r`. This proves (RD).

## 3. The physical fresh-row double-hit subcase

Use the full physical-leaf roles, not just the reduced survival square:

```text
a,d = original distinct strict-interior sources in C
z   = strict fresh source, with z∉C
b   = β(a)
e   = β(z)
Kz  = canonical exact four-row at e
rho = Kz.radius.
```

The physical packet and first-apex robustness give `e≠O`. Suppose

\[
a,d\in K_z.
\tag{DH}
\]

Applying (RD) yields

\[
\rho<r.
\tag{3.1}
\]

Thus the following is a **genuine contradictory subcase**, not a producer wrapped around a new goal:

```text
physical fresh row contains a,d
and its radius is at least r
  -> False.
```

In the surviving double-hit child, several more fields are forced:

\[
e\in I;
\qquad K_z\cap C=\{a,d\};
\qquad K_z\cap\operatorname{cap}_1=\{a,d\}.
\tag{3.2}
\]

The first is the same bisector-localization theorem. The second uses the existing two-circle intersection bound. For the third, apply

```lean
CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
```

to the row centered at `e` in its own cap. Since `a,d` are distinct members, they exhaust its possible two cap hits.

Consequently the other two row points are outside that cap. Own-source membership puts `z` in the row, and `z∉C` makes it distinct from `a,d`, so

\[
z\notin\operatorname{cap}_1,
\qquad
K_z=\{a,d,z,t\}
\]

for a unique fourth point `t` outside the first cap and distinct from the other three.

This gives a much more specific low-radius child: a small circle centered strictly in the first cap, with exactly two named interior hits and exactly two exterior hits. The geometry of the exterior pair has **not** been eliminated.

## 4. Uniform high-radius trace bound

Let

\[
I_C=C\cap I.
\]

For any selected four-row `K` at any carrier center `c≠O`, if `K.radius≥r`, then

\[
|K\cap I_C|\le1.
\tag{4.1}
\]

Otherwise choose two distinct points of the intersection and apply (RD), contradicting the radius inequality.

For the canonical row sourced by `q∈I_C`, own-source membership sharpens this to

\[
K_q\cap I_C=\{q\}
\quad\text{whenever}\quad \rho_q\ge r.
\tag{4.2}
\]

Therefore every blocker fiber with at least two sources in `I_C` has strictly smaller radius than the first-apex class. Large-radius canonical rows mutually omit every other strict-interior source in that class.

The restriction is to `I_C`, not all of `C`. The two possible adjacent-cap class points are not covered by this argument. A patch claiming `|K∩C|≤1` would overstate the theorem.

## 5. Exact audit of the previous local model's MEC failure

The preceding 23-point negative control was deliberately not a MEC/cap realization. This turn identifies a very small exact certificate of that failure.

Its original physical roles include

\[
O=(0,-1/10),\quad P=(1,0),\quad
q=(-1,0),\quad d=(3401/3385,-416/3385).
\]

There is **no disk** containing these four points with both `O,P` on its boundary.

A possible center must have the form

\[
J=(1/2,-1/20)+\lambda(-1/10,1),
\]

because it is on the perpendicular bisector of `OP`. Direct expansion gives:

\[
q\text{ in the disk}\Longrightarrow\lambda\ge5,
\]

\[
d\text{ in the disk}\Longrightarrow\lambda\le-8/261.
\]

These are incompatible. Equivalently, in center coordinates `(c_x,c_y)`, `q` forces `c_x≤0`, while `d` together with equal boundary distances forces `c_x≥1313/2610`.

This explains why the old negative control cannot be repaired merely by declaring its old `O,P` to be MEC apices. It does not say that a different full-source physical configuration is impossible. The old model remains a valid counterexample to its explicitly reduced local assumptions.

## 6. Sharpness and proof boundary

The radius comparison is strict, but no universal improvement `s≤κr` with fixed `κ<1` follows from these local cap assumptions.

Take the unit disk with

\[
O=(0,-1),\quad L=(-1,0),\quad R=(1,0),\quad c=(0,1),
\]

and

\[
q=(-x,y),\quad w=(x,y),\quad
x=\frac{1-\epsilon^2}{1+\epsilon^2},\quad
y=\frac{2\epsilon}{1+\epsilon^2},\quad 0<\epsilon<1.
\]

These six points are strictly convex, `q,w,c` lie in the strict opposite cap, and the MEC triangle is nonobtuse. The two radius squares are

\[
r^2=2+2y,\qquad s^2=2-2y.
\]

Thus `s<r`, while `s/r→1` as `ε→0+`. This example is a sharpness test for the radius inequality only; it is not a four-row or full-source model.

A radius decrease also does **not** by itself prove a descending-chain contradiction. A recursive argument would have to reproduce the same source hypotheses at a smaller radius. No such producer has been proved here.

## 7. Formalization implementation order

### 7.1 Check the scalar draft

`ExactFiveCapRadiusDropScalar.lean` supplies complete candidate scripts for:

```lean
chord_sq_identity
apex_dot_identity
apex_dot_pos
paired_radius_lt_of_dots
normalized_cap_pair_radius_lt
old_local_model_no_common_boundary_disk
```

It imports `Mathlib` only. These are scalar algebra lemmas, not the full source adapter. There are no intentional proof holes, but this environment has not elaborated the file.

### 7.2 Expose the cap nonacute metric bridge

Recommended public statement, in an import-safe module:

```text
Given the actual indexed ordered cap and q<c<w in its order,
  dist(c,q)^2 + dist(c,w)^2 <= dist(q,w)^2.
```

Reuse, in order:

```lean
S.capByIndex_cgn4g_capData D.convex i
CGN.index_strictly_between_of_equidistant
CGN.CGN6norm_minorCapChainModel_of_mecCapPacket
CGN.CGN6b_nonacute_of_minorCapChainModel
```

The normalization's distance scale is positive. Polarization and squared distance transport suffice; no independent new inner-product-preservation axiom is needed. If the library already has this exact metric bridge, use it instead of duplicating the proof.

### 7.3 Prove the source acute-apex bridge

Recommended statement:

```lean
-- Proposed FQN, not an existing declaration:
SurplusCapPacket.strictInterior_pair_oppositeApex_dot_pos
```

Inputs must be the original nonobtuse triangle/cap data and two strict-interior memberships. Derive the chord-normalized bounds (T) and (C), then call `apex_dot_pos`.

Do not add the coordinate inequalities or the positive dot product as new fields of an exact-five residual. Those are conclusions to derive from the existing cap packet.

The normalized frame must identify the actual chord endpoints and actual opposite apex. A CGN model for an unrelated cap, or a fresh boundary order with unproved role identifications, is not an adapter.

### 7.4 Source theorem

Recommended signature, with exact dependent syntax to be copied from the adjacent existing localization theorem:

```lean
theorem bisectorCenter_radius_lt_firstApexRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {q w c : ℝ²}
    (hq : q ∈ SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1)
    (hw : w ∈ SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1)
    (hqw : q ≠ w)
    (hcA : c ∈ D.A)
    (hcO : c ≠ S.oppApex1)
    (hcEq : dist c q = dist c w) :
    dist c q < r
```

The proof is Sections 2.1–2.3. Positivity of `r` follows from the same class having two distinct points; keeping an explicit `0<r` input is also acceptable at the first implementation pass because the caller already has it.

### 7.5 Source-owned corollaries

Implement:

```text
actual fresh double hit -> blocker radius < first radius
actual fresh double hit -> exact first-cap intersection {a,d}
actual fresh double hit -> fresh source and fourth support outside first cap
selected row radius >= first radius -> interior-class trace card <=1
canonical row radius >= first radius -> interior-class trace is own-source singleton
```

Keep `R,S,H,N` and the original source identities in caller-specific adapters. In particular, do not replace the fresh source with a newly chosen point and silently retain its original actual blocker.

## 8. Remaining mathematical target

The physical leaf still requires a contradiction for both:

1. a fresh actual row omitting at least one of `a,d`; and
2. the strictly smaller-radius double-hit row described in Section 3.

The former still yields survival/further-blocker patterns without a terminal. The latter now carries a proved strict radius inequality, a cap-localized center, and an exact two-inside/two-outside support decomposition. Neither is declared contradictory here.

The next useful geometry in the second child must connect the two exterior points to the other Moser caps or to their global K4 rows. Strict radius decrease cannot be substituted for that connection.

The pending source-controlled second-row bypass remains the preferred integration change. Its success would remove the five-incidence *route*, while leaving this physical mathematical target and the separate exact-four dependencies untouched.

## 9. Evidence and replay

```bash
python check_cap_radius_drop.py
sha256sum -c SHA256SUMS
```

This checker independently verifies the two polynomial identities, 6,174 rational acute-apex sign cases, 100 strict-cap sharpness examples with 2,400 strict supporting-edge tests, two assumption-removal controls, and the exact four-point disk obstruction. These finite checks support the audit; the general mathematical proof is Section 2, not sampling.

After installing the Lean draft in a repository worktree:

```bash
cd lean
lake env lean path/to/ExactFiveCapRadiusDropScalar.lean
# Then check each cap/source adapter and print its axioms.
# Finally run the existing focused root, aggregate, spine, and registry gates.
```

No scalar or producer theorem may use `sorryAx` or an unapproved custom axiom. Do not report an axiom audit before actually running it.

## 10. Pinned source index

All source paths below are relative to repository root and were read at the pinned SHA.

- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean`: unchanged two direct exact-five admissions.
- `lean/Erdos9796Proof/P97/ATail/FirstApexInteriorPairGeometry.lean`: `bisectorCenter_mem_firstApexInterior` and its source hypotheses.
- `lean/Erdos9796Proof/P97/CGN/CGN6.lean`: `CGN6norm_minorCapChainModel_of_mecCapPacket`, `CGN6b_nonacute_of_minorCapChainModel`.
- `lean/Erdos9796Proof/P97/CGN/CGN.lean`: actual `MecCapPacket`, `MinorCapSideHypotheses`, `StrictCapOrder`, and positive similarity transport fields.
- `lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean`: strict-between theorem and selected-row own-cap two-hit bound; these contracts also appear in the adjacent localization proof.

## 11. Rejection tests

Reject any continuation that:

- applies radius drop to two arbitrary class points without their common strict-cap membership;
- assumes the row center lies in that cap without proving the bisector-localization premises;
- uses strict radius decrease as a standalone infinite-descent proof;
- turns the high-radius trace bound on `C∩I` into a bound on the entire five-class;
- treats the old local model as a MEC-compatible counterexample;
- calls a failed local model a refutation of the original theorem;
- adds the acute-apex or nonacute-cap inequality as a new assumption to the full residual rather than deriving it;
- reports the scalar draft or source bridge as kernel-checked before elaboration;
- claims a formalization message was delivered without a posting receipt.
