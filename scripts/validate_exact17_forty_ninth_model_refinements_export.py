"""Fail-closed validator for the authenticated FortyNinth model2 export."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

import validate_exact17_weighted_successor_model_export as _base

ROOT = Path(__file__).resolve().parents[1]
PARENT_PATH = ROOT / (
    "scratch/runs/exact17-weighted-successor-model-publication-20260816/"
    "export-v1/artifacts/exact17-weighted-successor-model.cnf"
)
CHILD_PATH = ROOT / (
    "scratch/runs/exact17-forty-ninth-publication-20260816/"
    "export-v1/artifacts/exact17-forty-ninth-model-refinements.cnf"
)
MINE_PATH = ROOT / "scratch/exact17-weighted-successor-model2-mine-20260816.json"
LEAN_ROOT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthModelRefinements.lean"
)
LEAN_EXPORT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthModelRefinementsExport.lean"
)
PARENT_LEAN_ROOT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyEighthModelRefinements.lean"
)
PARENT_LEAN_EXPORT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyEighthModelRefinementsExport.lean"
)
SOURCE_BRIDGE_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenWeightedKalmansonSourceBridge.lean"
)

SOURCE_COMMIT = "a85c515c39ee81b2b8ea4ca5736e6f87e22715f1"
PARENT_SOURCE_COMMIT = "f9bc60a3b7f3350ea4aa00b150eb0d26c4e06025"
SOURCE_BRIDGE_COMMIT = "f78cade13a875a2c6b4fdd9482c0d2c89c14624f"
LEAN_ROOT_SHA256 = "2eeff7f73493c30fd6c10336b995cf92bbe5ce05c8d037a83774158dbe8e9996"
SOURCE_BASELINE_SHA256 = LEAN_ROOT_SHA256
LEAN_EXPORT_SHA256 = "a2e9c0e4a37807d31bf214fbf410eba1e3ace65c41261838f0f309598116239a"
PARENT_LEAN_ROOT_SHA256 = (
    "892af2212af847a57a27349867d939b8c8cfab7e1b4e9fc1123751bfa6fc92fb"
)
PARENT_LEAN_EXPORT_SHA256 = (
    "be94b2db36158e575793a44672aaacfd5dee8af03eb1e2c79f592761e43dc860"
)
SOURCE_BRIDGE_SHA256 = (
    "7eae140b28dfed1c6765b29140f06846e150121d05e747179010a075f3e69e92"
)
MINE_SHA256 = "f95698d9d28a3a82f531bec93997c14623ab4add2dd9f871b7ec71cb3cf43abf"
PARENT_SHA256 = "a6f0f7446db91f827e2614bfe514fd545b202370cc17831a9cefc665bc5e6b1a"
PARENT_BYTES = 338_648_598
PARENT_CLAUSES = 7_198_472
CHILD_CLAUSES = 7_198_668
CHILD_BYTES = 338_661_334
CHILD_SHA256 = "5b95f49958ec25f6d893bc27af748d93e93073256763b81842c7d16f23d7a4c5"
VARIABLES = 308
OCCURRENCES = 49
CLAUSES_PER_OCCURRENCE = 4
SUFFIX_CLAUSES = 196
VALIDATION_SCHEMA = "p97-exact17-forty-ninth-model-refinements-export-validation/v1"
EXPECTED_SUFFIX_SHA256 = (
    "4c5c831aa026ad0c74055413f7814b9fc371a5dc02122254d899af1d6f47c4a8"
)
EXPECTED_PARENT_SUBSUMED_SUFFIX_INDICES = (
    7,
    9,
    11,
    12,
    17,
    19,
    21,
    23,
    25,
    27,
    29,
    31,
    33,
    35,
    37,
    39,
    40,
    41,
    43,
    44,
    45,
    47,
    48,
    49,
    51,
    52,
    53,
    55,
    56,
    57,
    59,
    61,
    63,
    65,
    69,
    71,
    73,
    75,
    76,
    77,
    80,
    81,
    84,
    85,
    87,
    88,
    89,
    92,
    93,
    96,
    97,
    99,
    101,
    103,
    105,
    107,
    109,
    113,
    116,
    117,
    119,
    121,
    124,
    125,
    128,
    129,
    132,
    133,
    135,
    137,
    140,
    141,
    144,
    145,
    148,
    149,
    151,
    153,
    156,
    157,
    160,
    161,
    165,
    169,
    172,
    173,
    176,
    177,
    180,
    181,
    183,
    184,
    185,
    187,
    188,
    189,
    192,
    193,
)
EXPECTED_PARENT_SUBSUMPTION_WITNESS_COUNTS = (
    1,
    3,
    1,
    1,
    2,
    2,
    1,
    1,
    2,
    3,
    3,
    5,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    2,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    2,
    2,
    1,
    2,
    1,
    2,
    1,
    1,
    1,
    1,
    2,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    2,
    2,
    1,
    1,
    1,
    1,
    1,
    2,
    1,
    2,
    1,
    2,
    1,
    3,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    2,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    2,
    1,
    1,
    2,
    1,
    2,
    1,
    1,
    1,
)

_ORDERS = _base._ORDERS
ExportSpec = _base.ExportSpec
_open_regular_nofollow = _base._open_regular_nofollow
sha256_file = _base.sha256_file
PRODUCTION_SPEC = ExportSpec(
    parent_sha256=PARENT_SHA256,
    parent_bytes=PARENT_BYTES,
    parent_clauses=PARENT_CLAUSES,
    child_sha256=CHILD_SHA256,
    child_bytes=CHILD_BYTES,
    child_clauses=CHILD_CLAUSES,
    variables=VARIABLES,
)


def _mine() -> dict[str, object]:
    raw = MINE_PATH.read_bytes()
    if hashlib.sha256(raw).hexdigest() != MINE_SHA256:
        raise ValueError("authenticated model2 mine hash drifted")
    mine = json.loads(raw)
    if mine.get("schema") != "exact17-weighted-successor-model2-mine/v1":
        raise ValueError("model2 mine schema drifted")
    if mine.get("status") != "PASS":
        raise ValueError("model2 mine status drifted")
    provenance = mine["provenance"]
    if (
        provenance.get("model_backend") != "cadical"
        or provenance.get("model_result") != "SAT"
        or not all(
            isinstance(provenance.get(key), str)
            and len(provenance[key]) == 64
            and all(c in "0123456789abcdef" for c in provenance[key])
            for key in (
                "custody_seal_file_sha256",
                "model_artifact_sha256",
                "model_assignment_sha256",
                "receipt_file_sha256",
            )
        )
        or provenance.get("terminal", {}).get("status") != "PASS"
        or provenance.get("terminal", {}).get("verdict") != "SAT"
    ):
        raise ValueError("model2 mine custody provenance drifted")
    if provenance["root"] != {
        "sha256": PARENT_SHA256,
        "bytes": PARENT_BYTES,
        "variables": VARIABLES,
        "clauses": PARENT_CLAUSES,
    }:
        raise ValueError("model2 mine parent root binding drifted")
    replay = mine["replay"]
    if (
        replay.get("weighted_exact_replay", {}).get("atom_indices") != [56, 674]
        or replay.get("weighted_exact_replay", {}).get("source_consumer")
        != "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.false_of_weightedKalmansonCancellationData_of_check"
        or replay.get("weighted_exact_replay", {}).get("status")
        != "LINEARLY_INFEASIBLE"
    ):
        raise ValueError("model2 weighted replay provenance drifted")
    cumulative = mine["cumulative_source_bank"]
    if (
        cumulative.get("orientation_support_count") != 42
        or cumulative.get("prior_occurrence_count") != 21
        or cumulative.get("sources")
        != [
            {
                "path": "scratch/exact17-weighted-kalmanson-current-model-occurrences.json",
                "sha256": "f74c1d59bd287fbadba88dcb5fa179034acbab50464b97fbde99db9aa373a499",
            },
            {
                "path": "scratch/exact17-weighted-kalmanson-successor-model-mine-20260816.json",
                "sha256": "b1bfe11046d863870647d329f4076e9ccab6b68cbafae92db264ab3fb9087e75",
            },
        ]
    ):
        raise ValueError("model2 cumulative source provenance drifted")
    scan = mine["producer_scan"]
    if (
        scan["new_source_valid_count"] != OCCURRENCES
        or mine["conclusion"]["new_source_valid_occurrence_clauses_if_banked"]
        != SUFFIX_CLAUSES
        or scan["subset_minimal_count"] != OCCURRENCES
    ):
        raise ValueError("model2 mine occurrence census drifted")
    return mine


def _supports() -> tuple[tuple[tuple[int, int], ...], ...]:
    return tuple(
        tuple(tuple(pair) for pair in row["support"])
        for row in _mine()["producer_scan"]["new_minimal_motif_supports"]
    )


def _clause_line(
    support: tuple[tuple[int, int], ...], order: int, reverse: bool
) -> bytes:
    return _base._clause_line(support, order, reverse)


def expected_suffix_lines():
    for support in _supports():
        for order in range(2):
            for reverse in (False, True):
                yield _clause_line(support, order, reverse)


def _validate_export(
    parent_path=PARENT_PATH, child_path=CHILD_PATH, *, check_support=True, spec=None
):
    _base.PARENT_PATH = PARENT_PATH
    _base.CHILD_PATH = CHILD_PATH
    _base.MINE_PATH = MINE_PATH
    _base.LEAN_ROOT_PATH = LEAN_ROOT_PATH
    _base.LEAN_EXPORT_PATH = LEAN_EXPORT_PATH
    _base.PARENT_LEAN_ROOT_PATH = PARENT_LEAN_ROOT_PATH
    _base.PARENT_LEAN_EXPORT_PATH = PARENT_LEAN_EXPORT_PATH
    _base.SOURCE_BRIDGE_PATH = SOURCE_BRIDGE_PATH
    for name in (
        "SOURCE_COMMIT",
        "PARENT_SOURCE_COMMIT",
        "SOURCE_BRIDGE_COMMIT",
        "LEAN_ROOT_SHA256",
        "SOURCE_BASELINE_SHA256",
        "LEAN_EXPORT_SHA256",
        "PARENT_LEAN_ROOT_SHA256",
        "PARENT_LEAN_EXPORT_SHA256",
        "SOURCE_BRIDGE_SHA256",
        "MINE_SHA256",
        "PARENT_SHA256",
        "PARENT_BYTES",
        "PARENT_CLAUSES",
        "CHILD_CLAUSES",
        "CHILD_BYTES",
        "CHILD_SHA256",
        "VARIABLES",
        "OCCURRENCES",
        "CLAUSES_PER_OCCURRENCE",
        "SUFFIX_CLAUSES",
        "VALIDATION_SCHEMA",
    ):
        setattr(_base, name, globals()[name])
    _base._mine = _mine
    _base.expected_suffix_lines = expected_suffix_lines
    _base._SUPPORTS = _supports()
    production = _base.ExportSpec(
        parent_sha256=PARENT_SHA256,
        parent_bytes=PARENT_BYTES,
        parent_clauses=PARENT_CLAUSES,
        child_sha256=CHILD_SHA256,
        child_bytes=CHILD_BYTES,
        child_clauses=CHILD_CLAUSES,
        variables=VARIABLES,
    )
    result = _base._validate_export(
        parent_path, child_path, check_support=check_support, spec=spec or production
    )
    suffix = result["suffix"]
    census = result["parent_subsumption_census"]
    if suffix["sha256"] != EXPECTED_SUFFIX_SHA256:
        raise ValueError("ordered FortyNinth suffix digest drifted")
    if (
        tuple(census["parent_subsumed_suffix_clause_indices"])
        != EXPECTED_PARENT_SUBSUMED_SUFFIX_INDICES
    ):
        raise ValueError("parent-subsumption index census drifted")
    if tuple(census["witness_counts"]) != EXPECTED_PARENT_SUBSUMPTION_WITNESS_COUNTS:
        raise ValueError(
            f"parent-subsumption witness census drifted: {census['witness_counts']!r}"
        )
    if census["witness_total"] != 128:
        raise ValueError("parent-subsumption witness total drifted")
    return result


def validate_export(parent_path: Path = PARENT_PATH, child_path: Path = CHILD_PATH):
    return _validate_export(parent_path, child_path)


if __name__ == "__main__":
    print(json.dumps(validate_export(), indent=2, sort_keys=True))
