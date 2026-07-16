"""Classify the corrected bank-clean robust shadow by exact metric algebra.

The pinned source checkpoint has already passed the expensive structural
replay.  This checker independently reconstructs its terminal witness against
the current candidate surface and producer bank, restores the ambient
five-point first-apex class, and tests simultaneous Euclidean equality
realizability with Singular and msolve.

The CAS verdict is trusted exact computation, not a Lean certificate.  UNIT
over QQ excludes normalized complex coordinates and therefore also excludes
normalized real coordinates; it needs no orientation, MEC, or no-M44 input.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import sys
from types import ModuleType
from typing import Any, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
ROBUST_PATH = HERE.parent / "robust-all-center-cegar" / "search.py"
BANK_PATH = HERE.parent / "robust-all-center-marco" / "bank_cegar.py"
ORACLE_DIR = HERE.parent / "second_center_metric_oracle"
ORACLE_PATH = ORACLE_DIR / "oracle.py"
PROFILE_AUDIT_PATH = (
    HERE.parent / "global-k4-extension-audit-35pt" / "analyze.py"
)
U1_MATCH_PATH = HERE.parent / "global-k4-extension" / "analyze.py"
SOURCE_CHECKPOINT = HERE / "source_checkpoint.json"
CHECKPOINT = HERE / "checkpoint.json"

EXPECTED_SHA256 = {
    SOURCE_CHECKPOINT: (
        "b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9"
    ),
    ROBUST_PATH: (
        "54edd2c3ed92ef6d0d55f5f5196d9ec84d2d04cabc40a3ecc04cabbcb4a16d02"
    ),
    BANK_PATH: (
        "35b911ccde42691fee1f9d425634f626154cc0621ff8802b8f7f1d2547a8ea16"
    ),
    ORACLE_PATH: (
        "b708722ce49f9d0f165facf20a911161815ce8018c5fc3760bf872dad6977a09"
    ),
    PROFILE_AUDIT_PATH: (
        "db59e95d71da2a2544acf5b73ded4dd321e1532a91977825042a290c996550d4"
    ),
    U1_MATCH_PATH: (
        "256313fbb2a957733e9b3709b6587ed875acdcbef858dcc6775cec98de1d9493"
    ),
}

EXPECTED_FULL_POLYNOMIAL_SHA256 = (
    "52120d25567e19c6018d83ca58ebd86b2ba5413b72c6b004b60b4d0dbb07285e"
)
EXPECTED_CORE_POLYNOMIAL_SHA256 = (
    "9d7545b3b584e49e823d42c417b3ec396840e6801f975b87ab252f2976a1656d"
)
CORE_CENTER_NAMES = ("A", "F", "G", "K", "O", "X", "Y", "Z")

for path in (ROOT, ORACLE_DIR):
    if str(path) not in sys.path:
        sys.path.insert(0, str(path))

from census.global_confinement import shadow  # noqa: E402
from census.global_confinement.metric_realizability_probe import (  # noqa: E402
    MetricRow,
)
import oracle  # noqa: E402


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def load_module(path: Path, name: str) -> ModuleType:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def check_source_hashes() -> dict[str, str]:
    actual = {str(path.relative_to(ROOT)): sha256(path) for path in EXPECTED_SHA256}
    expected = {
        str(path.relative_to(ROOT)): digest
        for path, digest in EXPECTED_SHA256.items()
    }
    if actual != expected:
        raise RuntimeError(f"pinned source drift: expected {expected}, found {actual}")
    return actual


def reconstruct_terminal_witness(
    robust: ModuleType, bank: ModuleType, source: Mapping[str, Any]
) -> tuple[Any, tuple[shadow.ClassRow, ...], dict[int, int], dict[str, object]]:
    assert source["schema"] == bank.SCHEMA
    assert source["status"] == "SAT_PRODUCER_BANK_CLEAN_CORRECTED_SHADOW"
    assert source["last_event"] == "verified bank-clean witness"
    assert source["source_sha256"] == bank.source_hashes()
    assert len(source["bank_cuts"]) == 524
    assert len(source["structural_survivors"]) == 101
    assert source["bank_witnesses_rejected"] == 100
    deletion_count = sum(
        len(record["row_pattern"])
        for record in source["bank_cuts"]
        if "marco_core" in record
    )
    assert deletion_count == 1799

    surface = robust.Surface()
    witness = source["witness"]
    blockers = {
        surface.by_name[source_name]: surface.by_name[center_name]
        for source_name, center_name in witness["blockers"].items()
    }
    exact_centers = set(blockers.values())
    rows: list[shadow.ClassRow] = []
    choices: dict[int, int] = {}
    for record in witness["rows"]:
        center = surface.by_name[record["center"]]
        support = frozenset(surface.by_name[name] for name in record["support"])
        candidate_index = int(record["candidate_index"])
        assert support == surface.candidates[center][candidate_index]
        assert bool(record["exact_from_blocker_image"]) == (
            center in exact_centers
        )
        choices[center] = candidate_index
        rows.append(
            shadow.ClassRow(
                f"global:{center}",
                center,
                support,
                exact=center in exact_centers,
            )
        )
    assert set(choices) == set(range(surface.frame.n))
    rows_tuple = tuple(rows)
    ok, reason = surface.verify_model(rows_tuple, blockers)
    if not ok:
        raise RuntimeError(f"terminal witness failed structural verifier: {reason}")

    serialized_rows = bank.named_rows(surface, rows_tuple, choices)
    serialized_blockers = bank.named_blockers(surface, blockers)
    assert canonical_sha256(serialized_rows) == witness["row_assignment_sha256"]
    assert canonical_sha256(serialized_blockers) == witness[
        "blocker_assignment_sha256"
    ]
    assert witness["row_assignment_sha256"] == (
        "f4c8e9e69d7ca3bec381d27178710fc7aa4ab7f4308e70973b675a38b8eacc66"
    )
    assert witness["blocker_assignment_sha256"] == (
        "726f7c38f5c125a17442ad4780ad30ce879d056fe8ae7d99ae225514ca2ff602"
    )
    selected_matches = bank.scan(surface, rows_tuple, exact_centers=frozenset())
    exact_matches = bank.scan(
        surface, rows_tuple, exact_centers=frozenset(exact_centers)
    )
    assert not selected_matches
    assert not exact_matches
    target = bank.sharpened_live_target_audit(surface, rows_tuple)
    assert target == witness["sharpened_live_target"]
    assert target["holds"] is False

    audit = {
        "status": source["status"],
        "bank_cut_count": len(source["bank_cuts"]),
        "single_row_deletion_replay_count": deletion_count,
        "structural_survivor_count": len(source["structural_survivors"]),
        "bank_rejected_survivor_count": source["bank_witnesses_rejected"],
        "terminal_row_assignment_sha256": witness["row_assignment_sha256"],
        "terminal_blocker_assignment_sha256": witness[
            "blocker_assignment_sha256"
        ],
        "independent_terminal_structural_verifier": "PASS",
        "selected_row_bank_match_count": len(selected_matches),
        "blocker_exact_bank_match_count": len(exact_matches),
        "sharpened_target_holds": target["holds"],
        "full_historical_replay": (
            "PINNED_SOURCE_WAS_STRONGLY_REPLAYED_BEFORE_EXTRACTION; "
            "THIS_CHECKER_REPLAYS_THE_TERMINAL_WITNESS"
        ),
    }
    return surface, rows_tuple, blockers, audit


def metric_rows(
    surface: Any, rows: Sequence[shadow.ClassRow]
) -> tuple[MetricRow, ...]:
    result: list[MetricRow] = []
    o = surface.by_name["O"]
    for row in rows:
        support = row.support
        if row.center == o:
            support = surface.ambient_first_apex_row().support
        result.append(
            MetricRow(row.center, tuple(sorted(support)), exact=False)
        )
    return tuple(result)


def result_dict(result: Any) -> dict[str, object]:
    record: dict[str, object] = {"verdict": result.verdict}
    if result.detail is not None:
        record["detail"] = result.detail
    return record


def crosscheck_unit(
    rows: Sequence[MetricRow], *, expected_polynomial_sha256: str
) -> dict[str, object]:
    variables = tuple(str(variable) for variable in oracle.variable_symbols(14))
    polynomials = oracle.serialized_system(14, rows)
    polynomial_sha256 = canonical_sha256(list(polynomials))
    assert polynomial_sha256 == expected_polynomial_sha256
    singular = oracle.run_singular(variables, polynomials, timeout_s=30.0)
    msolve_forward = oracle.run_msolve(variables, polynomials, timeout_s=30.0)
    msolve_reverse = oracle.run_msolve(
        tuple(reversed(variables)), polynomials, timeout_s=30.0
    )
    verdicts = (
        singular.verdict,
        msolve_forward.verdict,
        msolve_reverse.verdict,
    )
    if verdicts != ("UNIT", "UNIT", "UNIT"):
        raise RuntimeError(f"metric crosscheck did not agree on UNIT: {verdicts}")
    return {
        "status": "CROSSCHECKED_UNIT",
        "row_count": len(rows),
        "equality_count": len(polynomials),
        "expanded_polynomial_sha256": polynomial_sha256,
        "singular_qq": result_dict(singular),
        "msolve_qq_forward_variables": result_dict(msolve_forward),
        "msolve_qq_reverse_variables": result_dict(msolve_reverse),
    }


def row_record(surface: Any, row: MetricRow) -> dict[str, object]:
    return {
        "center": surface.by_label[row.center],
        "support": sorted(surface.by_label[label] for label in row.support),
    }


def profile_comparison(surface: Any, metric: Sequence[MetricRow]) -> dict[str, object]:
    profile_audit = load_module(PROFILE_AUDIT_PATH, "p97_35pt_profile_audit")
    model = profile_audit.load_pinned_model()
    points = model.build_points()
    profiles = profile_audit.exact_profiles(model, points)
    available = profile_audit.row_supports(profiles, minimum_card=4)
    deficient = sorted(center for center, supports in available.items() if not supports)
    assert len(deficient) == 24
    assert all(
        max(len(support) for _radius, support in profiles[center]) == 1
        for center in deficient
    )

    by_center = {
        surface.by_label[row.center]: tuple(
            sorted(surface.by_label[label] for label in row.support)
        )
        for row in metric
    }
    core_requirements = {name: by_center[name] for name in CORE_CENTER_NAMES}
    identical = []
    changed = []
    for center, support in core_requirements.items():
        exact_supports = set(available.get(center, []))
        if support in exact_supports:
            identical.append(center)
        else:
            changed.append(center)
    assert identical == ["A", "O"]
    assert changed == ["F", "G", "K", "X", "Y", "Z"]
    assert {"G", "K"} <= set(deficient)
    return {
        "carrier_card": len(points),
        "centers_with_k4_count": len(points) - len(deficient),
        "centers_without_k4_count": len(deficient),
        "centers_without_k4": deficient,
        "all_deficient_profiles_are_singleton_only": True,
        "unit_core_rows_already_realized": identical,
        "unit_core_rows_not_realized": changed,
        "forced_continuation_centers_deficient_in_35pt_model": ["G", "K"],
        "interpretation": (
            "the 35-point model realizes the ambient O and second-apex A rows, "
            "but not the six additional row classes needed by the UNIT core"
        ),
    }


def build_report() -> dict[str, object]:
    source_hashes = check_source_hashes()
    robust = load_module(ROBUST_PATH, "p97_robust_all_center_surface")
    bank = load_module(BANK_PATH, "p97_robust_all_center_bank")
    source = json.loads(SOURCE_CHECKPOINT.read_text(encoding="utf-8"))
    surface, rows, _blockers, structural = reconstruct_terminal_witness(
        robust, bank, source
    )
    metric = metric_rows(surface, rows)
    full = crosscheck_unit(
        metric, expected_polynomial_sha256=EXPECTED_FULL_POLYNOMIAL_SHA256
    )
    by_name = {surface.by_label[row.center]: row for row in metric}
    core = tuple(by_name[name] for name in CORE_CENTER_NAMES)
    retained = crosscheck_unit(
        core, expected_polynomial_sha256=EXPECTED_CORE_POLYNOMIAL_SHA256
    )
    u1_matcher = load_module(U1_MATCH_PATH, "p97_existing_u1_match_audit")
    u1_near_match = u1_matcher.best_u1_match(tuple(metric), 14)
    assert u1_near_match["minimum_missing_hypothesis_count"] == 2
    assert u1_near_match["preferred_missing_hypotheses"] == [5, 7]
    smoke = oracle.smoke_gates()
    assert smoke["known_unit"]["singular"]["verdict"] == "UNIT"
    assert smoke["known_unit"]["msolve"]["verdict"] == "UNIT"
    assert smoke["known_nonunit"]["singular"]["verdict"] == "NONUNIT"
    assert smoke["known_nonunit"]["msolve"]["verdict"] == "NONUNIT"

    return {
        "schema": "p97-atail-bank-clean-metric-audit-v1",
        "status": "PASS",
        "epistemic_status": {
            "structural_witness": "EXACT_WITHIN_CORRECTED_FINITE_SHADOW",
            "metric_verdict": "TRUSTED_EXACT_CAS_CROSSCHECK_NOT_CERTIFICATE_REPLAY",
            "live_producer": "OPEN_UNTIL_CORE_IS_KERNEL_CERTIFIED_AND_WIRED",
        },
        "source_sha256": source_hashes,
        "solver_smoke_gates": smoke,
        "corrected_structural_checkpoint": structural,
        "metric_realizability": {
            "coordinate_gauge": {"O": [0, 0], "A": [1, 0]},
            "ambient_first_apex_class_restored": ["A", "C", "D", "E", "J"],
            "full_terminal_witness": {
                **full,
                "rows": [row_record(surface, row) for row in metric],
            },
            "retained_unit_row_core": {
                **retained,
                "center_names": list(CORE_CENTER_NAMES),
                "rows": [row_record(surface, row) for row in core],
                "row_minimality_claimed": False,
                "generator_minimality_claimed": False,
                "nullstellensatz_certificate_replayed": False,
            },
            "interpretation": (
                "the equality ideal is already the unit ideal over QQ; there is "
                "no normalized complex realization and hence no real realization"
            ),
        },
        "comparison_with_exact_35_point_total_css_model": profile_comparison(
            surface, metric
        ),
        "theorem_bank_preflight": {
            "current_producer_bank_match_count": 0,
            "indexed_all_eight_slot_family_found": True,
            "existing_u1_equality_match": u1_near_match,
            "direct_existing_u1_consumer_match": False,
            "reason": (
                "the closest existing U1 equality template still lacks two "
                "hypotheses; AllEightSlotMetricCore is a differently packaged "
                "three-source-row surface with branch-specific extra equalities"
            ),
        },
        "first_omitted_full_parent_field": {
            "field": "simultaneous Euclidean realization of all selected radius rows",
            "failure_occurs_before": [
                "strict convex orientation inequalities",
                "minimum-enclosing-disk and cap inequalities",
                "literal noM44 geometry",
                "the sharpened one-row target",
            ],
            "smallest_current_replayable_core": (
                "eight selected centers and 25 squared-distance equalities; "
                "crosschecked UNIT but not claimed globally minimal"
            ),
            "closure_consequence": (
                "the corrected structural bank is incomplete on this witness; "
                "a kernel-facing certificate for the retained algebraic core can "
                "exclude it without inventing a prescribed-pair producer"
            ),
        },
        "not_claimed": [
            "a K-A countermodel",
            "an exhaustive classification of all corrected structural shadows",
            "a Lean-kernel proof of the UNIT computation",
            "row- or generator-minimality of the retained core",
        ],
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--output", type=Path, default=CHECKPOINT)
    args = parser.parse_args()
    report = build_report()
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists() or args.output.read_text(encoding="utf-8") != rendered:
            raise SystemExit(f"stale checkpoint: {args.output}")
        print(
            "PASS: terminal structural witness replayed; full and retained "
            "metric systems crosschecked UNIT"
        )
        return 0
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(args.output)
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
