"""Promote the authenticated V7-wave two-Kalmanson cancellations into V8.

The immutable ledger contains eleven source-valid cancellation occurrences and
three diagnostic formalized-core records.  The latter are authenticated but do
not emit clauses: their clauses are already present in the immediate parent.
The generator structurally replays every cancellation, banks its complete
44-clause order/orientation orbit, and appends only the 29 clauses that remain
strictly new against the V7 physical-none parent.
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


V7 = _load(
    "exact17_v8_twok_v7_helper",
    SCRIPTS / "generate_exact17_four_point_two_circle_v7_two_kalmanson_refinements.py",
)
V4 = V7.V4
COMBINED = V7.COMBINED

PromotionError = V7.PromotionError
canonical_json_bytes = V7.canonical_json_bytes
sha256_bytes = V7.sha256_bytes
self_hash = V7.self_hash
strict_json = V7.strict_json
require_exact_keys = V7.require_exact_keys
candidate_id = V7.candidate_id
lean_occurrence = V7.lean_occurrence
lean_occurrence_check = V7.lean_occurrence_check
path_hits = V7.path_hits
reflected = V7.reflected
write_text_once = V7.write_text_once

LEDGER = (
    REPO
    / "scratch/runs/exact17-canary-perp-bisector-survivor-four-point-two-circle-"
    "v7-two-kalmanson-refinements-sat-portfolio-v7-20260823/"
    "sat-profile-portfolio-v7/artifacts/candidate-ledger.json"
)
LEDGER_SHA256 = "0dcede614cf088697139f475381ede6c813d7875d6bd69e4cb416af61054e725"
V7_LEAN = (
    REPO
    / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircle"
    "V7TwoKalmansonRefinements.lean"
)
V7_LEAN_SHA256 = "1a68382662e8d005109dd6ff50fb3b5c3f18006b01acbd213a1f8ffd6ebf39fb"
PARENT_CNF = (
    REPO
    / "scratch/runs/exact17-v7-two-kalmanson-successor-preparer-v3-20260823/"
    "preparation-v3/artifacts/cells/"
    "canary-perp-bisector-survivor-four-point-two-circle-v7-two-kalmanson-"
    "refinements-next-center-02-physical-none/"
    "canary-perp-bisector-survivor-four-point-two-circle-v7-two-kalmanson-"
    "refinements-next-center-02-physical-none.cnf"
)
PARENT_CNF_SHA256 = "0284e26eb95495b0bdc1078c5c39656c77fd21c0e94bde75235846730d0c8917"
PARENT_CNF_BYTES = 346_305_475
PARENT_PHYSICAL_CLAUSES = 7_409_816
V7_ROOT_CLAUSES = 7_409_810
V8_SUFFIX_CLAUSES = 29
V8_ROOT_CLAUSES = 7_409_839
NUM_VARIABLES = 308
N = 17

MODEL = (
    REPO
    / "scratch/runs/exact17-canary-perp-bisector-survivor-four-point-two-circle-"
    "v7-two-kalmanson-refinements-sat-portfolio-v7-20260823/"
    "sat-profile-portfolio-v7/events/"
    "canary-perp-bisector-survivor-four-point-two-circle-v7-two-kalmanson-"
    "refinements-next-center-02-physical-none-canary-two-kalmanson-v7-sat-"
    "profile-v1.jsonl.artifacts/"
    "5ea976d3dd9cbeccfe1f4866a612957533c69fd785d711abcae97e0bc1715601"
)
MODEL_SHA256 = "5ea976d3dd9cbeccfe1f4866a612957533c69fd785d711abcae97e0bc1715601"

LEDGER_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v7-two-"
    "kalmanson-v7-wave-only-candidate-ledger/v1"
)
CANDIDATE_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v7-two-"
    "kalmanson-v7-wave-only-candidate/v1"
)
FAMILY = "two-kalmanson-cancellation"
CORE_FAMILY = "formalized-core-bank"
COMPONENT_FAMILY = "perpendicular-bisector-equality-component"
CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
    "false_of_twoKalmansonCancellationData_of_check"
)
CORE_CONSUMERS = (
    "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg",
    "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core",
    "Problem97.Census554.false_of_metricCoreAlternative",
)

EXPECTED_TOTAL_CANDIDATES = 14
EXPECTED_OCCURRENCES = 11
EXPECTED_ORBIT_CLAUSES = 44
EXPECTED_ORDER = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
EXPECTED_SOURCE_VALID_FAMILIES = [CORE_FAMILY, COMPONENT_FAMILY, FAMILY]
EXPECTED_DECODED_SHA256 = "b9de7e9d0780fc8c4ecdafb75a149619b92083075d79c68a6accad1981b9e10b"
EXPECTED_FAMILY_INVENTORY_SHA256 = (
    "45973fcbd1abdcb45457626f592f619ee08231ed161e9910956dd33ca8285579"
)
EXPECTED_SCANNER_DEPENDENCIES_SHA256 = (
    "3e232caf056cd661f87a38c578dbe899dbd9d3d1ff7198129526fc96922cb8df"
)
EXPECTED_STRICT_NEW_INDICES = (
    0, 1, 2, 3, 4, 6, 8, 10, 12, 14, 16, 18, 19, 20, 21, 23, 24, 27,
    28, 30, 31, 32, 35, 36, 37, 39, 40, 41, 43,
)
EXPECTED_STRICT_NEW_JSON_SHA256 = (
    "43c3f4a7452404a67cd179a18966edf9fd58a11a8b1077b86eb312daba710f75"
)
EXPECTED_ORBIT_JSON_SHA256 = "0a2fb96358182260a5e9a881f7af25930e0d589abf97e60a0dabcfe4afd57ded"
EXPECTED_PARENT_EXACT_MULTIPLICITIES = (0,) * EXPECTED_ORBIT_CLAUSES
EXPECTED_PARENT_SUBSUMER_MULTIPLICITIES = (
    0, 0, 0, 0, 0, 2, 0, 2, 0, 1, 0, 1, 0, 3, 0, 1, 0, 1, 0, 0,
    0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0,
    0, 0, 2, 0,
)
EXPECTED_PARENT_NOVELTY_CENSUS_SHA256 = (
    "64055aff73e877d296288e747528456454bb92c397d86815eae201568742d537"
)
EXPECTED_CURRENT_MODEL_FALSIFIED_ORBIT_INDICES = (
    0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40,
)
EXPECTED_CURRENT_MODEL_FALSIFIED_SUFFIX_INDICES = (
    0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40,
)

EXPECTED_TOP_VALUES = {
    "cnf_sha256": PARENT_CNF_SHA256,
    "job_id": "8728dcc4-fb4f-43af-9c27-f2baae6cf83f",
    "model_sha256": MODEL_SHA256,
    "portfolio_cell_id": (
        "canary-perp-bisector-survivor-four-point-two-circle-v7-two-kalmanson-"
        "refinements-next-center-02-physical-none-canary-two-kalmanson-v7-sat-"
        "profile-v1"
    ),
    "producer_manifest_sha256": (
        "90175e0074f689c0166e4255e35035280ec2600adc88baad0bddcb35d0862bec"
    ),
    "variable_map_sha256": (
        "78df650209311154e9a5fb6fdb88b6e532acaa624b7789d3028434c05e38e63f"
    ),
    "wave_manifest_sha256": (
        "abe206ef35770abbacb9156533a9560cb5b5121c135d5ce294625967a49be243"
    ),
}
EXPECTED_SCANNER = {
    "name": (
        "exact17-survivor-four-point-two-circle-v7-two-kalmanson-v7-source-"
        "valid-theorem-miner"
    ),
    "schema": (
        "p97-exact17-survivor-four-point-two-circle-v7-two-kalmanson-v7-"
        "source-valid-theorem-miner/v1"
    ),
    "source_path": (
        "scripts/mine_exact17_canary_perp_bisector_survivor_four_point_two_"
        "circle_v7_two_kalmanson_refinements_sat_model.py"
    ),
    "source_sha256": "b6e0fe8faefe6cea424d4a8d6a7f5fdd7344c66a8ff6cd7e08df2e93a9abeadd",
    "version": "7",
}

EXPECTED_CANDIDATE_RECORDS = (
    ("formalized-core-bank:994a5c10274e752a26d1dfc193dca100cce48b0d85898e0f010caa3da7bb1e24", "dcbf2f300db44a3ec9082e6c5d2b77d7559d5d535475214109c2d9b5c78a410f"),
    ("formalized-core-bank:d824f2ffc4eefae1a9651bb22dbd0a54d79b27dc10d6ad7d37222b2c61e9c3cc", "28bd108605c33d8829c884744f750e00c9c8d7ebb76e12ca0fcbdffc78dbc69e"),
    ("formalized-core-bank:e12ef1e51ea72abb74c7be9e2c11b85c99fe86c7969c2900f26793d1a6c9fa8d", "cfbba28ad0e98c1868fda65ff6fd1996693fbf320be1a79ad815f97dfb95b5b1"),
    ("two-kalmanson-cancellation:1be15d3105884a785bbd9a823d670d428c559c9cd8d6218aa29220944edb869d", "7b5a3914f7f8515a3aba46ba46694fff7d51df37fca1323364e9545ff2087d97"),
    ("two-kalmanson-cancellation:34dd5c2ccb25b8e48f01f2e7d6ec31096d822da2836a8d5e3cb8098cd2486e30", "3fc5e14f4c451e23b4281e3712e4efcc543faf033f6ea5e6f7db44b8d49ce488"),
    ("two-kalmanson-cancellation:4103efb18a0744b7d1ccf53c2699a6690ddd5b886801834b5d40c3d6efbf6e9d", "bcb66f44efab1671a820b74a63645c17a2b114421715b20caa57bc39b4f0c5d4"),
    ("two-kalmanson-cancellation:421a9d7fc25dbcbd37880e4238414f62a4bc08652fc2abc43430e13c2b09c41e", "55d7ac0ad664ee6ed4ecada4fc9727b010e323191ec0824ba2b3ab438e9b2fe0"),
    ("two-kalmanson-cancellation:6b5b92d7b1a23a008a044ed53167ad6cc52b0fe9fa4567e852388f78565ae39f", "b6aa8041920ef87556da3b6cf3e08b2d883a7b75f1a20cf00d2cb03afb5200f6"),
    ("two-kalmanson-cancellation:774671dda66db4b04c5d9e448dd9895e2351fa9cf3567a4cec4569906aa84cfa", "bad39636deff231afe3e63d662107ccdd1f46bb79e6b9eaae07478f12d0c3123"),
    ("two-kalmanson-cancellation:8976592d6c557c412a26c2e33136aecddd517e100ae084d114495ad22a8c29c8", "0cad3895f89c51767d583f8ff120bccb9d29d62feab02a1ea57bdb9a632ea18e"),
    ("two-kalmanson-cancellation:8991a16b3a108a4178407753a79101eac2998a2cf4836b4d2a101338a320c4fc", "0b64d5a896655a3730c0fb5c2f7f84cd365c230ee57f4571512ca35c71c41f9c"),
    ("two-kalmanson-cancellation:8e4fde260b6f265755c0fabdc2f70daa2ec6f0cee37a36c74060dc2e7508e064", "f7d259df753a5d65e035ab808d7376fe3dccdaeeaa4d62da6497d0cb51bdd673"),
    ("two-kalmanson-cancellation:ac776315bca2b21339c31dc4c63a74c4607344c0b0247e2ed80ca331edf4bc51", "0e44fc49aa31796ee5a4fa6b5f18c0e80e60e2db1594720c8a0a5bcd074fc1fd"),
    ("two-kalmanson-cancellation:ec0a9ff780177092c9d50b04b2afc7f9d00dfa75b21737280ac91a81717e807c", "24d9973169457af3b9055ab53d0862567c346db3974eb8877222e85e4543818c"),
)

TOP_KEYS = V7.TOP_KEYS
CANDIDATE_KEYS = V7.CANDIDATE_KEYS
TWOK_PAYLOAD_KEYS = V7.TWOK_PAYLOAD_KEYS
Occurrence = V7.Occurrence


class ImmediateParentNovelty(NamedTuple):
    exact_duplicate_multiplicities: tuple[int, ...]
    strict_subsumer_multiplicities: tuple[int, ...]
    strict_new_indices: tuple[int, ...]
    census_sha256: str


def _canonical_sha256(value: Any) -> str:
    return sha256_bytes(canonical_json_bytes(value))


def _rows_and_order(ledger: Mapping[str, Any]) -> tuple[list[Any], tuple[int, ...]]:
    return V7._rows_and_order(ledger)


def _support(candidate: Mapping[str, Any]) -> frozenset[tuple[int, int]]:
    return V7._support(candidate)


def render_orbit_clauses(
    occurrences: Sequence[Occurrence],
) -> tuple[tuple[int, ...], ...]:
    return tuple(
        clause
        for hits, _forward, _reverse in occurrences
        for clause in V4.orbit_clauses(hits)
    )


def strict_new_clauses(
    clauses: Sequence[tuple[int, ...]],
) -> tuple[tuple[int, ...], ...]:
    if len(clauses) != EXPECTED_ORBIT_CLAUSES:
        raise PromotionError("orbit clause count drifted")
    result = tuple(clauses[index] for index in EXPECTED_STRICT_NEW_INDICES)
    if len(result) != V8_SUFFIX_CLAUSES or len(set(result)) != V8_SUFFIX_CLAUSES:
        raise PromotionError("V8 production suffix is not a 29-clause set")
    if _canonical_sha256([list(clause) for clause in result]) != (
        EXPECTED_STRICT_NEW_JSON_SHA256
    ):
        raise PromotionError("ordered V8 production suffix hash drifted")
    return result


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
    if _canonical_sha256(ledger.get("scanner_dependencies")) != (
        EXPECTED_SCANNER_DEPENDENCIES_SHA256
    ):
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
        candidate = require_exact_keys(
            raw_candidate, CANDIDATE_KEYS, f"candidate {index}"
        )
        if candidate.get("schema") != CANDIDATE_SCHEMA:
            raise PromotionError(f"candidate {index} schema drifted")
        if candidate.get("source_valid") is not True:
            raise PromotionError(f"candidate {index} is not source-valid")
        if (candidate.get("candidate_id"), candidate.get("record_sha256")) != (
            expected_record
        ):
            raise PromotionError(f"candidate {index} authenticated identity drifted")
        if candidate.get("candidate_id") != candidate_id(candidate):
            raise PromotionError(f"candidate {index} identity replay failed")
        if candidate.get("record_sha256") != self_hash(candidate, "record_sha256"):
            raise PromotionError(f"candidate {index} record self-hash drifted")
        family = candidate.get("family")
        if index < len(CORE_CONSUMERS):
            if family != CORE_FAMILY:
                raise PromotionError(f"candidate {index} formalized-core family drifted")
            if candidate.get("lean_consumer") != CORE_CONSUMERS[index]:
                raise PromotionError(f"candidate {index} formalized-core consumer drifted")
            payload = candidate.get("payload")
            if type(payload) is not dict or payload.get("full_selected_row_support_replay") is not True:
                raise PromotionError(f"candidate {index} formalized-core replay drifted")
            _support(candidate)
            continue
        if family != FAMILY or candidate.get("lean_consumer") != CONSUMER:
            raise PromotionError(f"candidate {index} two-Kalmanson binding drifted")
        payload = require_exact_keys(
            candidate.get("payload"), TWOK_PAYLOAD_KEYS, f"candidate {index} payload"
        )
        if payload.get("paired_forward_reverse_replay") is not True:
            raise PromotionError(f"candidate {index} pairing replay drifted")
        if payload.get("occurrence_union_cover") is not True:
            raise PromotionError(f"candidate {index} occurrence cover drifted")
        forward, reverse = payload.get("forward"), payload.get("reverse")
        if type(forward) is not dict or type(reverse) is not dict:
            raise PromotionError(f"candidate {index} path records are malformed")
        hits = _support(candidate)
        if hits in seen_supports:
            raise PromotionError("two-Kalmanson support is duplicated")
        seen_supports.add(hits)
        forward_support = path_hits(forward)
        reverse_support = path_hits(reverse)
        if forward_support != frozenset(
            tuple(hit) for hit in payload.get("forward_path_support", [])
        ):
            raise PromotionError(f"candidate {index} forward support drifted")
        if reverse_support != frozenset(
            tuple(hit) for hit in payload.get("reverse_path_support", [])
        ):
            raise PromotionError(f"candidate {index} reverse support drifted")
        if not forward_support <= hits or not reflected(reverse_support) <= hits:
            raise PromotionError(f"candidate {index} support/path certificate drifted")
        if forward.get("projection", {}).get("order") != list(order):
            raise PromotionError(f"candidate {index} forward projection order drifted")
        if reverse.get("projection", {}).get("order") != list(reverse_order):
            raise PromotionError(f"candidate {index} reverse projection order drifted")
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
    if len(clauses) != EXPECTED_ORBIT_CLAUSES:
        raise PromotionError("two-Kalmanson orbit count drifted")
    if len(set(clauses)) != EXPECTED_ORBIT_CLAUSES:
        raise PromotionError("two-Kalmanson orbit is not a 44-clause set")
    if _canonical_sha256([list(clause) for clause in clauses]) != (
        EXPECTED_ORBIT_JSON_SHA256
    ):
        raise PromotionError("ordered 44-clause orbit hash drifted")
    strict_new_clauses(clauses)
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


def verify_v7_parent_source(path: Path = V7_LEAN) -> None:
    if path.is_symlink() or not path.is_file() or path.resolve() != V7_LEAN.resolve():
        raise PromotionError("V7 Lean parent path drifted")
    if sha256_bytes(path.read_bytes()) != V7_LEAN_SHA256:
        raise PromotionError("V7 Lean parent byte hash drifted")


def _load_authenticated_assignment(path: Path = MODEL) -> dict[int, bool]:
    if path.is_symlink() or not path.is_file() or path.resolve() != MODEL.resolve():
        raise PromotionError("motivating model path drifted")
    raw = path.read_bytes()
    if sha256_bytes(raw) != MODEL_SHA256:
        raise PromotionError("motivating model byte hash drifted")
    value = strict_json(raw)
    require_exact_keys(
        value,
        {"job_id", "result", "backend", "solver_profile", "num_assigned", "assignment"},
        "motivating model",
    )
    if value.get("job_id") != EXPECTED_TOP_VALUES["job_id"]:
        raise PromotionError("motivating model job drifted")
    if value.get("result") != "SAT" or value.get("num_assigned") != NUM_VARIABLES:
        raise PromotionError("motivating model is not a total SAT assignment")
    if value.get("backend") != "cadical" or value.get("solver_profile") != "sat":
        raise PromotionError("motivating model solver identity drifted")
    signed = value.get("assignment")
    if type(signed) is not list or len(signed) != NUM_VARIABLES:
        raise PromotionError("motivating model assignment length drifted")
    if any(type(literal) is not int or literal == 0 for literal in signed):
        raise PromotionError("motivating model has malformed literals")
    if {abs(literal) for literal in signed} != set(range(1, NUM_VARIABLES + 1)):
        raise PromotionError("motivating model is not total over the source variables")
    return {abs(literal): literal > 0 for literal in signed}


def _clause_satisfied(clause: tuple[int, ...], assignment: Mapping[int, bool]) -> bool:
    return any(assignment[abs(literal)] is (literal > 0) for literal in clause)


def compute_parent_facts(
    occurrences: Sequence[Occurrence], parent_cnf: Path = PARENT_CNF
) -> tuple[ImmediateParentNovelty, tuple[int, ...], tuple[int, ...]]:
    verify_v7_parent_source()
    clauses = render_orbit_clauses(occurrences)
    baseline = COMBINED.classify_parent_prefix_novelty(
        parent_cnf,
        clauses,
        expected_sha256=PARENT_CNF_SHA256,
        expected_bytes=PARENT_CNF_BYTES,
        expected_num_variables=NUM_VARIABLES,
        expected_total_clauses=PARENT_PHYSICAL_CLAUSES,
        parent_prefix_clauses=V7_ROOT_CLAUSES,
    )
    strict_new = tuple(
        index
        for index in range(len(clauses))
        if baseline.exact_duplicate_multiplicities[index] == 0
        and baseline.strict_subsumer_multiplicities[index] == 0
    )
    novelty = ImmediateParentNovelty(
        baseline.exact_duplicate_multiplicities,
        baseline.strict_subsumer_multiplicities,
        strict_new,
        baseline.census_sha256,
    )
    assignment = _load_authenticated_assignment()
    falsified_orbit = tuple(
        index
        for index, clause in enumerate(clauses)
        if not _clause_satisfied(clause, assignment)
    )
    strict_set = set(strict_new)
    falsified_suffix = tuple(index for index in falsified_orbit if index in strict_set)
    return novelty, falsified_orbit, falsified_suffix


def verify_immediate_parent_novelty(
    occurrences: Sequence[Occurrence], parent_cnf: Path = PARENT_CNF
) -> ImmediateParentNovelty:
    novelty, falsified_orbit, falsified_suffix = compute_parent_facts(
        occurrences, parent_cnf
    )
    if novelty.exact_duplicate_multiplicities != EXPECTED_PARENT_EXACT_MULTIPLICITIES:
        raise PromotionError("V7 parent exact-duplicate multiplicities drifted")
    if novelty.strict_subsumer_multiplicities != (
        EXPECTED_PARENT_SUBSUMER_MULTIPLICITIES
    ):
        raise PromotionError("V7 parent strict-subsumption multiplicities drifted")
    if novelty.strict_new_indices != EXPECTED_STRICT_NEW_INDICES:
        raise PromotionError("immediate V7 parent novelty partition drifted")
    if novelty.census_sha256 != EXPECTED_PARENT_NOVELTY_CENSUS_SHA256:
        raise PromotionError("V7 parent novelty census hash drifted")
    if falsified_orbit != EXPECTED_CURRENT_MODEL_FALSIFIED_ORBIT_INDICES:
        raise PromotionError("motivating-model orbit cut census drifted")
    if falsified_suffix != EXPECTED_CURRENT_MODEL_FALSIFIED_SUFFIX_INDICES:
        raise PromotionError("motivating-model production cut census drifted")
    if tuple(index * 4 for index in range(EXPECTED_OCCURRENCES)) != falsified_orbit:
        raise PromotionError("not every authenticated occurrence cuts the motivating model")
    return novelty


def _occurrence_refinement_expression(index: int) -> str:
    occurrence = index // 4
    within = index % 4
    order = within // 2
    direction = ".forward" if within % 2 == 0 else ".reverse"
    return (
        f"occurrenceClause v8CancellationOccurrence{occurrence}.hits "
        f"{order} {direction}"
    )


def render_lean(ledger: Mapping[str, Any]) -> str:
    occurrences = validate_ledger(ledger)
    definitions = []
    for index, (hits, forward, reverse) in enumerate(occurrences):
        body = lean_occurrence(hits, forward, reverse).lstrip()
        definitions.append(
            f"def v8CancellationOccurrence{index} : CancellationOccurrence :=\n  {body}"
        )
    definitions_text = "\n\n".join(definitions)
    names = ", ".join(
        f"v8CancellationOccurrence{index}" for index in range(EXPECTED_OCCURRENCES)
    )
    expressions = ",\n    ".join(
        _occurrence_refinement_expression(index)
        for index in EXPECTED_STRICT_NEW_INDICES
    )
    return f'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinements

/-!
Source-valid V8 two-Kalmanson bank over the V7 two-Kalmanson root.

The authenticated ledger `{LEDGER_SHA256}` supplies eleven checked cancellation
occurrences and a 44-clause order/orientation orbit (`{EXPECTED_ORBIT_JSON_SHA256}`).
Three additional formalized-core records are authenticated by the generator but
emit no clauses because their clauses are already covered by the V7 parent.  The
production suffix contains exactly the 29 clauses still new against that parent
(`{EXPECTED_STRICT_NEW_JSON_SHA256}`).
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementSurvivorRefinements
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinements

private abbrev occurrenceClause :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

{definitions_text}

def v8CancellationOccurrences : List CancellationOccurrence :=
  [{names}]

theorem v8CancellationOccurrences_length :
    v8CancellationOccurrences.length = {EXPECTED_OCCURRENCES} := by
  native_decide

theorem v8CancellationOccurrences_all_check :
    v8CancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def v8TwoKalmansonOrbitClauses : Std.Sat.CNF Atom :=
  v8CancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem v8TwoKalmansonOrbitClauses_length :
    v8TwoKalmansonOrbitClauses.length = {EXPECTED_ORBIT_CLAUSES} := by
  native_decide

theorem v8TwoKalmansonOrbitClauses_nodup :
    v8TwoKalmansonOrbitClauses.Nodup := by
  native_decide

theorem sourceAssign_v8TwoKalmansonOrbitClauses
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    ∀ clause ∈ v8TwoKalmansonOrbitClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [v8TwoKalmansonOrbitClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp v8CancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

def v8TwoKalmansonRefinementClauses : Std.Sat.CNF Atom :=
  [ {expressions} ]

theorem v8TwoKalmansonRefinementClauses_length :
    v8TwoKalmansonRefinementClauses.length = {V8_SUFFIX_CLAUSES} := by
  native_decide

theorem v8TwoKalmansonRefinementClauses_nodup :
    v8TwoKalmansonRefinementClauses.Nodup := by
  native_decide

theorem v8TwoKalmansonRefinementClauses_subset_orbit :
    ∀ clause ∈ v8TwoKalmansonRefinementClauses,
      clause ∈ v8TwoKalmansonOrbitClauses := by
  native_decide

theorem sourceAssign_v8TwoKalmansonRefinementClauses
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    ∀ clause ∈ v8TwoKalmansonRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  exact sourceAssign_v8TwoKalmansonOrbitClauses source clause
    (v8TwoKalmansonRefinementClauses_subset_orbit clause hclause)

def canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf :
    Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf ++
    v8TwoKalmansonRefinementClauses

theorem canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf_length :
    canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf.length =
      {V8_ROOT_CLAUSES} := by
  simp [canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf,
    canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf_length,
    v8TwoKalmansonRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  rcases List.mem_append.mp hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf
        source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_v8TwoKalmansonRefinementClauses source clause hsuffix

#print axioms v8CancellationOccurrences_all_check
#print axioms v8TwoKalmansonOrbitClauses_nodup
#print axioms sourceAssign_v8TwoKalmansonOrbitClauses
#print axioms v8TwoKalmansonRefinementClauses_nodup
#print axioms sourceAssign_v8TwoKalmansonRefinementClauses
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinements
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
        f"promoted {len(occurrences)} occurrences / {EXPECTED_ORBIT_CLAUSES} "
        f"orbit clauses; parent-subsumed="
        f"{sum(count > 0 for count in novelty.strict_subsumer_multiplicities)}; "
        f"strict-new={len(novelty.strict_new_indices)}; root={V8_ROOT_CLAUSES}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
