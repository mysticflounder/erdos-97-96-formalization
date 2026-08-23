"""Promote the authenticated V6-wave two-Kalmanson cancellations into V7.

The immutable ledger contains nine source-valid cancellation occurrences.  This
generator structurally replays every occurrence, banks the complete 36-clause
named-order/orientation orbit, and appends only the 22 clauses that remain new
after both the V5 physical-none parent prefix and the V6 model-core suffix.
"""

from __future__ import annotations

import argparse
import importlib.util
import sys
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any, NamedTuple

REPO = Path(__file__).resolve().parents[1]
SCRIPTS = REPO / "scripts"
sys.path.insert(0, str(SCRIPTS))
sys.path.insert(0, str(REPO))


def _load(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load helper {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


V4 = _load(
    "exact17_v7_twok_v4_helper",
    SCRIPTS / "generate_exact17_four_point_two_circle_v4_two_kalmanson_refinements.py",
)
COMBINED = _load(
    "exact17_v7_twok_combined_helper",
    SCRIPTS / "generate_exact17_four_point_two_circle_v4_combined_refinements.py",
)

PromotionError = V4.PromotionError
canonical_json_bytes = V4.canonical_json_bytes
sha256_bytes = V4.sha256_bytes
self_hash = V4.self_hash
strict_json = V4.strict_json
require_exact_keys = V4.require_exact_keys
candidate_id = V4.candidate_id
lean_occurrence = V4.lean_occurrence
lean_occurrence_check = V4.lean_occurrence_check
path_hits = V4.path_hits
reflected = V4.reflected
write_text_once = V4.V2.write_text_once

LEDGER = (
    REPO
    / "scratch/runs/exact17-canary-perp-bisector-survivor-four-point-two-circle-"
    "v5-canary-two-kalmanson-refinements-sat-portfolio-v6-20260823/"
    "sat-profile-portfolio-v6/artifacts/candidate-ledger.json"
)
LEDGER_SHA256 = "ed2abfe2b9606875749bacd85d88dfd953c783ac51d6b8ce20df3cbe5a96ee9d"
V6_LEAN = (
    REPO
    / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircle"
    "V6ModelCoreRefinements.lean"
)
V6_LEAN_SHA256 = "c517298188954bf71575c2fe4dab49a1fe9f278d975bf29c1e5c9bc5e592967c"
PARENT_CNF = (
    REPO
    / "scratch/runs/exact17-v5-canary-twok-successor-preparer-20260823/"
    "preparation-v1/artifacts/cells/"
    "canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-"
    "kalmanson-refinements-next-center-02-physical-none/"
    "canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-"
    "kalmanson-refinements-next-center-02-physical-none.cnf"
)
PARENT_CNF_SHA256 = "372c8bf73855b0e56b92106d3d463d58f6b497abfdc26456a27e2240aeca883a"
PARENT_CNF_BYTES = 346_304_035
PARENT_PHYSICAL_CLAUSES = 7_409_786
V5_ROOT_CLAUSES = 7_409_780
V6_SUFFIX_CLAUSES = 8
V6_ROOT_CLAUSES = 7_409_788
V7_SUFFIX_CLAUSES = 22
V7_ROOT_CLAUSES = 7_409_810
NUM_VARIABLES = 308
N = 17

LEDGER_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-"
    "two-kalmanson-v6-wave-only-candidate-ledger/v1"
)
CANDIDATE_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-"
    "two-kalmanson-v6-wave-only-candidate/v1"
)
FAMILY = "two-kalmanson-cancellation"
CORE_FAMILY = "formalized-core-bank"
COMPONENT_FAMILY = "perpendicular-bisector-equality-component"
CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
    "false_of_twoKalmansonCancellationData_of_check"
)
CORE_CONSUMERS = (
    "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core",
    "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg",
)

