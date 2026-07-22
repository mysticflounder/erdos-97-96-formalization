# Exact-four retriangulation terminal audit

Date: 2026-07-22

Status: **THE PROPOSED LOCAL RETRIANGULATION IMPLICATION IS FALSE.  THE FULL
SOURCE-LEVEL THEOREM REMAINS CONJECTURAL, BUT IT MUST FIRST EXCLUDE THE
STRICT-MEC-INTERIOR FRESH-CENTER ARM USING GLOBAL K4/MINIMALITY AND THE
PROTECTED-DELETION PROVENANCE.**

## Scope and preflight

This lane audits the proposed terminal-grade theorem

```text
fresh_transition_exactPair_retriangulation
```

starting from the transition data in
`unique4-global-coupling/UniqueFourGlobalDeletionCoupling.lean` and
`unique4-mec-terminal/UniqueFourFreshCenterMECBoundary.lean`.  No production
file, closure document, proof-blueprint file, or other scratch lane was
modified.

Before deriving anything new, the required theorem-bank registries were
checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered fresh transition
centers, alternative nonobtuse MEC support triangles, `CapTriple.HasExactPair`,
and same-carrier `IsM44` construction.  The only terminal constructor remains

```lean
isM44Packet_of_capTriple_two_exact_of_card_gt_nine
```

and it applies only after a complete circumscribed support triangle, its
physical `CapTriple`, and two exact cap-cardinality equations have already
been constructed.  No indexed theorem produces those data from a collision or
minimal-deletion core.

## A necessary ingress that the transition does not provide

Every vertex of
`MEC.NonObtuseCircumscribedMoserTriangle D.A ...` lies on
`MEC.boundary D.A ...`; this is already exposed by the production fields
`v1_boundary`, `v2_boundary`, and `v3_boundary`.  Therefore any theorem whose
conclusion makes the fresh center a new support-triangle vertex necessarily
proves

```text
center ∈ MEC.boundary D.A S.hA.
```

But the strongest checked source theorem currently gives only

```text
dist center mec.center < mec.radius
  or
4 ≤ (MEC.boundary D.A S.hA).card.
```

Its first arm is the exact negation of the boundary ingress required by the
proposed conclusion.  Consequently a uniform retriangulation proof must first
derive `False` from the strict-interior transition arm.  It cannot start by
constructing the advertised triangle.

## Exact local countermodels

`verify_local_transition_not_retriangulation.py` constructs three strictly
convex rational carriers.  In all three:

- the unit disk is the exact MEC;
- exactly three carrier points lie on its boundary;
- those three points form a nonobtuse circumscribed support triangle;
- the complete physical cap profile is respectively `(6,4,5)`, `(5,4,5)`,
  or `(9,5,4)`;
- hence the sole possible circumscribed support triangle has only one exact
  four-cap and cannot satisfy `CapTriple.HasExactPair`; and
- the fresh carrier center is strictly inside the MEC disk.

The first carrier has a unique five-point radius class at the fresh center.
Deleting two named co-radial members destroys K4 there, restoring either one
restores K4, and the center is fully singleton-deletion robust.  This is the
complete fixed-center metric content of the collision output.

The second carrier has one complete exact four-point class at the fresh
center.  Deleting its named source destroys K4 and restoring it restores K4.
This is the complete fixed-center metric content of the singleton
`MinimalDeletionCore` output.

The third carrier has two disjoint complete exact four-point classes at the
fresh center.  Deleting one named member of each class destroys K4; restoring
either source restores the corresponding class.  The fresh center lies in a
four-point strict cap whose complement also satisfies the checked packed-core
bound `2 * |V| <= |A \ cap|`.  This realizes the complete fixed-center metric
and cardinality content of the two-shell core output.

All three models are checked with exact `Fraction` arithmetic.  They report

```text
PASS_EXACT_LOCAL_TRANSITION_NOT_RETRIANGULATION
```

They prove that none of a fresh-center minimal collision, a singleton critical
core, or a two-shell packed core, even when combined with an exact non-M44
MEC/cap packet, locally forces an exact-pair retriangulation.

## Exact limitation of the countermodels

These are **not** `CounterexampleData` and are not countermodels to
`OriginalUniqueFourResidual F`.  They deliberately omit:

- global all-center K4;
- cardinal minimality of the whole carrier;
- a total `CriticalShellSystem`;
- identification of the blocking deletion with
  `protectedDeletionSet R`; and
- the remaining exact-four frontier fields.

That limitation is decisive.  A countermodel satisfying those fields would
be a counterexample to the theorem under study, not merely a local regression.
The exact models instead locate which inputs a valid proof must visibly use.

## First missing source-level theorem

The immediate missing theorem is not the full retriangulation.  It is the
strict-interior eliminator:

```lean
fresh_transition_not_strictlyInsideMEC
    (R : OriginalUniqueFourResidual F)
    (fresh transition data at center)
    (hinside :
      dist center (MEC.mec D.A S.hA).center <
        (MEC.mec D.A S.hA).radius) :
    False
```

This theorem must visibly use the fields absent from the exact regressions:
the fact that the blocking set lies in `protectedDeletionSet R`, global K4,
carrier minimality, or the fixed critical system.  Collision equality,
five-class robustness, or a singleton exact shell alone cannot prove it.

Even after boundary membership is obtained, the earlier four-boundary-point
regression in `unique4-mec-terminal` shows that boundary ingress alone does
not yield `HasExactPair`.  A second theorem must then use the transition's
source roles to prove the two exact physical cap counts.  Combining both gaps
under the single name `fresh_transition_exactPair_retriangulation` hides two
independent mathematical obligations.

## Verdict

- **PROVEN BY EXACT RATIONAL COUNTERMODEL:** collision/minimal-core metric data
  plus MEC/cap geometry do not force exact-pair retriangulation.
- **PROVEN FROM CURRENT TYPES:** making the fresh center a support vertex
  requires MEC-boundary membership, while the checked transition leaves a
  strict-interior arm.
- **OPEN / CONJECTURED:** global K4/minimality/protected provenance rules out
  that strict-interior arm.
- **OPEN / CONJECTURED:** the boundary arm plus full source roles forces two
  exact caps.
- **NOT CLAIMED:** a countermodel to `OriginalUniqueFourResidual`, a proof of
  its negation, or closure of a production `sorry`.

## Replay

```bash
UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline python \
  scratch/atail-force/unique4-retriangulation-terminal/\
verify_local_transition_not_retriangulation.py
```
