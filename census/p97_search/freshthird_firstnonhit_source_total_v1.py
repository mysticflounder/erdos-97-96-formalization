"""Dry-run design for a full-carrier FreshThird FirstNonHit theory.

This module does not solve a formula and does not claim a completed encoding.
It freezes the source-to-schema contract, authenticates the kernel-checked
finite ingress, and reports the size and current Lean coverage of the planned
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

SCHEMA = "p97-freshthird-firstnonhit-source-total-design/v2"
DRY_RUN_SCHEMA = f"{SCHEMA}/dry-run/v1"
MIN_CARRIER_CARD = 17
PRODUCTION_LAUNCH_ENABLED = False
SOURCE_TOTAL_CLAIM = False

LEAN_INGRESS_COMMIT = "813aeae8d03cf56e77968d636086fff15bdf1e37"
LEAN_INGRESS_FILE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "FirstNonHitSourceTotalFiniteAssignment.lean"
)
LEAN_INGRESS_DECLARATION = (
    "Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal."
    "FirstNonHitSourceTotalFiniteAssignment.ofPacket"
)
LEAN_INGRESS_SHA256 = "676fae430d4f9b53246be42ccee71fe15b8fbefc3450e56737f984d74333707f"


def _canonical_source_files() -> tuple[str, ...]:
    """Return the frozen source list without consulting mutable module state."""

    return (
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
        ("lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceClosure.lean"),
        LEAN_INGRESS_FILE,
    )


SOURCE_FILES = _canonical_source_files()

FALSE_CLAIMS = {
    "source_total": False,
    "cnf_emitted": False,
    "solver_run": False,
    "coverage": False,
    "generic_cardinality_lift": False,
    "theorem": False,
    "live_leaf_closed_in_lean": False,
    "terminal_unsat": False,
}

VERIFIED_CLAIMS = {
    "lean_source_assignment": True,
    "of_packet_without_sorry_ax": True,
}

DIRECTLY_LANDED = "directly-landed"
DERIVABLE_FROM_LANDED = "derivable-from-landed-fields"
OPAQUE_SOURCE_PAYLOAD = "opaque-source-payload-not-finitely-mirrored"
MISSING_FINITE_BRIDGE = "missing-finite-bridge"
QUERY_ONLY = "query-only-not-source-ingress"
COVERAGE_CLASSES = frozenset(
    {
        DIRECTLY_LANDED,
        DERIVABLE_FROM_LANDED,
        OPAQUE_SOURCE_PAYLOAD,
        MISSING_FINITE_BRIDGE,
        QUERY_ONLY,
    }
)

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


@dataclass(frozen=True)
class ContractCoverage:
    layer: str
    family: str
    classification: str
    lean_evidence: str
    missing_bridge: str | None


SOURCE_BINDINGS = (
    SourceBinding(
        "finite_carrier",
        "FirstNonHitSourceTotalFiniteAssignment.boundary",
        LEAN_INGRESS_FILE,
        "arbitrary finite D.A; live branch proves only 17 <= D.A.card",
        "BoundaryIndexing gives the complete carrier as Fin boundary.n",
        "landed-kernel-contract",
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
        "partially-landed-missing-finite-phase-bridge",
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
        "landed-kernel-contract",
    ),
    SourceBinding(
        "cardinality_floor",
        "firstNonHit_sourceTotal_carrier_card_ge_seventeen",
        LEAN_INGRESS_FILE,
        "the active C/L/N FirstNonHit ingress",
        "require n >= 17; this lower bound gives no cutoff",
        "landed-kernel-contract",
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
        "landed-kernel-contract",
    ),
    SourceBinding(
        "critical_four_shell",
        "CriticalFourShell",
        SOURCE_FILES[0],
        "every chosen source row",
        "exact cardinality four of the complete radius_eq class through q",
        "landed-kernel-contract",
    ),
    SourceBinding(
        "cap_source_surface",
        "TwoCapSourceThirdCanonicalRowSurface",
        SOURCE_FILES[6],
        "two existential carrier sources",
        "named role selectors plus derived cap and exact-row predicates",
        "opaque-source-payload-not-finitely-mirrored",
    ),
    SourceBinding(
        "canonical_row_witness",
        "CapSourceThirdCanonicalRowWitness",
        SOURCE_FILES[6],
        "each of C.firstSource and C.secondSource",
        "derived blocker inequalities, cap membership, row and deletion views",
        "opaque-source-payload-not-finitely-mirrored",
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
        "missing-finite-bridge",
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
        "missing-finite-bridge",
    ),
    SourceBinding(
        "fresh_blocker_fiber",
        "FreshThirdBlockerFiber",
        SOURCE_FILES[3],
        "two existential carrier sources",
        "named role selectors, blocker_map equality/inequality, mutual row incidence",
        "partially-landed-missing-q-payload-bridge",
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
        "guarded-opaque-source-payload",
    ),
    SourceBinding(
        "fixed_deletion_core",
        "FreshThirdAlignedFixedDeletionCorePacket",
        SOURCE_FILES[8],
        "each retained cap source and its chosen P/P-rho endpoints",
        "derive omissions, Has4-after-two-deletions, and first-apex failure",
        "guarded-opaque-source-payload",
    ),
    SourceBinding(
        "minimal_deletion_core",
        "MinimalDeletionCore",
        SOURCE_FILES[4],
        "both members of each two-point deletion set",
        "exact first-apex radius classes with pairwise-disjoint supports",
        "guarded-opaque-source-payload",
    ),
    SourceBinding(
        "acyclic_consumer_packet",
        "FreshThirdAcyclicCanonicalConsumerPacket",
        SOURCE_FILES[8],
        "retained-radii or common-radius constructor",
        "guarded disjunction whose payloads are computed from the full carrier",
        "landed-as-typed-disjunction-not-finitely-mirrored",
    ),
    SourceBinding(
        "first_nonhit",
        "FreshThirdCapSourceNonHit",
        SOURCE_FILES[7],
        "first cap source",
        "guarded same-blocker or source-row-omission constructor payload",
        "landed-as-typed-constructor-not-finitely-mirrored",
    ),
    SourceBinding(
        "second_interaction",
        "FreshThirdCapSourceInteraction",
        SOURCE_FILES[7],
        "second cap source",
        "guarded four-constructor payload over computed rows and cap placement",
        "landed-as-typed-constructor-not-finitely-mirrored",
    ),
    SourceBinding(
        "live_leaf",
        "false_of_freshThird_firstNonHit",
        SOURCE_FILES[9],
        "arbitrary finite D.A with no source-entitled upper bound",
        "instantiate B_n for discovery; universal closure requires a generic lift",
        "landing-contract-only-not-closed",
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
        "landed-as-typed-payload-not-finitely-mirrored",
    ),
    SourceBinding(
        "lean_source_total_assignment",
        LEAN_INGRESS_DECLARATION,
        LEAN_INGRESS_FILE,
        "the complete actual carrier and the minimal source-clean FirstNonHit packet",
        (
            "authenticate the finite carrier, role, blocker, radius, row, deletion, "
            "cap, ingress, constructor, and escape interfaces used by this audit"
        ),
        "landed-kernel-contract",
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


CONTRACT_COVERAGE = (
    ContractCoverage(
        "variable",
        "blocker_map_one_hot",
        DERIVABLE_FROM_LANDED,
        "blockerMap and blockerMap_point_eq define a total finite function",
        "prove the exact-one Boolean graph adapter before clause emission",
    ),
    ContractCoverage(
        "variable",
        "radius_equivalence",
        DIRECTLY_LANDED,
        "radiusEq and radiusEq_iff",
        None,
    ),
    ContractCoverage(
        "variable",
        "cap_membership",
        DIRECTLY_LANDED,
        "inCap and inCap_iff",
        None,
    ),
    ContractCoverage(
        "variable",
        "strict_cap_interior",
        DIRECTLY_LANDED,
        "inCapInterior and inCapInterior_iff",
        None,
    ),
    ContractCoverage(
        "variable",
        "three_phase_cap_state",
        OPAQUE_SOURCE_PAYLOAD,
        "capBlocks retains the exact Direct/Mirror source proposition",
        "extract an indexed phase state and prove its iff to Direct/Mirror blocks",
    ),
    ContractCoverage(
        "variable",
        "named_carrier_role_one_hot",
        DERIVABLE_FROM_LANDED,
        "FirstNonHitNamedRole.roleIndex and roleIndex_point_eq define total roles",
        "prove the exact-one Boolean role graph adapter before clause emission",
    ),
    ContractCoverage(
        "variable",
        "constructor_guards",
        OPAQUE_SOURCE_PAYLOAD,
        "hingress, firstNonHit, and secondInteraction are typed fields",
        "reindex each guarded constructor and prove exact finite iff lemmas",
    ),
    ContractCoverage(
        "variable",
        "aligned_deletion_endpoint_choices",
        OPAQUE_SOURCE_PAYLOAD,
        "the aligned arm is retained inside hingress",
        "reindex the guarded aligned deletion packets and two-delete semantics",
    ),
    ContractCoverage(
        "variable",
        "common_radius_representative",
        OPAQUE_SOURCE_PAYLOAD,
        "the common-radius arm is retained inside hingress",
        "reindex the guarded common-radius witness without choosing it unconditionally",
    ),
    ContractCoverage(
        "obligation",
        "blocker_map_total",
        DIRECTLY_LANDED,
        "blockerMap is total on Fin boundary.n",
        None,
    ),
    ContractCoverage(
        "obligation",
        "blocker_map_no_fixed_point",
        DIRECTLY_LANDED,
        "blockerMap_ne",
        None,
    ),
    ContractCoverage(
        "obligation",
        "radius_equivalence_transitivity",
        DERIVABLE_FROM_LANDED,
        "radiusEq_iff reduces the relation to equality of real distances",
        "add a finite transitivity adapter before clause emission",
    ),
    ContractCoverage(
        "obligation",
        "radius_zero_class_singleton",
        DERIVABLE_FROM_LANDED,
        "radiusEq_iff plus boundary injectivity and dist_eq_zero",
        "add a finite zero-class adapter before clause emission",
    ),
    ContractCoverage(
        "obligation",
        "critical_selected_row_exact_four",
        DIRECTLY_LANDED,
        "row_card and row_mem_iff_radiusEq",
        None,
    ),
    ContractCoverage(
        "obligation",
        "critical_shell_no_qfree",
        DIRECTLY_LANDED,
        "hasFourAfterDeleting_iff and no_qfree",
        None,
    ),
    ContractCoverage(
        "obligation",
        "strict_interior_subset_cap",
        DERIVABLE_FROM_LANDED,
        "inCapInterior_iff and inCap_iff expose the source cap predicates",
        "add the indexed cap-interior subset adapter before clause emission",
    ),
    ContractCoverage(
        "obligation",
        "cap_three_phase_monotonicity",
        OPAQUE_SOURCE_PAYLOAD,
        "capBlocks retains the exact Direct/Mirror source proposition",
        "extract phase monotonicity from the selected Direct/Mirror branch",
    ),
    ContractCoverage(
        "obligation",
        "cap_cardinality_and_sum",
        OPAQUE_SOURCE_PAYLOAD,
        "SurplusCapPacket carries the source cap partition and cap-sum facts",
        "reindex and prove cap-cardinality and cap-sum clauses from that payload",
    ),
    ContractCoverage(
        "obligation",
        "first_cap_multi_point_radii_retained",
        OPAQUE_SOURCE_PAYLOAD,
        "the retained-radii theorem is guarded inside the aligned hingress arm",
        "prove a guarded finite realized-radius iff; do not impose it in the common arm",
    ),
    ContractCoverage(
        "obligation",
        "retained_pair_disjointness",
        MISSING_FINITE_BRIDGE,
        "the live residual has the pair-disjointness hypothesis, but ofPacket does not",
        "add a cycle-safe live-ingress adapter or remove this family from the formula",
    ),
    ContractCoverage(
        "obligation",
        "retained_radius_cross_pair_inequality",
        MISSING_FINITE_BRIDGE,
        "the live residual has radius/frontier hypotheses, but ofPacket does not",
        "add a cycle-safe live-ingress adapter or remove this family from the formula",
    ),
    ContractCoverage(
        "obligation",
        "named_role_total",
        DIRECTLY_LANDED,
        "roleIndex is total and roleIndex_point_eq identifies every named point",
        None,
    ),
    ContractCoverage(
        "obligation",
        "canonical_surface_payload",
        OPAQUE_SOURCE_PAYLOAD,
        "C is an input and every named source has a role index",
        "prove exact indexed projections for both canonical-source payloads",
    ),
    ContractCoverage(
        "obligation",
        "fresh_blocker_fiber_payload",
        OPAQUE_SOURCE_PAYLOAD,
        "Q is an input with named role indices and the total blocker/row relations",
        "prove indexed Q blocker, inequality, cap-exclusion, and mutual-row bridges",
    ),
    ContractCoverage(
        "obligation",
        "aligned_fixed_deletion_core_payload",
        OPAQUE_SOURCE_PAYLOAD,
        "the fixed deletion packets are guarded inside the aligned hingress arm",
        "add exact two-delete Has4/core transport and guarded indexed payloads",
    ),
    ContractCoverage(
        "obligation",
        "first_nonhit_constructor_payload",
        OPAQUE_SOURCE_PAYLOAD,
        "firstNonHit is preserved as its exact source constructor",
        "reindex both constructors and prove an exact finite iff",
    ),
    ContractCoverage(
        "obligation",
        "second_interaction_constructor_payload",
        OPAQUE_SOURCE_PAYLOAD,
        "secondInteraction is preserved as its exact four-way source constructor",
        "reindex all four constructors and prove an exact finite iff",
    ),
    ContractCoverage(
        "obligation",
        "q_row_fiber_and_escape_payload",
        OPAQUE_SOURCE_PAYLOAD,
        "Q role indices, total blocker/row relations, and tripleShellEscape are landed",
        "prove the remaining indexed Q-fiber and escape-support bridges",
    ),
    ContractCoverage(
        "obligation",
        "candidate_global_third_row_negation",
        QUERY_ONLY,
        "the missing positive producer is deliberately absent from the source assignment",
        "keep this as the negated discovery query; never classify it as source ingress",
    ),
)


def contract_coverage(n: int) -> list[dict[str, object]]:
    """Return and validate the exact family-level Lean coverage matrix."""

    variable_counts = variable_family_counts(n)
    obligation_counts = obligation_family_counts(n)
    expected = {("variable", family) for family in variable_counts} | {
        ("obligation", family) for family in obligation_counts
    }
    actual = {(row.layer, row.family) for row in CONTRACT_COVERAGE}
    if len(actual) != len(CONTRACT_COVERAGE) or actual != expected:
        raise SourceTotalDesignError("contract coverage does not match count families")
    if any(row.classification not in COVERAGE_CLASSES for row in CONTRACT_COVERAGE):
        raise SourceTotalDesignError("contract coverage has an unknown classification")
    rows: list[dict[str, object]] = []
    for row in CONTRACT_COVERAGE:
        counts = variable_counts if row.layer == "variable" else obligation_counts
        rows.append({**asdict(row), "instances": counts[row.family]})
    return rows


def contract_coverage_summary(n: int) -> dict[str, dict[str, int]]:
    summary = {
        classification: {"families": 0, "instances": 0}
        for classification in sorted(COVERAGE_CLASSES)
    }
    for row in contract_coverage(n):
        bucket = summary[row["classification"]]  # type: ignore[index]
        bucket["families"] += 1
        bucket["instances"] += row["instances"]  # type: ignore[operator]
    return summary


def _source_digest(repo_root: Path, relative: str) -> tuple[str, int]:
    candidate = PurePosixPath(relative)
    if (
        candidate.is_absolute()
        or not candidate.parts
        or any(part in {"", ".", ".."} for part in candidate.parts)
    ):
        raise SourceTotalDesignError(f"invalid source path: {relative}")
    if not all(hasattr(os, name) for name in ("O_DIRECTORY", "O_NOFOLLOW")):
        raise SourceTotalDesignError("platform lacks no-follow source custody")
    directory_flags = os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW
    try:
        descriptor = os.open(repo_root, directory_flags)
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


def _validate_lean_ingress_row(row: dict[str, object]) -> None:
    if row.get("path") != LEAN_INGRESS_FILE:
        raise SourceTotalDesignError("wrong Lean ingress source path")
    if row.get("sha256") != LEAN_INGRESS_SHA256:
        raise SourceTotalDesignError(
            "live Lean ingress bytes do not match the pinned commit digest"
        )


def source_manifest() -> list[dict[str, object]]:
    repo_root = Path(__file__).resolve(strict=True).parents[2]
    rows: list[dict[str, object]] = []
    for relative in _canonical_source_files():
        digest, size = _source_digest(repo_root, relative)
        rows.append(
            {
                "path": relative,
                "sha256": digest,
                "size": size,
            }
        )
    ingress_rows = [row for row in rows if row["path"] == LEAN_INGRESS_FILE]
    if len(ingress_rows) != 1:
        raise SourceTotalDesignError("Lean ingress source must occur exactly once")
    _validate_lean_ingress_row(ingress_rows[0])
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
        "lean_ingress": {
            "commit": LEAN_INGRESS_COMMIT,
            "path": LEAN_INGRESS_FILE,
            "sha256": LEAN_INGRESS_SHA256,
            "declaration": LEAN_INGRESS_DECLARATION,
            "axioms": ["propext", "Classical.choice", "Quot.sound"],
        },
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
        "contract_coverage": contract_coverage(n),
        "contract_coverage_summary": contract_coverage_summary(n),
        "source_bindings": [asdict(binding) for binding in SOURCE_BINDINGS],
        "source_manifest": source_manifest(),
        "verified_claims": dict(VERIFIED_CLAIMS),
        "false_claims": dict(FALSE_CLAIMS),
        "launch_eligible": False,
        "blocked_on": [
            "finite phase extraction from the Direct/Mirror cap-block disjunction",
            "guarded finite mirrors for retained/common ingress and source constructors",
            "cycle-safe retained pair/radius live-ingress adapters or formula removal",
            "exact indexed two-deletion Has4 and minimal-core transport",
            "complete formula emission and differential replay for every retained family",
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