EXPECTED_TOTAL_CANDIDATES = 11
EXPECTED_OCCURRENCES = 9
EXPECTED_ORBIT_CLAUSES = 36
EXPECTED_ORDER = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
EXPECTED_SOURCE_VALID_FAMILIES = [CORE_FAMILY, COMPONENT_FAMILY, FAMILY]
EXPECTED_DECODED_SHA256 = "be539444033cbe72dd11719a2bfc1c3a8e5a08ff583f4e320225f8c5589c6b26"
EXPECTED_FAMILY_INVENTORY_SHA256 = "6c6c4c30a8cd1cdae9606614e5a1356491f973b89618aa332036d8206ce873d5"
EXPECTED_SCANNER_DEPENDENCIES_SHA256 = (
    "3e232caf056cd661f87a38c578dbe899dbd9d3d1ff7198129526fc96922cb8df"
)
EXPECTED_ORBIT_JSON_SHA256 = "5dfc3a4c54cc91def718b97ba79c0bc9bf7170b446a9cf9d74cea8e4cd053361"
EXPECTED_V6_SUFFIX_JSON_SHA256 = (
    "c66a1563485004c237ca396ea2c485e84837042f1dd92b2a1e32dc0aeb121ffe"
)
EXPECTED_V5_NOVELTY_CENSUS_SHA256 = (
    "280e0ee15195fd4c4ad755d0261726561e54e8765add5695b0774fd2294f6e1a"
)
EXPECTED_V5_EXACT_MULTIPLICITY = (0,) * EXPECTED_ORBIT_CLAUSES
EXPECTED_V5_STRICT_SUBSUMER_MULTIPLICITY = (
    0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0,
    1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 1, 1, 0, 0, 1, 0,
)
EXPECTED_V6_EXACT_DUPLICATE_INDICES = (16, 17, 19, 28)
EXPECTED_PARENT_SUBSUMED_INDICES = (2, 10, 11, 15, 18, 22, 29, 30, 31, 34)
EXPECTED_STRICT_NEW_INDICES = (
    0, 1, 3, 4, 5, 6, 7, 8, 9, 12, 13, 14, 20, 21, 23, 24, 25, 26,
    27, 32, 33, 35,
)
EXPECTED_STRICT_NEW_JSON_SHA256 = (
    "3b490543c3dc09319128ef749cdd48cc981bcf86d3afb8560319745c655a0765"
)

