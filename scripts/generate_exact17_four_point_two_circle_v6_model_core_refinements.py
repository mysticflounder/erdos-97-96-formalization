"""Promote the two FourPoint model cores from the exact-17 V6 canary ledger."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import tempfile
from collections.abc import Mapping
from pathlib import Path
from typing import Any

REPO = Path(__file__).resolve().parents[1]
LEDGER = (
    REPO
    / "scratch/runs/exact17-canary-perp-bisector-survivor-four-point-two-circle-"
    "v5-canary-two-kalmanson-refinements-sat-portfolio-v6-20260823/"
    "sat-profile-portfolio-v6/artifacts/candidate-ledger.json"
)
LEAN_OUTPUT = (
    REPO
    / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircle"
    "V6ModelCoreRefinements.lean"
)
PARENT_CELL_CNF = (
    REPO
    / "scratch/runs/exact17-v5-canary-twok-successor-preparer-20260823/"
    "preparation-v1/artifacts/cells/"
    "canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-"
    "refinements-next-center-02-physical-none/"
    "canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-"
    "refinements-next-center-02-physical-none.cnf"
)
LEDGER_SHA256 = "ed2abfe2b9606875749bacd85d88dfd953c783ac51d6b8ce20df3cbe5a96ee9d"
LEAN_SHA256 = "c517298188954bf71575c2fe4dab49a1fe9f278d975bf29c1e5c9bc5e592967c"
PARENT_CELL_CNF_SHA256 = "372c8bf73855b0e56b92106d3d463d58f6b497abfdc26456a27e2240aeca883a"
PARENT_CELL_CNF_BYTES = 346_304_035
LEDGER_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-"
    "two-kalmanson-v6-wave-only-candidate-ledger/v1"
)
CANDIDATE_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-"
    "two-kalmanson-v6-wave-only-candidate/v1"
)
FAMILY = "formalized-core-bank"
N = 17
NUM_VARIABLES = 308
PARENT_CLAUSES = 7_409_786
PARENT_ROOT_CLAUSES = 7_409_780
SUFFIX_CLAUSES = 8
ROOT_CLAUSES = PARENT_ROOT_CLAUSES + SUFFIX_CLAUSES
EXPECTED_ORDER = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
EXPECTED_EXACT_PARENT_MULTIPLICITY = (0, 0, 0, 0, 0, 0, 0, 0)
EXPECTED_PARENT_SUBSUMER_COUNTS = (0, 2, 2, 1, 0, 0, 2, 0)
EXPECTED_STRICT_NEW_INDICES = (0, 4, 5, 7)

TOP_KEYS = {
    "candidates",
    "candidates_examined",
    "cnf_sha256",
    "complete_no_candidates",
    "decoded_selectors",
    "family_inventory",
    "job_id",
    "manifest_sha256",
    "model_sha256",
    "portfolio_cell_id",
    "producer_manifest_sha256",
    "scan_complete",
    "scanner",
    "scanner_dependencies",
    "schema",
    "source_valid_family_inventory",
    "source_valid_only",
    "status",
    "variable_map_sha256",
    "wave_manifest_sha256",
}
CANDIDATE_KEYS = {
    "candidate_id",
    "family",
    "lean_consumer",
    "payload",
    "record_sha256",
    "schema",
    "source_valid",
    "support",
}
EXPECTED_FAMILY_INVENTORY = {
    "complete_equality_component_counts": {
        "candidate_count": 0,
        "component_count": 86,
        "oriented_edge_count": 272,
        "pair_count": 136,
        "row_transition_count": 204,
        "unordered_edge_count": 136,
    },
    "excluded_diagnostic_stage_counts": {
        "equality-convex-two-kalmanson-cancellation": 1
    },
    "family_candidate_counts": {
        FAMILY: 2,
        "perpendicular-bisector-equality-component": 0,
        "two-kalmanson-cancellation": 9,
    },
    "formalized_stage_counts": {
        "equality-convex-four-point-two-circle-bisector-order": 1,
        "equality-convex-four-point-two-circle-bisector-order-reverse": 1,
        "equality-convex-two-kalmanson-cancellation": 1,
    },
    "two_kalmanson_pairing_counts": {
        "forward_record_count": 29,
        "minimal_forward_support_count": 10,
        "minimal_paired_union_count": 9,
        "minimal_reverse_support_count": 9,
        "paired_union_count": 54,
        "reverse_record_count": 29,
    },
}
EXPECTED_TOP_VALUES = {
    "cnf_sha256": "372c8bf73855b0e56b92106d3d463d58f6b497abfdc26456a27e2240aeca883a",
    "job_id": "563adc46-95db-429e-8ece-acf4e66bef47",
    "model_sha256": "d1d45c37f9241a20e06867d208785f5fe960dc537e045854800d6d8e45afa1b9",
    "portfolio_cell_id": (
        "canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-"
        "kalmanson-refinements-next-center-02-physical-none-canary-two-kalmanson-"
        "v6-sat-profile-v1"
    ),
    "producer_manifest_sha256": (
        "dc668cb18ec07d9e3bd45b62da45568675462d3fb8d1d9d3812e1a9645043549"
    ),
    "variable_map_sha256": (
        "78df650209311154e9a5fb6fdb88b6e532acaa624b7789d3028434c05e38e63f"
    ),
    "wave_manifest_sha256": (
        "857a7d05b96f0c9d3242d2e273592f9c4be9787a60c8d24ef5dbb5f8183e3524"
    ),
}
EXPECTED_TARGETS = {
    "forward": {
        "candidate_id": (
            "formalized-core-bank:"
            "1a1080d346bcaadab3a96fdca5b20a0a456af2c54aed69b1fb9976696be59eee"
        ),
        "record_sha256": (
            "6d8a8d95ef093fc44f7cd6b3dfa77c792e142ac70e149b245e3ccd8aa804131d"
        ),
        "consumer": (
            "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core"
        ),
        "record": {
            "core": {"Q": 5, "U": 2, "V": 3, "Y": 15},
            "cyclic_orientation": "forward",
            "lean_consumer": (
                "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core"
            ),
            "orientation": "forward",
            "source": "common-system-bank",
            "stage": "equality-convex-four-point-two-circle-bisector-order",
        },
        "canonical": {"Q": 13, "U": 8, "V": 11, "Y": 9},
        "hits": ((6, 8), (6, 13), (8, 6), (8, 13),
                 (11, 8), (11, 9), (13, 6), (13, 9)),
    },
    "reverse": {
        "candidate_id": (
            "formalized-core-bank:"
            "ed1a4ada58283d9ce8bcf7744fb364b390d3d7c433ca043721859bd417df690f"
        ),
        "record_sha256": (
            "2f31a7bb0dc2e3ae108956781b21812b2bb8893d5d2dc8f9deadfb7c129f95db"
        ),
        "consumer": (
            "Problem97.Census554.FourPointTwoCircleBisectorOrderCore."
            "false_of_core_of_neg"
        ),
        "record": {
            "core": {"Q": 5, "U": 2, "V": 13, "Y": 0},
            "cyclic_orientation": "reverse",
            "lean_consumer": (
                "Problem97.Census554.FourPointTwoCircleBisectorOrderCore."
                "false_of_core_of_neg"
            ),
            "orientation": "reverse",
            "source": "common-system-bank",
            "stage": "equality-convex-four-point-two-circle-bisector-order-reverse",
        },
        "canonical": {"Q": 13, "U": 8, "V": 15, "Y": 0},
        "hits": ((6, 8), (6, 13), (8, 6), (8, 13),
                 (13, 0), (13, 6), (15, 0), (15, 8)),
    },
}


class PromotionError(ValueError):
    """The authenticated candidate ledger cannot be promoted."""


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode()


def sha256_bytes(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def self_hash(value: Mapping[str, Any], field: str) -> str:
    return sha256_bytes(
        canonical_json_bytes({key: item for key, item in value.items() if key != field})
    )


def _reject_constant(value: str) -> None:
    raise PromotionError(f"non-finite JSON constant: {value}")


def _object_without_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise PromotionError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def strict_json(raw: bytes) -> dict[str, Any]:
    try:
        value = json.loads(
            raw,
            object_pairs_hook=_object_without_duplicates,
            parse_constant=_reject_constant,
        )
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise PromotionError("invalid candidate ledger JSON") from exc
    if type(value) is not dict:
        raise PromotionError("candidate ledger must be an object")
    return value


def require_exact_keys(value: Any, expected: set[str], label: str) -> dict[str, Any]:
    if type(value) is not dict or set(value) != expected:
        raise PromotionError(f"{label} schema drifted")
    return value


def candidate_identity_material(candidate: Mapping[str, Any]) -> dict[str, Any]:
    return {
        key: candidate.get(key)
        for key in ("schema", "family", "source_valid", "lean_consumer", "support", "payload")
    }


def candidate_id(candidate: Mapping[str, Any]) -> str:
    digest = sha256_bytes(canonical_json_bytes(candidate_identity_material(candidate)))
    return f"{candidate.get('family')}:{digest}"


def load_authenticated_ledger(path: Path = LEDGER) -> dict[str, Any]:
    if path.resolve() != LEDGER.resolve():
        raise PromotionError("candidate ledger path drifted")
    raw = path.read_bytes()
    if sha256_bytes(raw) != LEDGER_SHA256:
        raise PromotionError("candidate ledger hash drifted")
    return strict_json(raw)


def _decoded_rows(ledger: Mapping[str, Any]) -> tuple[dict[int, tuple[int, ...]], dict[int, int]]:
    decoded = ledger.get("decoded_selectors")
    if type(decoded) is not dict or set(decoded) != {
        "NamedOrder", "assignment_sha256", "nextCenter", "order", "rows"
    }:
        raise PromotionError("decoded selector schema drifted")
    if decoded["NamedOrder"] != 0 or decoded["nextCenter"] != 2:
        raise PromotionError("decoded selector binding drifted")
    if tuple(decoded["order"]) != EXPECTED_ORDER:
        raise PromotionError("decoded named order drifted")
    raw_rows = decoded["rows"]
    if type(raw_rows) is not dict or set(raw_rows) != {str(i) for i in range(N)}:
        raise PromotionError("decoded row table drifted")
    rows: dict[int, tuple[int, ...]] = {}
    for center in range(N):
        row = raw_rows[str(center)]
        if type(row) is not list or len(row) != 4 or row != sorted(set(row)):
            raise PromotionError("decoded selected row drifted")
        if any(type(point) is not int or not 0 <= point < N for point in row):
            raise PromotionError("decoded selected row label drifted")
        rows[center] = tuple(row)
    inverse = {physical: position for position, physical in enumerate(EXPECTED_ORDER)}
    if len(inverse) != N:
        raise PromotionError("decoded named order is not a permutation")
    return rows, inverse


def _canonical_record(record: Mapping[str, Any], inverse: Mapping[int, int]) -> dict[str, Any]:
    core = record["core"]
    if set(core) == {"Q", "U", "V", "Y"}:
        return {key: inverse[core[key]] for key in ("Q", "U", "V", "Y")}
    raise PromotionError("target core schema drifted")


def validate_ledger(ledger: Mapping[str, Any]) -> dict[str, Mapping[str, Any]]:
    require_exact_keys(ledger, TOP_KEYS, "ledger")
    if (
        ledger["schema"] != LEDGER_SCHEMA
        or ledger["status"] != "COMPLETE"
        or ledger["scan_complete"] is not True
        or ledger["source_valid_only"] is not True
        or ledger["complete_no_candidates"] is not False
        or ledger["candidates_examined"] != 11
    ):
        raise PromotionError("ledger schema/status/count drifted")
    if ledger["manifest_sha256"] != self_hash(ledger, "manifest_sha256"):
        raise PromotionError("ledger self-hash drifted")
    if ledger["family_inventory"] != EXPECTED_FAMILY_INVENTORY:
        raise PromotionError("family inventory drifted")
    if ledger["source_valid_family_inventory"] != [
        FAMILY,
        "perpendicular-bisector-equality-component",
        "two-kalmanson-cancellation",
    ]:
        raise PromotionError("source-valid family inventory drifted")
    for key, expected in EXPECTED_TOP_VALUES.items():
        if ledger[key] != expected:
            raise PromotionError(f"top-level {key} drifted")
    candidates = ledger["candidates"]
    if type(candidates) is not list or len(candidates) != 11:
        raise PromotionError("candidate array drifted")
    targets_by_id = {item["candidate_id"]: tag for tag, item in EXPECTED_TARGETS.items()}
    selected: dict[str, Mapping[str, Any]] = {}
    family_counts = {
        FAMILY: 0,
        "perpendicular-bisector-equality-component": 0,
        "two-kalmanson-cancellation": 0,
    }
    for index, candidate in enumerate(candidates):
        require_exact_keys(candidate, CANDIDATE_KEYS, f"candidate[{index}]")
        if candidate["schema"] != CANDIDATE_SCHEMA or candidate["source_valid"] is not True:
            raise PromotionError("candidate schema/source-valid drifted")
        if candidate["record_sha256"] != self_hash(candidate, "record_sha256"):
            raise PromotionError("candidate record hash drifted")
        if candidate["candidate_id"] != candidate_id(candidate):
            raise PromotionError("candidate id drifted")
        family = candidate["family"]
        if family not in family_counts:
            raise PromotionError("unexpected candidate family")
        family_counts[family] += 1
        tag = targets_by_id.get(candidate["candidate_id"])
        if tag is not None:
            selected[tag] = candidate
    if family_counts != {FAMILY: 2, "perpendicular-bisector-equality-component": 0,
                         "two-kalmanson-cancellation": 9}:
        raise PromotionError("candidate family counts drifted")
    if set(selected) != set(EXPECTED_TARGETS):
        raise PromotionError("target candidate selection drifted")
    rows, inverse = _decoded_rows(ledger)
    full_support = sorted(
        [[center, point] for center in range(N) for point in rows[center]],
        key=canonical_json_bytes,
    )
    for tag, candidate in selected.items():
        expected = EXPECTED_TARGETS[tag]
        if candidate["family"] != FAMILY or candidate["support"] != full_support:
            raise PromotionError("target source support drifted")
        if candidate["record_sha256"] != expected["record_sha256"]:
            raise PromotionError("target record identity drifted")
        if candidate["lean_consumer"] != expected["consumer"]:
            raise PromotionError("target consumer drifted")
        payload = require_exact_keys(
            candidate["payload"],
            {"canonical_bank_record", "full_selected_row_support_replay"},
            "target payload",
        )
        if payload["full_selected_row_support_replay"] is not True:
            raise PromotionError("target full-support replay flag drifted")
        record = payload["canonical_bank_record"]
        if record != expected["record"]:
            raise PromotionError("target canonical bank record drifted")
        if _canonical_record(record, inverse) != expected["canonical"]:
            raise PromotionError("target physical-to-canonical map drifted")
        for center, point in expected["hits"]:
            physical_center = EXPECTED_ORDER[center]
            physical_point = EXPECTED_ORDER[point]
            if physical_point not in rows[physical_center]:
                raise PromotionError("target clause uses an unauthenticated positive hit")
    return selected


def _label_at_position(order: int, position: int) -> int:
    tables = (
        EXPECTED_ORDER,
        (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    )
    return tables[order][position]


def dimacs_suffix_clauses() -> tuple[tuple[int, ...], ...]:
    clauses: list[tuple[int, ...]] = []
    for tag in ("forward", "reverse"):
        hits = EXPECTED_TARGETS[tag]["hits"]
        for order in range(2):
            for reverse in (False, True):
                def oriented(
                    position: int, order: int = order, reverse: bool = reverse
                ) -> int:
                    return _label_at_position(order, N - 1 - position if reverse else position)

                clauses.append(
                    tuple([-307 - order]
                          + [-(1 + N * oriented(center) + oriented(point))
                             for center, point in hits])
                )
    return tuple(clauses)


def verify_parent_novelty(parent_cell_cnf: Path) -> None:
    if parent_cell_cnf.resolve() != PARENT_CELL_CNF.resolve():
        raise PromotionError("parent witness CNF path drifted")
    raw_stat = parent_cell_cnf.stat()
    if raw_stat.st_size != PARENT_CELL_CNF_BYTES:
        raise PromotionError("parent witness CNF byte count drifted")
    if sha256_file(parent_cell_cnf) != PARENT_CELL_CNF_SHA256:
        raise PromotionError("parent witness CNF hash drifted")
    exact = [0] * SUFFIX_CLAUSES
    subsumers = [0] * SUFFIX_CLAUSES
    suffix = dimacs_suffix_clauses()
    suffix_sets = [set(clause) for clause in suffix]
    with parent_cell_cnf.open(encoding="ascii") as handle:
        for line in handle:
            if line.startswith("p "):
                break
        else:
            raise PromotionError("parent witness CNF lacks a header")
        if line.strip() != f"p cnf {NUM_VARIABLES} {PARENT_CLAUSES}":
            raise PromotionError("parent witness CNF header drifted")
        processed = 0
        for line in handle:
            if processed == PARENT_CLAUSES:
                break
            fields = tuple(int(item) for item in line.split())
            if not fields or fields[-1] != 0:
                raise PromotionError("malformed parent witness CNF clause")
            clause = fields[:-1]
            processed += 1
            clause_set = set(clause)
            for suffix_index, suffix_set in enumerate(suffix_sets):
                if clause == suffix[suffix_index]:
                    exact[suffix_index] += 1
                if clause_set <= suffix_set:
                    subsumers[suffix_index] += 1
        if processed != PARENT_CLAUSES:
            raise PromotionError("parent witness CNF ended before the parent root")
    if tuple(exact) != EXPECTED_EXACT_PARENT_MULTIPLICITY:
        raise PromotionError("exact parent novelty drifted")
    if tuple(subsumers) != EXPECTED_PARENT_SUBSUMER_COUNTS:
        raise PromotionError("parent subsumption novelty drifted")
    strict_new = tuple(index for index, count in enumerate(subsumers) if count == 0)
    if strict_new != EXPECTED_STRICT_NEW_INDICES:
        raise PromotionError("strict-new suffix index census drifted")


LEAN_SOURCE = '/-\nCopyright (c) 2026 Adam McKenna. All rights reserved.\nReleased under Apache 2.0 license as described in the LICENSE file.\nAuthors: Adam McKenna\n-/\n\nimport Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinements\n\n/-!\n# Exact-seventeen V6 survivor model-core refinements\n\nThe two source-valid four-point/two-circle candidates from the authenticated V6\ncanary ledger are promoted through their full order/orientation orbits.  All\neight orbit clauses are appended to the current V5 root.\n-/\n\nopen scoped EuclideanGeometry\n\nnamespace Problem97\nnamespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinements\n\nopen ATailBlockerVExactSeventeenSourceNormalForm\nopen ATailBlockerVExactSeventeenSourceCnf\nopen ATailBlockerVExactSeventeenSourceCnfCdefg\nopen ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation\nopen ATailFrontierLiveClosure.GenericRowNogoodCertificate\nopen Census554.EqualityCore\nopen ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinements\n\nprivate abbrev priorOrientedHits :=\n  ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits\n\nprivate abbrev occurrenceClause :=\n  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause\n\nprivate abbrev occurrenceClauses :=\n  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses\n\nprivate theorem signedArea2_swap13 (a b c : ℝ²) :\n    signedArea2 a b c = -signedArea2 c b a := by\n  simp only [signedArea2]\n  ring\n\nprivate theorem signedArea2_swap23 (a b c : ℝ²) :\n    signedArea2 a b c = -signedArea2 a c b := by\n  simp only [signedArea2]\n  ring\n\nprivate theorem signedArea2_cycle (a b c : ℝ²) :\n    signedArea2 a b c = signedArea2 c a b := by\n  simp only [signedArea2]\n  ring\n\ndef candidateAHits : List Hit :=\n  [(6, 8), (6, 13), (8, 6), (8, 13),\n    (11, 8), (11, 9), (13, 6), (13, 9)]\n\ndef candidateAForwardChoices : List (RowChoice Label) :=\n  [{ center := 6, support := {8, 13} },\n    { center := 8, support := {6, 13} },\n    { center := 11, support := {8, 9} },\n    { center := 13, support := {6, 9} }]\n\ndef candidateAReflectedChoices : List (RowChoice Label) :=\n  [{ center := 3, support := {7, 10} },\n    { center := 5, support := {7, 8} },\n    { center := 8, support := {3, 10} },\n    { center := 10, support := {3, 8} }]\n\ntheorem candidateAForwardCover :\n    ∀ choice ∈ candidateAForwardChoices, ∀ point ∈ choice.support,\n      (choice.center, point) ∈ candidateAHits := by\n  decide\n\ntheorem candidateAReflectedCover :\n    ∀ choice ∈ candidateAReflectedChoices, ∀ point ∈ choice.support,\n      (Fin.rev choice.center, Fin.rev point) ∈ candidateAHits := by\n  decide\n\nprivate def candidateAForwardCore {P : RowPattern Label}\n    (hrows : PositiveRowsMatch P candidateAForwardChoices) :\n    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {\n  q := 13\n  v := 11\n  u := 8\n  y := 9\n  huy := by decide\n  qu_qy := edgeClosure_of_checkPath_positive hrows\n    ⟨(13, 8), [.flip 13 8, .row 8 13 6, .flip 8 6,\n      .row 6 8 13, .flip 6 13, .row 13 6 9], (13, 9)⟩ (by decide)\n  uv_yv := edgeClosure_of_checkPath_positive hrows\n    ⟨(8, 11), [.flip 8 11, .row 11 8 9, .flip 11 9], (9, 11)⟩ (by decide) }\n\nprivate def candidateAReflectedCore {P : RowPattern Label}\n    (hrows : PositiveRowsMatch P candidateAReflectedChoices) :\n    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {\n  q := 3\n  v := 5\n  u := 8\n  y := 7\n  huy := by decide\n  qu_qy := edgeClosure_of_checkPath_positive hrows\n    ⟨(3, 8), [.flip 3 8, .row 8 3 10, .flip 8 10,\n      .row 10 8 3, .flip 10 3, .row 3 10 7], (3, 7)⟩ (by decide)\n  uv_yv := edgeClosure_of_checkPath_positive hrows\n    ⟨(8, 5), [.flip 8 5, .row 5 8 7, .flip 5 7], (7, 5)⟩ (by decide) }\n\ndef candidateBHits : List Hit :=\n  [(6, 8), (6, 13), (8, 6), (8, 13),\n    (13, 0), (13, 6), (15, 0), (15, 8)]\n\ndef candidateBForwardChoices : List (RowChoice Label) :=\n  [{ center := 6, support := {8, 13} },\n    { center := 8, support := {6, 13} },\n    { center := 13, support := {0, 6} },\n    { center := 15, support := {0, 8} }]\n\ndef candidateBReflectedChoices : List (RowChoice Label) :=\n  [{ center := 1, support := {8, 16} },\n    { center := 3, support := {10, 16} },\n    { center := 8, support := {3, 10} },\n    { center := 10, support := {3, 8} }]\n\ntheorem candidateBForwardCover :\n    ∀ choice ∈ candidateBForwardChoices, ∀ point ∈ choice.support,\n      (choice.center, point) ∈ candidateBHits := by\n  decide\n\ntheorem candidateBReflectedCover :\n    ∀ choice ∈ candidateBReflectedChoices, ∀ point ∈ choice.support,\n      (Fin.rev choice.center, Fin.rev point) ∈ candidateBHits := by\n  decide\n\nprivate def candidateBForwardCore {P : RowPattern Label}\n    (hrows : PositiveRowsMatch P candidateBForwardChoices) :\n    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {\n  q := 13\n  v := 15\n  u := 8\n  y := 0\n  huy := by decide\n  qu_qy := edgeClosure_of_checkPath_positive hrows\n    ⟨(13, 8), [.flip 13 8, .row 8 13 6, .flip 8 6,\n      .row 6 8 13, .flip 6 13, .row 13 6 0], (13, 0)⟩ (by decide)\n  uv_yv := edgeClosure_of_checkPath_positive hrows\n    ⟨(8, 15), [.flip 8 15, .row 15 8 0, .flip 15 0], (0, 15)⟩ (by decide) }\n\nprivate def candidateBReflectedCore {P : RowPattern Label}\n    (hrows : PositiveRowsMatch P candidateBReflectedChoices) :\n    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {\n  q := 3\n  v := 1\n  u := 8\n  y := 16\n  huy := by decide\n  qu_qy := edgeClosure_of_checkPath_positive hrows\n    ⟨(3, 8), [.flip 3 8, .row 8 3 10, .flip 8 10,\n      .row 10 8 3, .flip 10 3, .row 3 10 16], (3, 16)⟩ (by decide)\n  uv_yv := edgeClosure_of_checkPath_positive hrows\n    ⟨(8, 1), [.flip 8 1, .row 1 8 16, .flip 1 16], (16, 1)⟩ (by decide) }\n\nprivate theorem false_of_candidateAForwardRows\n    {P : RowPattern Label} {pointOf : Label → ℝ²}\n    (hreal : Realizes P pointOf)\n    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)\n    (hrows : PositiveRowsMatch P candidateAForwardChoices) : False := by\n  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal\n    (candidateAForwardCore hrows)\n  · change 0 < signedArea2 (pointOf 8) (pointOf 13) (pointOf 11)\n    rw [signedArea2_swap23]\n    have hneg := hneg_of_ccw hreal.injective hccw\n      (i := (8 : Label)) (j := (11 : Label)) (k := (13 : Label))\n      (by decide) (by decide)\n    linarith\n  · change 0 < signedArea2 (pointOf 9) (pointOf 13) (pointOf 11)\n    rw [signedArea2_swap23]\n    have hneg := hneg_of_ccw hreal.injective hccw\n      (i := (9 : Label)) (j := (11 : Label)) (k := (13 : Label))\n      (by decide) (by decide)\n    linarith\n\nprivate theorem false_of_candidateAReflectedRows\n    {P : RowPattern Label} {pointOf : Label → ℝ²}\n    (hreal : Realizes P pointOf)\n    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)\n    (hrows : PositiveRowsMatch P candidateAReflectedChoices) : False := by\n  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal\n    (candidateAReflectedCore hrows)\n  · change signedArea2 (pointOf 8) (pointOf 3) (pointOf 5) < 0\n    rw [signedArea2_cycle, signedArea2_cycle]\n    exact hneg_of_ccw hreal.injective hccw\n      (i := (3 : Label)) (j := (5 : Label)) (k := (8 : Label))\n      (by decide) (by decide)\n  · change signedArea2 (pointOf 7) (pointOf 3) (pointOf 5) < 0\n    rw [signedArea2_cycle, signedArea2_cycle]\n    exact hneg_of_ccw hreal.injective hccw\n      (i := (3 : Label)) (j := (5 : Label)) (k := (7 : Label))\n      (by decide) (by decide)\n\nprivate theorem false_of_candidateBForwardRows\n    {P : RowPattern Label} {pointOf : Label → ℝ²}\n    (hreal : Realizes P pointOf)\n    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)\n    (hrows : PositiveRowsMatch P candidateBForwardChoices) : False := by\n  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal\n    (candidateBForwardCore hrows)\n  · exact hneg_of_ccw hreal.injective hccw\n      (i := (8 : Label)) (j := (13 : Label)) (k := (15 : Label))\n      (by decide) (by decide)\n  · exact hneg_of_ccw hreal.injective hccw\n      (i := (0 : Label)) (j := (13 : Label)) (k := (15 : Label))\n      (by decide) (by decide)\n\nprivate theorem false_of_candidateBReflectedRows\n    {P : RowPattern Label} {pointOf : Label → ℝ²}\n    (hreal : Realizes P pointOf)\n    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)\n    (hrows : PositiveRowsMatch P candidateBReflectedChoices) : False := by\n  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal\n    (candidateBReflectedCore hrows)\n  · change 0 < signedArea2 (pointOf 8) (pointOf 3) (pointOf 1)\n    rw [signedArea2_swap13]\n    have hneg := hneg_of_ccw hreal.injective hccw\n      (i := (1 : Label)) (j := (3 : Label)) (k := (8 : Label))\n      (by decide) (by decide)\n    linarith\n  · change 0 < signedArea2 (pointOf 16) (pointOf 3) (pointOf 1)\n    rw [signedArea2_swap13]\n    have hneg := hneg_of_ccw hreal.injective hccw\n      (i := (1 : Label)) (j := (3 : Label)) (k := (16 : Label))\n      (by decide) (by decide)\n    linarith\n\nprivate theorem false_of_candidateAHits {A : Finset ℝ²}\n    (source : SourceRealization A) (order : NamedOrder)\n    (direction : Orientation) (horder : order = source.model.order)\n    (hall : ∀ hit ∈ priorOrientedHits candidateAHits order direction,\n      hit.2 ∈ source.model.selected hit.1) : False := by\n  subst order\n  have hreal := sourceRealizesBoundaryPattern source\n  by_cases hsame : source.orientation = direction\n  · exact false_of_candidateAForwardRows hreal source.boundary_ccw\n      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_same\n        source source.model.order direction rfl hsame candidateAHits\n        candidateAForwardChoices candidateAForwardCover hall)\n  · exact false_of_candidateAReflectedRows hreal source.boundary_ccw\n      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_ne\n        source source.model.order direction rfl hsame candidateAHits\n        candidateAReflectedChoices candidateAReflectedCover hall)\n\nprivate theorem false_of_candidateBHits {A : Finset ℝ²}\n    (source : SourceRealization A) (order : NamedOrder)\n    (direction : Orientation) (horder : order = source.model.order)\n    (hall : ∀ hit ∈ priorOrientedHits candidateBHits order direction,\n      hit.2 ∈ source.model.selected hit.1) : False := by\n  subst order\n  have hreal := sourceRealizesBoundaryPattern source\n  by_cases hsame : source.orientation = direction\n  · exact false_of_candidateBForwardRows hreal source.boundary_ccw\n      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_same\n        source source.model.order direction rfl hsame candidateBHits\n        candidateBForwardChoices candidateBForwardCover hall)\n  · exact false_of_candidateBReflectedRows hreal source.boundary_ccw\n      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_ne\n        source source.model.order direction rfl hsame candidateBHits\n        candidateBReflectedChoices candidateBReflectedCover hall)\n\ndef candidateAClause (order : NamedOrder) (direction : Orientation) :\n    Std.Sat.CNF.Clause Atom := occurrenceClause candidateAHits order direction\n\ndef candidateBClause (order : NamedOrder) (direction : Orientation) :\n    Std.Sat.CNF.Clause Atom := occurrenceClause candidateBHits order direction\n\ndef candidateAClauses : Std.Sat.CNF Atom := occurrenceClauses candidateAHits\n\ndef candidateBClauses : Std.Sat.CNF Atom := occurrenceClauses candidateBHits\n\ntheorem sourceAssign_candidateAClause {A : Finset ℝ²} (source : SourceRealization A)\n    (order : NamedOrder) (direction : Orientation) :\n    Std.Sat.CNF.Clause.eval (sourceAssign source.model)\n      (candidateAClause order direction) = true := by\n  apply sourceAssign_nogoodClause\n  intro horder hall\n  exact false_of_candidateAHits source order direction horder.symm hall\n\ntheorem sourceAssign_candidateBClause {A : Finset ℝ²} (source : SourceRealization A)\n    (order : NamedOrder) (direction : Orientation) :\n    Std.Sat.CNF.Clause.eval (sourceAssign source.model)\n      (candidateBClause order direction) = true := by\n  apply sourceAssign_nogoodClause\n  intro horder hall\n  exact false_of_candidateBHits source order direction horder.symm hall\n\nprivate theorem sourceAssign_occurrenceClauses {A : Finset ℝ²}\n    (source : SourceRealization A) (hits : List Hit)\n    (hvalid : ∀ order direction,\n      Std.Sat.CNF.Clause.eval (sourceAssign source.model)\n        (occurrenceClause hits order direction) = true) :\n    ∀ clause ∈ occurrenceClauses hits,\n      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by\n  intro clause hclause\n  simp only [occurrenceClauses,\n    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,\n    List.mem_flatMap, List.mem_map] at hclause\n  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause\n  exact hvalid order direction\n\ndef v6ModelCoreRefinementClauses : Std.Sat.CNF Atom :=\n  candidateAClauses ++ candidateBClauses\n\ntheorem v6ModelCoreRefinementClauses_length :\n    v6ModelCoreRefinementClauses.length = 8 := by\n  native_decide\n\ntheorem v6ModelCoreRefinementClauses_nodup :\n    v6ModelCoreRefinementClauses.Nodup := by\n  native_decide\n\ntheorem sourceAssign_v6ModelCoreRefinementClauses {A : Finset ℝ²}\n    (source : SourceRealization A) :\n    ∀ clause ∈ v6ModelCoreRefinementClauses,\n      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by\n  intro clause hclause\n  rcases List.mem_append.mp hclause with hcandidateA | hcandidateB\n  · exact sourceAssign_occurrenceClauses source candidateAHits\n      (sourceAssign_candidateAClause source) clause hcandidateA\n  · exact sourceAssign_occurrenceClauses source candidateBHits\n      (sourceAssign_candidateBClause source) clause hcandidateB\n\ndef canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf :\n    Std.Sat.CNF Atom :=\n  canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementCnf ++\n    v6ModelCoreRefinementClauses\n\ntheorem canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf_length :\n    canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf.length =\n      7409788 := by\n  simp [canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf,\n    canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementCnf_length,\n    v6ModelCoreRefinementClauses_length]\n\ntheorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf\n    {A : Finset ℝ²} (source : SourceRealization A)\n    (horder : source.model.order = 0) :\n    Std.Sat.CNF.eval (sourceAssign source.model)\n      canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf = true := by\n  rw [Std.Sat.CNF.eval, List.all_eq_true]\n  intro clause hclause\n  rcases List.mem_append.mp hclause with hparent | hsuffix\n  · have hparentEval :=\n      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementCnf\n        source horder\n    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval\n    exact hparentEval clause hparent\n  · exact sourceAssign_v6ModelCoreRefinementClauses source clause hsuffix\n\n#print axioms sourceAssign_candidateAClause\n#print axioms sourceAssign_candidateBClause\n#print axioms v6ModelCoreRefinementClauses_nodup\n#print axioms sourceAssign_v6ModelCoreRefinementClauses\n#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf\n\nend ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinements\nend Problem97\n'


def render_lean(ledger: Mapping[str, Any]) -> str:
    validate_ledger(ledger)
    if sha256_bytes(LEAN_SOURCE.encode()) != LEAN_SHA256:
        raise PromotionError("embedded Lean source hash drifted")
    return LEAN_SOURCE


def write_text_once(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.exists() or path.is_symlink():
        raise FileExistsError(f"immutable publication target exists: {path}")
    descriptor, staged_name = tempfile.mkstemp(prefix=f".{path.name}.stage-", dir=path.parent)
    staged = Path(staged_name)
    try:
        with os.fdopen(descriptor, "wb") as handle:
            handle.write(content.encode())
            handle.flush()
            os.fsync(handle.fileno())
        os.link(staged, path)
        directory = os.open(path.parent, os.O_RDONLY)
        try:
            os.fsync(directory)
        finally:
            os.close(directory)
    finally:
        staged.unlink(missing_ok=True)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--candidate-ledger", type=Path, default=LEDGER)
    parser.add_argument("--lean-output", type=Path, default=LEAN_OUTPUT)
    parser.add_argument("--verify-parent-cnf", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    ledger = load_authenticated_ledger(args.candidate_ledger)
    rendered = render_lean(ledger)
    if args.verify_parent_cnf is not None:
        verify_parent_novelty(args.verify_parent_cnf)
    if args.check:
        if not args.lean_output.is_file() or args.lean_output.read_text() != rendered:
            raise PromotionError("checked Lean output drifted")
        print(
            f"PASS {args.lean_output}: 2 candidates, {SUFFIX_CLAUSES} orbit clauses, "
            f"{len(EXPECTED_STRICT_NEW_INDICES)} strict-new clauses, "
            f"{ROOT_CLAUSES} root clauses"
        )
        return 0
    write_text_once(args.lean_output, rendered)
    print(
        f"generated {args.lean_output}: 2 candidates, {SUFFIX_CLAUSES} orbit clauses, "
        f"{len(EXPECTED_STRICT_NEW_INDICES)} strict-new clauses, "
        f"{ROOT_CLAUSES} root clauses"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
