"""Dry-run design for a full-carrier FreshThird FirstNonHit theory.

This module does not solve a formula and does not claim a completed encoding.
It freezes the source-to-schema contract and reports the size of the planned
logical vocabulary and obligation families for a carrier ``Fin n``.  The
former named-role packet is intentionally not imported.

The central representation choice is source-faithful: every chosen critical
shell center is a carrier vertex, so ``centerAt`` is represented by a total
blocker map ``Fin n -> Fin n``.  Distance-class equivalence is represented for
every carrier center and every pair of carrier points.  Selected rows,
``HasNEquidistantPointsAt`` predicates, and two-point minimal-deletion cores
must be derived from that common relation; they are never opaque atoms here.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
from dataclasses import asdict, dataclass
from pathlib import Path, PurePosixPath

SCHEMA = "p97-freshthird-firstnonhit-source-total-design/v1"
DRY_RUN_SCHEMA = f"{SCHEMA}/dry-run/v1"
MIN_CARRIER_CARD = 17
PRODUCTION_LAUNCH_ENABLED = False
SOURCE_TOTAL_CLAIM = False

REPO_ROOT = Path(__file__).resolve().parents[2]

SOURCE_FILES = (
    "lean/Erdos9796Proof/P97/U1CarrierInjection.lean",
    "lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean",
    "lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerMultiplicityGeometry.lean",
    "lean/Erdos9796Proof/P97/ATail/MinimalDeletionCore.lean",
    "lean/Erdos9796Proof/P97/ATail/TwoCollisionGlobalProducer.lean",
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "TwoSourceCanonicalSurface.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "TwoSourceFreshThirdFiber.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "TwoSourceFreshThirdRetainedProducer.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "TwoSourceFreshThirdResidual.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "TwoSourceTripleShellEscape.lean"
    ),
    "lean/Erdos9796Proof/P97/Census554/GeneralCarrierBridge.lean",
    "lean/Erdos9796Proof/P97/ATail/ExactFifteenApexProfile.lean",
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "TriApexEndpointRetainedOmission.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "TwoSourceClosure.lean"
    ),
)

FALSE_CLAIMS = {
    "source_total": False,
    "cnf_emitted": False,
    "solver_run": False,
    "coverage": False,
    "generic_cardinality_lift": False,
    "theorem": False,
    "lean": False,
    "terminal_unsat": False,
}

NAMED_CARRIER_ROLES = (
    "oppApex1",
    "oppApex2",
    "surplusApex",
    "P.source1",
    "P.source2",
    "P_rho.source1",
    "P_rho.source2",
    "C.firstSource",
    "C.secondSource",
    "Q.source1",
    "Q.source2",
)


class SourceTotalDesignError(RuntimeError):
    """Raised when a dry-run design artifact violates its frozen contract."""


@dataclass(frozen=True)
class SourceBinding:
    id: str
    declaration: str
    path: str
    quantifier_scope: str
    planned_encoding: str
    status: str


SOURCE_BINDINGS = (
    SourceBinding(
        "finite_carrier",
        "CounterexampleData.A",
        SOURCE_FILES[1],
        "arbitrary finite D.A; live branch proves only 17 <= D.A.card",
        "identify D.A with Fin n for each discovery instance n >= 17",
        "planned",
    ),
    SourceBinding(
        "cap_packet",
        "SurplusCapPacket",
        SOURCE_FILES[2],
        "the complete carrier and all three structural caps",
        (
            "three total cap/interior predicates over Fin n plus one fixed cyclic "
            "boundary order and a three-phase no-alternation representation"
        ),
        "planned",
    ),
    SourceBinding(
        "boundary_indexing",
        "BoundaryIndexing",
        SOURCE_FILES[11],
        "all carrier points in convex cyclic order",
        (
            "identify Fin n with one fixed boundary indexing; derive cap phases "
            "and every order-sensitive obligation from that single indexing"
        ),
        "planned",
    ),
    SourceBinding(
        "cardinality_floor",
        "twoCapSourceSurface_carrier_card_ge_seventeen",
        SOURCE_FILES[14],
        "the active C/L/N/T FirstNonHit ingress",
        "require n >= 17; this lower bound gives no cutoff",
        "source-entitled-at-live-ingress",
    ),
    SourceBinding(
        "critical_shell_system",
        "CriticalShellSystem",
        SOURCE_FILES[0],
        "every q in D.A",
        (
            "total blocker_map[q] in Fin n; radius_eq[blocker_map[q],q,x] "
            "defines the exact four-point selected row; deletion survival is "
            "computed from all radius_eq classes"
        ),
        "planned",
    ),
    SourceBinding(
        "critical_four_shell",
        "CriticalFourShell",
        SOURCE_FILES[0],
        "every chosen source row",
        "exact cardinality four of the complete radius_eq class through q",
        "planned",
    ),
    SourceBinding(
        "cap_source_surface",
        "TwoCapSourceThirdCanonicalRowSurface",
        SOURCE_FILES[6],
        "two existential carrier sources",
        "named role selectors plus derived cap and exact-row predicates",
        "planned",
    ),
    SourceBinding(
        "canonical_row_witness",
        "CapSourceThirdCanonicalRowWitness",
        SOURCE_FILES[6],
        "each of C.firstSource and C.secondSource",
        "derived blocker inequalities, cap membership, row and deletion views",
        "planned",
    ),
    SourceBinding(
        "retained_frontier_context",
        "hρne/hfrontierFour/hρfour/hfrontierInteriorEq/hρInteriorEq/hpairsDisjoint",
        SOURCE_FILES[9],
        "both retained collision radii and their four endpoints",
        (
            "two exact four-point first-apex classes, exact two-point strict-cap "
            "intersections, cross-pair point inequalities, and cross-pair "
            "first-apex radius inequivalences"
        ),
        "planned",
    ),
    SourceBinding(
        "cross_pair_deletion_view",
        "CrossPairDeletionView",
        SOURCE_FILES[5],
        "each cap source and each retained collision pair",
        (
            "the disjunction of the two computed one-point deletion survivals; "
            "never strengthened to require both"
        ),
        "planned",
    ),
    SourceBinding(
        "fresh_blocker_fiber",
        "FreshThirdBlockerFiber",
        SOURCE_FILES[3],
        "two existential carrier sources",
        "named role selectors, blocker_map equality/inequality, mutual row incidence",
        "planned",
    ),
    SourceBinding(
        "retained_radii",
        "FirstCapMultiPointRadiiRetained",
        SOURCE_FILES[7],
        "every realized first-apex radius class",
        (
            "for every carrier pair in the strict first cap, equal first-apex "
            "radius implies membership in one of the two retained classes"
        ),
        "planned",
    ),
    SourceBinding(
        "fixed_deletion_core",
        "FreshThirdAlignedFixedDeletionCorePacket",
        SOURCE_FILES[8],
        "each retained cap source and its chosen P/P-rho endpoints",
        "derive omissions, Has4-after-two-deletions, and first-apex failure",
        "planned",
    ),
    SourceBinding(
        "minimal_deletion_core",
        "MinimalDeletionCore",
        SOURCE_FILES[4],
        "both members of each two-point deletion set",
        "exact first-apex radius classes with pairwise-disjoint supports",
        "planned",
    ),
    SourceBinding(
        "acyclic_consumer_packet",
        "FreshThirdAcyclicCanonicalConsumerPacket",
        SOURCE_FILES[8],
        "retained-radii or common-radius constructor",
        "guarded disjunction whose payloads are computed from the full carrier",
        "planned",
    ),
    SourceBinding(
        "first_nonhit",
        "FreshThirdCapSourceNonHit",
        SOURCE_FILES[7],
        "first cap source",
        "guarded same-blocker or source-row-omission constructor payload",
        "planned",
    ),
    SourceBinding(
        "second_interaction",
        "FreshThirdCapSourceInteraction",
        SOURCE_FILES[7],
        "second cap source",
        "guarded four-constructor payload over computed rows and cap placement",
        "planned",
    ),
    SourceBinding(
        "live_leaf",
        "false_of_freshThird_firstNonHit",
        SOURCE_FILES[9],
        "arbitrary finite D.A with no source-entitled upper bound",
        "instantiate B_n for discovery; universal closure requires a generic lift",
        "landing-contract-only",
    ),
    SourceBinding(
        "global_third_row_query",
        "negation of the carrier-wide third-row producer",
        SOURCE_FILES[9],
        "every source in D.A",
        (
            "for every source s, a center distinct from Q.center has row "
            "overlap at most two with Q.row; this is query-only, not a source "
            "hypothesis"
        ),
        "query-only",
    ),
    SourceBinding(
        "independent_escape_le_two",
        "exists_q_tripleShellEscape_qRow_overlap_card_le_two",
        SOURCE_FILES[10],
        "one source-produced escaping row",
        (
            "independent positive producer with Q-row overlap at most two; it "
            "does not prove the query's overlap-at-least-three target"
        ),
        "source-theorem-context-only",
    ),
)


def _choose2(n: int) -> int:
    return n * (n - 1) // 2


def _choose3(n: int) -> int:
    return n * (n - 1) * (n - 2) // 6


def _validate_n(n: int) -> None:
    if type(n) is not int or n < MIN_CARRIER_CARD:
        raise SourceTotalDesignError(
            f"carrier cardinality must be an integer at least {MIN_CARRIER_CARD}"
        )


def variable_family_counts(n: int) -> dict[str, int]:
    """Return exact Boolean counts for the frozen design vocabulary.

    These are vocabulary counts, not CNF auxiliary-variable counts.  The CNF
    encoder and its chosen cardinality encoding do not exist yet.
    """

    _validate_n(n)
    pairs = _choose2(n)
    return {
        "blocker_map_one_hot": n * n,
        "radius_equivalence": n * pairs,
        "cap_membership": 3 * n,
        "strict_cap_interior": 3 * n,
        "three_phase_cap_state": 3 * n,
        "named_carrier_role_one_hot": len(NAMED_CARRIER_ROLES) * n,
        "constructor_guards": 2 + 4 + 2,
        "aligned_deletion_endpoint_choices": 2 * (2 + 2),
        "common_radius_representative": n,
    }


def obligation_family_counts(n: int) -> dict[str, int]:
    """Return logical obligation counts before Tseitin/cardinality lowering."""

    _validate_n(n)
    pairs = _choose2(n)
    triples = _choose3(n)
    return {
        "blocker_map_total": n,
        "blocker_map_no_fixed_point": n,
        "radius_equivalence_transitivity": 3 * n * triples,
        "radius_zero_class_singleton": n * (n - 1),
        "critical_selected_row_exact_four": n * n,
        "critical_shell_no_qfree": n * n * n,
        "strict_interior_subset_cap": 3 * n,
        "cap_three_phase_monotonicity": 3 * n * n,
        "cap_cardinality_and_sum": 4,
        "first_cap_multi_point_radii_retained": pairs,
        "retained_pair_disjointness": 4,
        "retained_radius_cross_pair_inequality": 4,
        "named_role_total": len(NAMED_CARRIER_ROLES),
        "canonical_surface_payload": 2 * (9 + 4 * n),
        "fresh_blocker_fiber_payload": 13 + 2 * n,
        "aligned_fixed_deletion_core_payload": 2 * (6 + 2 * n),
        "first_nonhit_constructor_payload": 4 + 2 * n,
        "second_interaction_constructor_payload": 20 + 4 * n,
        "q_row_fiber_and_escape_payload": 12 + 3 * n,
        "candidate_global_third_row_negation": n,
    }


def _source_digest(relative: str) -> tuple[str, int]:
    candidate = PurePosixPath(relative)
    if candidate.is_absolute() or not candidate.parts or any(
        part in {"", ".", ".."} for part in candidate.parts
    ):
        raise SourceTotalDesignError(f"invalid source path: {relative}")
    if not all(hasattr(os, name) for name in ("O_DIRECTORY", "O_NOFOLLOW")):
        raise SourceTotalDesignError("platform lacks no-follow source custody")
    directory_flags = os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW
    try:
        descriptor = os.open(REPO_ROOT, directory_flags)
    except OSError as exc:
        raise SourceTotalDesignError("cannot open canonical repository root") from exc
    try:
        for index, part in enumerate(candidate.parts):
            flags = (
                os.O_RDONLY | os.O_NOFOLLOW
                if index == len(candidate.parts) - 1
                else directory_flags
            )
            try:
                child = os.open(part, flags, dir_fd=descriptor)
            except OSError as exc:
                raise SourceTotalDesignError(
                    f"cannot open source without following links: {relative}"
                ) from exc
            os.close(descriptor)
            descriptor = child
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
            raise SourceTotalDesignError(
                f"source is not a singly-linked regular file: {relative}"
            )
        digest = hashlib.sha256()
        size = 0
        while True:
            block = os.read(descriptor, 1024 * 1024)
            if not block:
                break
            digest.update(block)
            size += len(block)
        after = os.fstat(descriptor)
        identity = lambda value: (
            value.st_dev,
            value.st_ino,
            value.st_size,
            value.st_mtime_ns,
            value.st_ctime_ns,
            value.st_nlink,
            value.st_mode,
        )
        if identity(before) != identity(after):
            raise SourceTotalDesignError(f"source changed while read: {relative}")
        return digest.hexdigest(), size
    finally:
        os.close(descriptor)


def source_manifest() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for relative in SOURCE_FILES:
        digest, size = _source_digest(relative)
        rows.append(
            {
                "path": relative,
                "sha256": digest,
                "size": size,
            }
        )
    return rows


def _canonical_json(value: object) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("ascii")


def dry_run_manifest(n: int) -> dict[str, object]:
    _validate_n(n)
    variables = variable_family_counts(n)
    obligations = obligation_family_counts(n)
    payload: dict[str, object] = {
        "schema": DRY_RUN_SCHEMA,
        "carrier_cardinality": n,
        "minimum_source_entitled_cardinality": MIN_CARRIER_CARD,
        "production_launch_enabled": PRODUCTION_LAUNCH_ENABLED,
        "source_total_claim": SOURCE_TOTAL_CLAIM,
        "fixed_n_scope": "discovery-only-pending-generic-lift",
        "query": (
            "source hypotheses plus the negation of a carrier-wide distinct-center "
            "row with Q-row overlap at least three"
        ),
        "count_semantics": {
            "variables": "pre-CNF Boolean vocabulary",
            "obligations": "logical instances before Tseitin/cardinality lowering",
            "cnf_variables": None,
            "cnf_clauses": None,
        },
        "named_carrier_roles": list(NAMED_CARRIER_ROLES),
        "variable_family_counts": variables,
        "variable_total": sum(variables.values()),
        "obligation_family_counts": obligations,
        "obligation_total": sum(obligations.values()),
        "source_bindings": [asdict(binding) for binding in SOURCE_BINDINGS],
        "source_manifest": source_manifest(),
        "false_claims": dict(FALSE_CLAIMS),
        "launch_eligible": False,
        "blocked_on": [
            "complete formula emission for every source binding",
            "independent source-faithfulness audit",
            "differential replay of every computed predicate",
            "generic-cardinality Lean lift for any fixed-n result",
        ],
    }
    payload["manifest_sha256"] = hashlib.sha256(_canonical_json(payload)).hexdigest()
    return payload


def validate_dry_run_manifest(manifest: object) -> dict[str, object]:
    if type(manifest) is not dict:
        raise SourceTotalDesignError("dry-run manifest must be a JSON object")
    n = manifest.get("carrier_cardinality")
    _validate_n(n)  # type: ignore[arg-type]
    expected = dry_run_manifest(n)  # type: ignore[arg-type]
    if manifest != expected:
        raise SourceTotalDesignError("dry-run manifest does not replay exactly")
    return expected


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, default=MIN_CARRIER_CARD)
    args = parser.parse_args()
    print(json.dumps(dry_run_manifest(args.n), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