EXPECTED_TOP_VALUES = {
    "cnf_sha256": PARENT_CNF_SHA256,
    "job_id": "563adc46-95db-429e-8ece-acf4e66bef47",
    "model_sha256": "d1d45c37f9241a20e06867d208785f5fe960dc537e045854800d6d8e45afa1b9",
    "portfolio_cell_id": (
        "canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-"
        "kalmanson-refinements-next-center-02-physical-none-canary-two-"
        "kalmanson-v6-sat-profile-v1"
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
EXPECTED_SCANNER = {
    "name": (
        "exact17-survivor-four-point-two-circle-v5-canary-two-kalmanson-v6-"
        "source-valid-theorem-miner"
    ),
    "schema": (
        "p97-exact17-survivor-four-point-two-circle-v5-canary-two-kalmanson-v6-"
        "source-valid-theorem-miner/v1"
    ),
    "source_path": (
        "scripts/mine_exact17_canary_perp_bisector_survivor_four_point_two_"
        "circle_v5_canary_two_kalmanson_refinements_sat_model.py"
    ),
    "source_sha256": "da467541586eaecd960f29f6b3200e6917ee121e46e6100ff4f434c9f7e39a82",
    "version": "6",
}

EXPECTED_CANDIDATE_RECORDS = (
    ("formalized-core-bank:1a1080d346bcaadab3a96fdca5b20a0a456af2c54aed69b1fb9976696be59eee", "6d8a8d95ef093fc44f7cd6b3dfa77c792e142ac70e149b245e3ccd8aa804131d"),
    ("formalized-core-bank:ed1a4ada58283d9ce8bcf7744fb364b390d3d7c433ca043721859bd417df690f", "2f31a7bb0dc2e3ae108956781b21812b2bb8893d5d2dc8f9deadfb7c129f95db"),
    ("two-kalmanson-cancellation:017eec9ddfe9c4fd6b80a8eb68c17333bd9ae445a4152c147ee83ac04f663cd6", "c759d885690fece11e853bd187a3b50b7e54993c0aa6989093e9c25f83801886"),
    ("two-kalmanson-cancellation:05959a55c6618ba2d0b4a145aaa307d8aa52dd1fda7c6e3003a1042a848b51c5", "d0260d7f57a25c6c8d78841e153ad134cd31280a60de15108520f399f563ecb0"),
    ("two-kalmanson-cancellation:0e0d9590ca4631da66599501b83c4fa4bc984f7ce5e8562dba7bd220d860bb9e", "593c1577594b19ffefdb071cae4a47bfc501875767726b93a8de609467487a56"),
    ("two-kalmanson-cancellation:1af62b838324fe7e7eb25180c2be12a61fe6fee6349f99787ad3f26146cc1b20", "b945b77810d0a02acd95cd53ba84b756997c1473cfc013c4dcdf28b9d6208880"),
    ("two-kalmanson-cancellation:7780409962d05ecba519ed19d4de552d62edd0d3d00eea5bcfbe2b2e39005b79", "7e8980bfc89b5e04984af6e897d785233687f1ea153694d026e49ec2e1be2640"),
    ("two-kalmanson-cancellation:8b4da8aa869def13c08d142dba78afdfdace32fa2c07e9296cd38debf72ffe39", "b4d764c4060570f539d1db36739b7cbdf8b8d86f7c12354b291540dddf019817"),
    ("two-kalmanson-cancellation:d40686cd3e85a748b720dd97c281c33dfb7dadf9c6c4a02e81f96a7a300920ee", "e43e30355b7508350886c0a65500f99798119cf91fb6015dccceb19cfe23fa44"),
    ("two-kalmanson-cancellation:f254444f1bd1f776f2f65243c904250b45a79db29955419610f6a182f156ffa3", "523e5be3b1453a0bdd116ad91695659ca2c03ecda4ad2c97bce4e7b66f6063eb"),
    ("two-kalmanson-cancellation:f8b10c9de7a1a58ad7140476726c4a178650f63452e04230e69aec39a837e7ae", "baf3442efa65685ff7b5e4f8a16bc8c2f3f2d3085dcab375ae525b4720fface8"),
)
EXPECTED_CANDIDATE_ORBIT_SHA256 = (
    "e5d0b8d1c955e99750d78565ddcb9d2ca98a70316c0bed14005e5d90169f885a",
    "9ce394d44ae7421d2bef2e40770aca8364e6cfd73b8895368c60969d97d54230",
    "1e07b44bd8d2b76379d3c0d63ab4baef4549ea017680b846d3178a65036f1799",
    "81c643f1fd9d961ee885005e767d4ce67cf4ffce2b7a56e84eac586703f82a2c",
    "e931419bf5c12b7d11f663d8068c96074359a2cdd0deb453506dd8d678646173",
    "539c0a8e5ef04ab91ae617c8ad1f3b3b7e3d60c3cce45a74dacf980127684c61",
    "1bcdb3b9e941f406e91b89f408a171b29db0dfc9eef967ae8e8ae2aa73b8b9a8",
    "9ad251e65d18f05df32f0a13584183ed94323dc168c01acf2cd002a533d81606",
    "681faf158d92e7016c6421b5c6209f43bbf2a95b5b9751c66faff0772190628e",
)

TOP_KEYS = {
    "candidates", "candidates_examined", "cnf_sha256", "complete_no_candidates",
    "decoded_selectors", "family_inventory", "job_id", "manifest_sha256",
    "model_sha256", "portfolio_cell_id", "producer_manifest_sha256",
    "scan_complete", "scanner", "scanner_dependencies", "schema",
    "source_valid_family_inventory", "source_valid_only", "status",
    "variable_map_sha256", "wave_manifest_sha256",
}
CANDIDATE_KEYS = {
    "candidate_id", "family", "lean_consumer", "payload", "record_sha256",
    "schema", "source_valid", "support",
}
TWOK_PAYLOAD_KEYS = {
    "forward", "forward_path_support", "occurrence_union_cover",
    "paired_forward_reverse_replay", "reverse", "reverse_path_support",
}

Occurrence = tuple[frozenset[tuple[int, int]], Mapping[str, Any], Mapping[str, Any]]


class ImmediateParentNovelty(NamedTuple):
    v6_exact_duplicate_indices: tuple[int, ...]
    parent_subsumed_indices: tuple[int, ...]
    strict_new_indices: tuple[int, ...]


def _canonical_sha256(value: Any) -> str:
    return sha256_bytes(canonical_json_bytes(value))


def _rows_and_order(ledger: Mapping[str, Any]) -> tuple[list[Any], tuple[int, ...]]:
    return V4._rows_and_order(ledger)


def _support(candidate: Mapping[str, Any]) -> frozenset[tuple[int, int]]:
    return V4._support(candidate)


def validate_ledger(ledger: Mapping[str, Any]) -> list[Occurrence]:
    require_exact_keys(ledger, TOP_KEYS, "candidate ledger")
    if ledger.get("schema") != LEDGER_SCHEMA or ledger.get("status") != "COMPLETE":
        raise PromotionError("candidate ledger schema/status drifted")
    if ledger.get("manifest_sha256") != self_hash(ledger, "manifest_sha256"):
        raise PromotionError("candidate ledger self-hash drifted")
    if ledger.get("scan_complete") is not True or ledger.get("source_valid_only") is not True:
        raise PromotionError("candidate ledger is not a complete source-valid scan")
    if ledger.get("complete_no_candidates") is not False:
        raise PromotionError("candidate ledger incorrectly reports no candidates")
    if ledger.get("candidates_examined") != EXPECTED_TOTAL_CANDIDATES:
        raise PromotionError("candidate ledger census drifted")
    for key, expected in EXPECTED_TOP_VALUES.items():
        if ledger.get(key) != expected:
            raise PromotionError(f"candidate ledger {key} drifted")
    if ledger.get("scanner") != EXPECTED_SCANNER:
        raise PromotionError("candidate ledger scanner drifted")
    if ledger.get("source_valid_family_inventory") != EXPECTED_SOURCE_VALID_FAMILIES:
        raise PromotionError("source-valid family inventory drifted")
    if _canonical_sha256(ledger.get("decoded_selectors")) != EXPECTED_DECODED_SHA256:
        raise PromotionError("decoded source selectors drifted")
    if _canonical_sha256(ledger.get("family_inventory")) != EXPECTED_FAMILY_INVENTORY_SHA256:
        raise PromotionError("candidate family inventory drifted")
    if _canonical_sha256(ledger.get("scanner_dependencies")) != EXPECTED_SCANNER_DEPENDENCIES_SHA256:
        raise PromotionError("scanner dependency inventory drifted")

    candidates = ledger.get("candidates")
    if type(candidates) is not list or len(candidates) != EXPECTED_TOTAL_CANDIDATES:
        raise PromotionError("candidate record count drifted")
    rows, order = _rows_and_order(ledger)
    if order != EXPECTED_ORDER:
        raise PromotionError("decoded order drifted")
    reverse_order = tuple(reversed(order))
    occurrences: list[Occurrence] = []
    seen_supports: set[frozenset[tuple[int, int]]] = set()
    for index, (raw_candidate, expected_record) in enumerate(
        zip(candidates, EXPECTED_CANDIDATE_RECORDS, strict=True)
    ):
        candidate = require_exact_keys(raw_candidate, CANDIDATE_KEYS, f"candidate {index}")
        if candidate.get("schema") != CANDIDATE_SCHEMA or candidate.get("source_valid") is not True:
            raise PromotionError(f"candidate {index} schema/source-valid flag drifted")
        if (candidate.get("candidate_id"), candidate.get("record_sha256")) != expected_record:
            raise PromotionError(f"candidate {index} authenticated identity drifted")
        if candidate.get("candidate_id") != candidate_id(candidate):
            raise PromotionError(f"candidate {index} identity replay failed")
        if candidate.get("record_sha256") != self_hash(candidate, "record_sha256"):
            raise PromotionError(f"candidate {index} record self-hash drifted")
        family = candidate.get("family")
        if index < 2:
            if family != CORE_FAMILY or candidate.get("lean_consumer") != CORE_CONSUMERS[index]:
                raise PromotionError(f"candidate {index} formalized-core record drifted")
            _support(candidate)
            continue
        if family != FAMILY or candidate.get("lean_consumer") != CONSUMER:
            raise PromotionError(f"candidate {index} two-Kalmanson binding drifted")
        payload = require_exact_keys(candidate.get("payload"), TWOK_PAYLOAD_KEYS, f"candidate {index} payload")
        if payload.get("paired_forward_reverse_replay") is not True or payload.get("occurrence_union_cover") is not True:
            raise PromotionError(f"candidate {index} pairing certificate drifted")
        forward, reverse = payload.get("forward"), payload.get("reverse")
        if type(forward) is not dict or type(reverse) is not dict:
            raise PromotionError(f"candidate {index} path records are malformed")
        hits = _support(candidate)
        if hits in seen_supports:
            raise PromotionError("two-Kalmanson support is duplicated")
        seen_supports.add(hits)
        forward_support = path_hits(forward)
        reverse_support = path_hits(reverse)
        if (
            forward_support != frozenset(tuple(hit) for hit in payload.get("forward_path_support", []))
            or reverse_support != frozenset(tuple(hit) for hit in payload.get("reverse_path_support", []))
            or not forward_support <= hits
            or not reflected(reverse_support) <= hits
        ):
            raise PromotionError(f"candidate {index} support/path certificate drifted")
        if forward.get("projection", {}).get("order") != list(order) or reverse.get("projection", {}).get("order") != list(reverse_order):
            raise PromotionError(f"candidate {index} projection order drifted")
        if not lean_occurrence_check(
            hits,
            forward,
            reverse,
            rows=rows,
            forward_order=order,
            reverse_order=reverse_order,
        ):
            raise PromotionError(f"candidate {index} structural Lean replay failed")
        occurrences.append((hits, forward, reverse))
    if len(occurrences) != EXPECTED_OCCURRENCES:
        raise PromotionError("two-Kalmanson occurrence count drifted")
    clauses = render_orbit_clauses(occurrences)
    if len(clauses) != EXPECTED_ORBIT_CLAUSES or len(set(clauses)) != EXPECTED_ORBIT_CLAUSES:
        raise PromotionError("two-Kalmanson orbit is not a 36-clause set")
    if _canonical_sha256([list(clause) for clause in clauses]) != EXPECTED_ORBIT_JSON_SHA256:
        raise PromotionError("ordered 36-clause orbit hash drifted")
    for occurrence, expected_hash in zip(occurrences, EXPECTED_CANDIDATE_ORBIT_SHA256, strict=True):
        orbit = V4.orbit_clauses(occurrence[0])
        if _canonical_sha256([list(clause) for clause in orbit]) != expected_hash:
            raise PromotionError("candidate orbit hash drifted")
    production = strict_new_clauses(clauses)
    if _canonical_sha256([list(clause) for clause in production]) != EXPECTED_STRICT_NEW_JSON_SHA256:
        raise PromotionError("ordered V7 production suffix hash drifted")
    return occurrences


def load_authenticated_ledger(path: Path = LEDGER) -> dict[str, Any]:
    if path.is_symlink() or not path.is_file() or path.resolve() != LEDGER.resolve():
        raise PromotionError("candidate ledger path drifted")
    raw = path.read_bytes()
    if sha256_bytes(raw) != LEDGER_SHA256:
        raise PromotionError("candidate ledger byte hash drifted")
    ledger = strict_json(raw)
    validate_ledger(ledger)
    return ledger


def render_orbit_clauses(occurrences: Sequence[Occurrence]) -> tuple[tuple[int, ...], ...]:
    return tuple(
        clause
        for hits, _forward, _reverse in occurrences
        for clause in V4.orbit_clauses(hits)
    )


def strict_new_clauses(clauses: Sequence[tuple[int, ...]]) -> tuple[tuple[int, ...], ...]:
    if len(clauses) != EXPECTED_ORBIT_CLAUSES:
        raise PromotionError("orbit clause count drifted")
    result = tuple(clauses[index] for index in EXPECTED_STRICT_NEW_INDICES)
    if len(result) != V7_SUFFIX_CLAUSES or len(set(result)) != V7_SUFFIX_CLAUSES:
        raise PromotionError("V7 production suffix is not a 22-clause set")
    return result


def _v6_suffix_clauses() -> tuple[tuple[int, ...], ...]:
    candidate_a = frozenset(
        ((6, 8), (6, 13), (8, 6), (8, 13), (11, 8), (11, 9), (13, 6), (13, 9))
    )
    candidate_b = frozenset(
        ((6, 8), (6, 13), (8, 6), (8, 13), (13, 0), (13, 6), (15, 0), (15, 8))
    )
    clauses = V4.orbit_clauses(candidate_a) + V4.orbit_clauses(candidate_b)
    if _canonical_sha256([list(clause) for clause in clauses]) != EXPECTED_V6_SUFFIX_JSON_SHA256:
        raise PromotionError("V6 model-core suffix hash drifted")
    return clauses


def verify_v6_parent_source(path: Path = V6_LEAN) -> None:
    if path.is_symlink() or not path.is_file() or path.resolve() != V6_LEAN.resolve():
        raise PromotionError("V6 Lean parent path drifted")
    if sha256_bytes(path.read_bytes()) != V6_LEAN_SHA256:
        raise PromotionError("V6 Lean parent byte hash drifted")


def verify_immediate_parent_novelty(
    occurrences: Sequence[Occurrence], parent_cnf: Path = PARENT_CNF
) -> ImmediateParentNovelty:
    verify_v6_parent_source()
    clauses = render_orbit_clauses(occurrences)
    baseline = COMBINED.classify_parent_prefix_novelty(
        parent_cnf,
        clauses,
        expected_sha256=PARENT_CNF_SHA256,
        expected_bytes=PARENT_CNF_BYTES,
        expected_num_variables=NUM_VARIABLES,
        expected_total_clauses=PARENT_PHYSICAL_CLAUSES,
        parent_prefix_clauses=V5_ROOT_CLAUSES,
    )
    if baseline.exact_duplicate_multiplicities != EXPECTED_V5_EXACT_MULTIPLICITY:
        raise PromotionError("V5 parent exact-duplicate census drifted")
    if baseline.strict_subsumer_multiplicities != EXPECTED_V5_STRICT_SUBSUMER_MULTIPLICITY:
        raise PromotionError("V5 parent strict-subsumption census drifted")
    if baseline.census_sha256 != EXPECTED_V5_NOVELTY_CENSUS_SHA256:
        raise PromotionError("V5 parent novelty census hash drifted")

    parent_subsumed = tuple(
        index
        for index, count in enumerate(baseline.strict_subsumer_multiplicities)
        if count
    )
    v6_clause_set = set(_v6_suffix_clauses())
    v6_exact = tuple(
        index
        for index, clause in enumerate(clauses)
        if index not in parent_subsumed and clause in v6_clause_set
    )
    strict_new = tuple(
        index
        for index in range(len(clauses))
        if index not in parent_subsumed and index not in v6_exact
    )
    result = ImmediateParentNovelty(v6_exact, parent_subsumed, strict_new)
    if result != ImmediateParentNovelty(
        EXPECTED_V6_EXACT_DUPLICATE_INDICES,
        EXPECTED_PARENT_SUBSUMED_INDICES,
        EXPECTED_STRICT_NEW_INDICES,
    ):
        raise PromotionError("immediate V6 parent novelty partition drifted")
    return result


def _occurrence_refinement_expression(index: int) -> str:
    occurrence = index // 4
    within = index % 4
    order = within // 2
    direction = ".forward" if within % 2 == 0 else ".reverse"
    return (
        f"occurrenceClause v7CancellationOccurrence{occurrence}.hits "
        f"{order} {direction}"
    )


def render_lean(ledger: Mapping[str, Any]) -> str:
    occurrences = validate_ledger(ledger)
    definitions = []
    for index, (hits, forward, reverse) in enumerate(occurrences):
        body = lean_occurrence(hits, forward, reverse).lstrip()
        definitions.append(
            f"def v7CancellationOccurrence{index} : CancellationOccurrence :=\n  {body}"
        )
    definitions_text = "\n\n".join(definitions)
    names = ", ".join(f"v7CancellationOccurrence{index}" for index in range(EXPECTED_OCCURRENCES))
    expressions = ",\n    ".join(
        _occurrence_refinement_expression(index) for index in EXPECTED_STRICT_NEW_INDICES
    )
    return f'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinements

/-!
Source-valid V7 two-Kalmanson bank over the V6 model-core root.

The authenticated ledger `{LEDGER_SHA256}` supplies nine checked cancellation
occurrences and a 36-clause order/orientation orbit (`{EXPECTED_ORBIT_JSON_SHA256}`).
The production suffix contains exactly the 22 clauses still new against the
immediate V6 parent (`{EXPECTED_STRICT_NEW_JSON_SHA256}`).
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementSurvivorRefinements
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinements

private abbrev occurrenceClause :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

{definitions_text}

def v7CancellationOccurrences : List CancellationOccurrence :=
  [{names}]

theorem v7CancellationOccurrences_length :
    v7CancellationOccurrences.length = {EXPECTED_OCCURRENCES} := by
  native_decide

theorem v7CancellationOccurrences_all_check :
    v7CancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def v7TwoKalmansonOrbitClauses : Std.Sat.CNF Atom :=
  v7CancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem v7TwoKalmansonOrbitClauses_length :
    v7TwoKalmansonOrbitClauses.length = {EXPECTED_ORBIT_CLAUSES} := by
  native_decide

theorem v7TwoKalmansonOrbitClauses_nodup :
    v7TwoKalmansonOrbitClauses.Nodup := by
  native_decide

theorem sourceAssign_v7TwoKalmansonOrbitClauses
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    ∀ clause ∈ v7TwoKalmansonOrbitClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [v7TwoKalmansonOrbitClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp v7CancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

def v7TwoKalmansonRefinementClauses : Std.Sat.CNF Atom :=
  [ {expressions} ]

theorem v7TwoKalmansonRefinementClauses_length :
    v7TwoKalmansonRefinementClauses.length = {V7_SUFFIX_CLAUSES} := by
  native_decide

theorem v7TwoKalmansonRefinementClauses_nodup :
    v7TwoKalmansonRefinementClauses.Nodup := by
  native_decide

theorem v7TwoKalmansonRefinementClauses_subset_orbit :
    ∀ clause ∈ v7TwoKalmansonRefinementClauses,
      clause ∈ v7TwoKalmansonOrbitClauses := by
  native_decide

theorem sourceAssign_v7TwoKalmansonRefinementClauses
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    ∀ clause ∈ v7TwoKalmansonRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  exact sourceAssign_v7TwoKalmansonOrbitClauses source clause
    (v7TwoKalmansonRefinementClauses_subset_orbit clause hclause)

def canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf :
    Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf ++
    v7TwoKalmansonRefinementClauses

theorem canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf_length :
    canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf.length =
      {V7_ROOT_CLAUSES} := by
  simp [canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf,
    canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf_length,
    v7TwoKalmansonRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  rcases List.mem_append.mp hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf
        source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_v7TwoKalmansonRefinementClauses source clause hsuffix

#print axioms v7CancellationOccurrences_all_check
#print axioms v7TwoKalmansonOrbitClauses_nodup
#print axioms sourceAssign_v7TwoKalmansonOrbitClauses
#print axioms v7TwoKalmansonRefinementClauses_nodup
#print axioms sourceAssign_v7TwoKalmansonRefinementClauses
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinements
end Problem97
'''


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--candidate-ledger", type=Path, default=LEDGER)
    parser.add_argument("--parent-cnf", type=Path, default=PARENT_CNF)
    parser.add_argument("--lean-output", type=Path, required=True)
    args = parser.parse_args()
    ledger = load_authenticated_ledger(args.candidate_ledger)
    occurrences = validate_ledger(ledger)
    novelty = verify_immediate_parent_novelty(occurrences, args.parent_cnf)
    write_text_once(args.lean_output, render_lean(ledger))
    print(
        f"promoted {len(occurrences)} occurrences / {EXPECTED_ORBIT_CLAUSES} orbit clauses; "
        f"v6-duplicates={len(novelty.v6_exact_duplicate_indices)}; "
        f"parent-subsumed={len(novelty.parent_subsumed_indices)}; "
        f"strict-new={len(novelty.strict_new_indices)}; root={V7_ROOT_CLAUSES}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
