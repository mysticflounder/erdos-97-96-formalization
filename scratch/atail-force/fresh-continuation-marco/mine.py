#!/usr/bin/env python3
"""Exact row-core mining for the synchronized bi-apex continuation shadows.

This driver reads only the pinned final one-million-node refresh checkpoint.
For every fresh SAT survivor it builds the normalized equality ideal

    point 0 = (0, 0), point 1 = (1, 0)

from the twelve selected four-rows.  Every semantic oracle answer is accepted
only when Singular over QQ and msolve over QQ in both declared variable orders
agree.  Cross-checked UNIT row sets are then passed to the repository's
bounded MARCO map layer to enumerate several deletion-minimal row cores.

UNIT excludes only the fixed normalized complex equality system.  NONUNIT
means only that the complex equality ideal is proper.  Neither verdict is a
real-feasibility result, a Euclidean realization, a uniform producer, or a
Lean proof.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
from dataclasses import dataclass
from itertools import combinations
from pathlib import Path
from typing import Any, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SHADOW_DIR = HERE.parent / "biapex-continuation-shadow-audit"
SOURCE = SHADOW_DIR / "selected_row_own_cap_bound_refresh_1m_retry_checkpoint.json"
SOURCE_SHA256 = "ad2400da59782d38d0952a9c31ae448bd30f86a110239bcca4687b538bc09fe9"
DEFAULT_OUTPUT = HERE / "checkpoint.json"
SCHEMA = "p97-atail-fresh-continuation-marco-v1"

TEMPLATE_DIR = HERE.parent / "second_center_metric_oracle"
for path in (ROOT, TEMPLATE_DIR):
    if str(path) not in sys.path:
        sys.path.insert(0, str(path))

import oracle as metric_oracle  # noqa: E402
from census.atail_force import producer_bank  # noqa: E402
from census.atail_force.producer_mus import MarcoEnumerator  # noqa: E402
from census.global_confinement.metric_realizability_probe import (  # noqa: E402
    MetricRow,
)
from census.multi_center import multi_center_census as mc  # noqa: E402


SUPPORT_FILES = (
    TEMPLATE_DIR / "oracle.py",
    ROOT / "census/atail_force/producer_bank.py",
    ROOT / "census/atail_force/producer_mus.py",
    ROOT / "census/global_confinement/metric_realizability_probe.py",
    ROOT / "census/multi_center/multi_center_census.py",
    ROOT / "scratch/atail-force/common_system_metric_probe.py",
)


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def row_key(row: MetricRow) -> str:
    support = ",".join(str(point) for point in row.support)
    return f"c{row.center}:[{support}]"


def row_dict(row: MetricRow) -> dict[str, Any]:
    return {
        "center": row.center,
        "support": list(row.support),
        "exact": row.exact,
    }


def row_from_record(record: Mapping[str, object]) -> MetricRow:
    return MetricRow(
        int(record["center"]),
        tuple(int(point) for point in record["support"]),
        bool(record["exact"]),
    )


def solver_versions() -> dict[str, str]:
    singular = subprocess.run(
        ["Singular", "--version"],
        capture_output=True,
        text=True,
        timeout=10,
        check=False,
    )
    msolve = subprocess.run(
        ["msolve", "--version"],
        capture_output=True,
        text=True,
        timeout=10,
        check=False,
    )
    singular_line = next(
        (line.strip() for line in singular.stdout.splitlines() if line.strip()),
        "UNKNOWN",
    )
    msolve_line = next(
        (line.strip() for line in msolve.stdout.splitlines() if line.strip()),
        "UNKNOWN",
    )
    if singular.returncode != 0 or msolve.returncode != 0:
        raise RuntimeError("unable to identify Singular/msolve versions")
    return {"singular": singular_line, "msolve": msolve_line}


def load_source() -> dict[str, Any]:
    actual = file_sha256(SOURCE)
    if actual != SOURCE_SHA256:
        raise RuntimeError(
            f"fresh checkpoint drift: expected {SOURCE_SHA256}, found {actual}"
        )
    source = json.loads(SOURCE.read_text(encoding="utf-8"))
    if source["schema"] != "p97-atail-selected-row-own-cap-bound-refresh-v1":
        raise RuntimeError("unexpected fresh checkpoint schema")
    return source


def fresh_cases(source: Mapping[str, object]) -> tuple[dict[str, Any], ...]:
    cases = tuple(
        case
        for case in source["cases"]
        if case.get("survivor") is not None
        and case.get("solver", {}).get("raw_status") == "SAT"
    )
    if len(cases) != 11:
        raise RuntimeError(f"expected 11 fresh SAT survivors, found {len(cases)}")
    if len({int(case["partition"]["shard_index"]) for case in cases}) != 11:
        raise RuntimeError("fresh SAT survivor shard ids are not unique")
    return tuple(sorted(cases, key=lambda case: int(case["partition"]["shard_index"])))


def case_rows(case: Mapping[str, object]) -> tuple[MetricRow, ...]:
    rows = tuple(
        sorted(
            (
                row_from_record(record)
                for record in case["survivor"]["distinct_metric_rows"]
            ),
            key=lambda row: row.center,
        )
    )
    if len(rows) != 12 or {row.center for row in rows} != set(range(12)):
        raise RuntimeError("fresh survivor must contain one row at every center")
    if any(not row.exact or len(row.support) != 4 for row in rows):
        raise RuntimeError("fresh survivor row is not an exact selected four-row")
    return rows


def case_grids(case: Mapping[str, object], rows: Sequence[MetricRow]) -> list[dict[str, Any]]:
    profile = tuple(int(value) for value in case["survivor"]["profile"])
    if profile != (5, 5, 5):
        raise RuntimeError(f"unexpected fresh profile {profile}")
    frame = mc.build_frame(profile)
    by_center = {row.center: frozenset(row.support) for row in rows}
    first_candidates = sorted(by_center[1] & frame.caps_int["O1"])
    second_candidates = sorted(by_center[2] & frame.caps_int["O2"])
    grids = []
    for first_pair in combinations(first_candidates, 2):
        for second_pair in combinations(second_candidates, 2):
            a, b = first_pair
            z1, z2 = second_pair
            grids.append(
                {
                    "first_strict_pair": [a, b],
                    "second_strict_pair": [z1, z2],
                    "forward_membership": [
                        [int(a in by_center[z1]), int(b in by_center[z1])],
                        [int(a in by_center[z2]), int(b in by_center[z2])],
                    ],
                    "reverse_membership": [
                        [int(z1 in by_center[a]), int(z2 in by_center[a])],
                        [int(z1 in by_center[b]), int(z2 in by_center[b])],
                    ],
                    "named_centers": sorted({1, 2, a, b, z1, z2}),
                    "minimal_second_apex_equality_present": (
                        a in by_center[2] and b in by_center[2]
                    ),
                    "outside_pair_terminal_present": (
                        (a in by_center[z1] and b in by_center[z1])
                        or (a in by_center[z2] and b in by_center[z2])
                    ),
                }
            )
    return grids


def result_summary(result: metric_oracle.OracleResult) -> dict[str, Any]:
    answer: dict[str, Any] = {"verdict": result.verdict}
    if result.detail is not None:
        answer["detail"] = result.detail
    if result.returncode is not None:
        answer["returncode"] = result.returncode
    return answer


def run_singular_std(
    variables: Sequence[str], polynomials: Sequence[str], *, timeout_s: float
) -> metric_oracle.OracleResult:
    """Use deterministic char-0 Buchberger rather than slimgb on proper ideals.

    The older oracle template's marked parser is retained, but ``std`` is the
    repository solver guide's arbiter and terminates much more reliably than
    ``slimgb`` on the positive-dimensional row-deletion systems encountered
    during MARCO shrinking.
    """

    script = metric_oracle.singular_script(variables, polynomials).replace(
        "ideal G = slimgb(I);", "ideal G = std(I);"
    )
    if "ideal G = std(I);" not in script:
        return metric_oracle.OracleResult(
            "ERROR", detail="unable to select Singular std"
        )
    try:
        process = subprocess.run(
            ["Singular", "-q"],
            input=script,
            capture_output=True,
            text=True,
            timeout=timeout_s,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return metric_oracle.OracleResult("TIMEOUT")
    except OSError as error:
        return metric_oracle.OracleResult(
            "ERROR", detail=f"{type(error).__name__}: {error}"
        )
    if process.returncode != 0:
        return metric_oracle.OracleResult(
            "ERROR",
            detail=process.stderr.strip() or process.stdout.strip(),
            returncode=process.returncode,
        )
    verdict = metric_oracle.parse_singular_verdict(process.stdout)
    if verdict == "ERROR":
        return metric_oracle.OracleResult(
            "ERROR",
            detail="missing or malformed marked Singular std verdict",
            returncode=process.returncode,
        )
    return metric_oracle.OracleResult(verdict, returncode=process.returncode)


def crosscheck_rows(
    rows: Sequence[MetricRow], *, timeout_s: float, certify_nonunit: bool = True
) -> dict[str, Any]:
    variables = tuple(str(value) for value in metric_oracle.variable_symbols(12))
    polynomials = metric_oracle.serialized_system(12, rows)
    if not polynomials:
        return {
            "status": "CROSSCHECKED_NONUNIT",
            "singular_algorithm": "mathematical-zero-ideal",
            "singular_qq": {"verdict": "NONUNIT", "detail": "zero ideal"},
            "msolve_qq_forward_variables": {
                "verdict": "NONUNIT",
                "detail": "zero ideal",
            },
            "msolve_qq_reverse_variables": {
                "verdict": "NONUNIT",
                "detail": "zero ideal",
            },
            "expanded_polynomial_count": 0,
            "expanded_polynomial_sha256": canonical_sha256([]),
        }
    msolve_forward = metric_oracle.run_msolve(
        variables, polynomials, timeout_s=timeout_s
    )
    msolve_reverse = metric_oracle.run_msolve(
        tuple(reversed(variables)), polynomials, timeout_s=timeout_s
    )
    msolve_pair = (msolve_forward.verdict, msolve_reverse.verdict)
    if msolve_pair == ("UNIT", "UNIT"):
        singular_algorithm = "slimgb-reverse-variable-order"
        singular = metric_oracle.run_singular(
            tuple(reversed(variables)), polynomials, timeout_s=timeout_s
        )
    elif msolve_pair == ("NONUNIT", "NONUNIT") and not certify_nonunit:
        return {
            "status": "PROPOSED_NONUNIT_MSOLVE_PAIR",
            "singular_algorithm": "not-run-discovery-proposal",
            "singular_qq": {"verdict": "NOT_RUN_PROPOSAL_ONLY"},
            "msolve_qq_forward_variables": result_summary(msolve_forward),
            "msolve_qq_reverse_variables": result_summary(msolve_reverse),
            "expanded_polynomial_count": len(polynomials),
            "expanded_polynomial_sha256": canonical_sha256(list(polynomials)),
        }
    else:
        singular_algorithm = "std"
        singular = run_singular_std(
            variables, polynomials, timeout_s=timeout_s
        )
    verdicts = (singular.verdict, msolve_forward.verdict, msolve_reverse.verdict)
    if len(set(verdicts)) == 1 and verdicts[0] in {"UNIT", "NONUNIT"}:
        status = f"CROSSCHECKED_{verdicts[0]}"
    else:
        status = "UNDECIDED_ORACLE_DISAGREEMENT_OR_TIMEOUT"
    return {
        "status": status,
        "singular_algorithm": singular_algorithm,
        "singular_qq": result_summary(singular),
        "msolve_qq_forward_variables": result_summary(msolve_forward),
        "msolve_qq_reverse_variables": result_summary(msolve_reverse),
        "expanded_polynomial_count": len(polynomials),
        "expanded_polynomial_sha256": canonical_sha256(list(polynomials)),
    }


def smoke_gates(timeout_s: float) -> dict[str, Any]:
    variables = ("z",)
    cases = {
        "known_unit": (("z", "z-1"), "UNIT"),
        "known_nonunit": (("z^2-1",), "NONUNIT"),
    }
    output: dict[str, Any] = {}
    for name, (polynomials, expected) in cases.items():
        forward = metric_oracle.run_msolve(
            variables, polynomials, timeout_s=timeout_s
        )
        reverse = metric_oracle.run_msolve(
            tuple(reversed(variables)), polynomials, timeout_s=timeout_s
        )
        if expected == "UNIT":
            singular_algorithm = "slimgb-reverse-variable-order"
            singular = metric_oracle.run_singular(
                tuple(reversed(variables)), polynomials, timeout_s=timeout_s
            )
        else:
            singular_algorithm = "std"
            singular = run_singular_std(
                variables, polynomials, timeout_s=timeout_s
            )
        verdicts = (singular.verdict, forward.verdict, reverse.verdict)
        if verdicts != (expected, expected, expected):
            raise RuntimeError(
                f"smoke {name} expected {expected}, received {verdicts}"
            )
        output[name] = {
            "expected": expected,
            "singular_algorithm": singular_algorithm,
            "singular_qq": result_summary(singular),
            "msolve_qq_forward_variables": result_summary(forward),
            "msolve_qq_reverse_variables": result_summary(reverse),
        }
    return output


@dataclass
class ExactRowOracle:
    rows: tuple[MetricRow, ...]
    timeout_s: float

    def __post_init__(self) -> None:
        self.by_key = {row_key(row): row for row in self.rows}
        self.cache: dict[tuple[frozenset[str], bool], dict[str, Any]] = {}
        self.records: list[dict[str, Any]] = []

    def crosscheck(
        self, subset: frozenset[str], *, certify_nonunit: bool
    ) -> dict[str, Any]:
        cache_key = (subset, certify_nonunit)
        if cache_key in self.cache:
            return self.cache[cache_key]
        selected = tuple(
            row for row in self.rows if row_key(row) in subset
        )
        checked = crosscheck_rows(
            selected,
            timeout_s=self.timeout_s,
            certify_nonunit=certify_nonunit,
        )
        self.cache[cache_key] = checked
        self.records.append(
            {
                "certify_nonunit_requested": certify_nonunit,
                "rows": [row_key(row) for row in selected],
                "row_count": len(selected),
                "status": checked["status"],
                "singular_algorithm": checked["singular_algorithm"],
                "singular_qq": checked["singular_qq"],
                "msolve_qq_forward_variables": checked[
                    "msolve_qq_forward_variables"
                ],
                "msolve_qq_reverse_variables": checked[
                    "msolve_qq_reverse_variables"
                ],
                "expanded_polynomial_count": checked[
                    "expanded_polynomial_count"
                ],
                "expanded_polynomial_sha256": checked[
                    "expanded_polynomial_sha256"
                ],
            }
        )
        return checked

    def marco_verdict(self, subset: frozenset[str]) -> str:
        status = self.crosscheck(subset, certify_nonunit=False)["status"]
        if status == "CROSSCHECKED_UNIT":
            return "UNSAT"
        if status in {
            "CROSSCHECKED_NONUNIT",
            "PROPOSED_NONUNIT_MSOLVE_PAIR",
        }:
            return "SAT"
        return "UNKNOWN"


def classify_core(
    core_keys: Sequence[str],
    oracle: ExactRowOracle,
    order: Sequence[int],
    grids: Sequence[Mapping[str, object]],
) -> dict[str, Any]:
    rows = tuple(oracle.by_key[key] for key in core_keys)
    bank_matches = producer_bank.scan_all_formalized_cores(rows, 12, order)
    center_set = {row.center for row in rows}
    grid_coverage = []
    for index, grid in enumerate(grids):
        named = set(int(value) for value in grid["named_centers"])
        grid_coverage.append(
            {
                "grid_index": index,
                "core_centers_inside_named_six": center_set <= named,
                "named_center_rows_used": sorted(center_set & named),
                "unnamed_center_rows_used": sorted(center_set - named),
            }
        )
    return {
        "rows": [row_dict(row) for row in rows],
        "row_count": len(rows),
        "center_set": sorted(center_set),
        "used_point_count": len(
            {point for row in rows for point in (row.center, *row.support)}
        ),
        "current_formalized_bank_matches": list(bank_matches),
        "current_formalized_bank_match_count": len(bank_matches),
        "grid_center_coverage": grid_coverage,
        "immediate_k_a_consumer": False,
        "immediate_k_a_consumer_reason": (
            "the CAS core uses complete fixed-shadow selected rows; the live "
            "continuation packet does not produce their anonymous support memberships"
        ),
    }


def run_case(
    case: Mapping[str, object],
    *,
    timeout_s: float,
    max_oracle_calls: int,
    max_minimal_cores: int,
    max_map_iterations: int,
    full_only: bool,
) -> dict[str, Any]:
    shard = int(case["partition"]["shard_index"])
    rows = case_rows(case)
    grids = case_grids(case, rows)
    order = tuple(int(value) for value in case["survivor"]["frame"]["cyclic_order"])
    bank_matches = producer_bank.scan_all_formalized_cores(rows, 12, order)
    current_bank_clean = not bank_matches
    oracle = ExactRowOracle(rows, timeout_s)
    universe = tuple(row_key(row) for row in rows)
    full = oracle.crosscheck(frozenset(universe), certify_nonunit=True)
    if full["status"] not in {"CROSSCHECKED_UNIT", "CROSSCHECKED_NONUNIT"}:
        raise RuntimeError(f"shard {shard} full equality ideal was undecided")

    result: dict[str, Any] | None = None
    cores: list[dict[str, Any]] = []
    if (
        not full_only
        and current_bank_clean
        and full["status"] == "CROSSCHECKED_UNIT"
    ):
        marco = MarcoEnumerator(
            universe,
            oracle.marco_verdict,
            max_oracle_calls=max_oracle_calls,
            max_minimal_cores=max_minimal_cores,
            max_map_iterations=max_map_iterations,
        ).run()
        for core in marco.minimal_cores:
            checked = oracle.crosscheck(
                frozenset(core.atoms), certify_nonunit=True
            )
            if checked["status"] != "CROSSCHECKED_UNIT":
                raise RuntimeError("MARCO returned a non-UNIT core")
            deletion_checks = []
            for key in core.atoms:
                deleted = frozenset(atom for atom in core.atoms if atom != key)
                deletion_checks.append(
                    {
                        "deleted_row": key,
                        "status": oracle.crosscheck(
                            deleted, certify_nonunit=False
                        )["status"],
                    }
                )
            deletion_minimal = all(
                item["status"] == "CROSSCHECKED_NONUNIT"
                for item in deletion_checks
            )
            proposal_minimal = all(
                item["status"] in {
                    "CROSSCHECKED_NONUNIT",
                    "PROPOSED_NONUNIT_MSOLVE_PAIR",
                }
                for item in deletion_checks
            )
            if not proposal_minimal:
                raise RuntimeError("MARCO proposal core has a UNIT one-row deletion")
            classified = classify_core(core.atoms, oracle, order, grids)
            classified.update(
                {
                    "discovery_index": core.discovery_index,
                    "row_keys": list(core.atoms),
                    "crosscheck": checked,
                    "deletion_checks": deletion_checks,
                    "crosschecked_deletion_minimal": deletion_minimal,
                    "msolve_pair_proposal_deletion_minimal": proposal_minimal,
                }
            )
            cores.append(classified)
        result = {
            "status": marco.status,
            "oracle_calls": marco.oracle_calls,
            "cache_hits": marco.cache_hits,
            "map_iterations": marco.map_iterations,
            "unknown_subset": (
                list(marco.unknown_subset)
                if marco.unknown_subset is not None
                else None
            ),
            "minimal_core_count": len(cores),
        }

    return {
        "shard_index": shard,
        "profile": list(case["survivor"]["profile"]),
        "source_witness_sha256": case["survivor"]["witness_sha256"],
        "source_rows_sha256": case["survivor"]["distinct_metric_rows_sha256"],
        "cyclic_order": list(order),
        "rows": [row_dict(row) for row in rows],
        "row_universe_sha256": canonical_sha256([row_key(row) for row in rows]),
        "strict_pair_grids": grids,
        "strict_pair_grid_count": len(grids),
        "current_formalized_bank_clean": current_bank_clean,
        "current_formalized_bank_match_count": len(bank_matches),
        "current_formalized_bank_matches": list(bank_matches),
        "full_equality_ideal": full,
        "marco": result,
        "minimal_cores": cores,
        "oracle_records": oracle.records,
    }


def build_document(args: argparse.Namespace) -> dict[str, Any]:
    source = load_source()
    cases = fresh_cases(source)
    smokes = smoke_gates(min(args.per_solver_timeout_seconds, 5.0))
    results = [
        run_case(
            case,
            timeout_s=args.per_solver_timeout_seconds,
            max_oracle_calls=args.max_oracle_calls,
            max_minimal_cores=args.max_minimal_cores,
            max_map_iterations=args.max_map_iterations,
            full_only=args.full_only,
        )
        for case in cases
    ]
    grid_count = sum(case["strict_pair_grid_count"] for case in results)
    if grid_count != 13:
        raise RuntimeError(f"expected 13 strict grids, found {grid_count}")
    clean_ids = [
        case["shard_index"]
        for case in results
        if case["current_formalized_bank_clean"]
    ]
    dirty_ids = [
        case["shard_index"]
        for case in results
        if not case["current_formalized_bank_clean"]
    ]
    if len(clean_ids) != 6 or len(dirty_ids) != 5:
        raise RuntimeError(
            "expected live broader-bank split of 6 clean / 5 dirty, found "
            f"{len(clean_ids)} clean / {len(dirty_ids)} dirty"
        )
    return {
        "schema": SCHEMA,
        "source": {
            "path": str(SOURCE.relative_to(ROOT)),
            "sha256": SOURCE_SHA256,
            "fresh_sat_survivor_count": len(results),
            "strict_pair_grid_count": grid_count,
        },
        "driver_sha256": file_sha256(Path(__file__)),
        "support_file_sha256": {
            str(path.relative_to(ROOT)): file_sha256(path) for path in SUPPORT_FILES
        },
        "solver_versions": solver_versions(),
        "commands": {
            "full_probe": (
                "UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python "
                "scratch/atail-force/fresh-continuation-marco/mine.py --full-only"
            ),
            "marco": (
                "UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python "
                "scratch/atail-force/fresh-continuation-marco/mine.py"
            ),
        },
        "budgets": {
            "full_only": args.full_only,
            "per_solver_timeout_seconds": args.per_solver_timeout_seconds,
            "max_oracle_calls_per_survivor": args.max_oracle_calls,
            "max_minimal_cores_per_survivor": args.max_minimal_cores,
            "max_map_iterations_per_survivor": args.max_map_iterations,
        },
        "smoke_gates": smokes,
        "cases": results,
        "summary": {
            "crosschecked_unit_full_ideals": sum(
                case["full_equality_ideal"]["status"] == "CROSSCHECKED_UNIT"
                for case in results
            ),
            "crosschecked_nonunit_full_ideals": sum(
                case["full_equality_ideal"]["status"] == "CROSSCHECKED_NONUNIT"
                for case in results
            ),
            "minimal_core_count": sum(len(case["minimal_cores"]) for case in results),
            "current_formalized_bank_clean_shard_ids": clean_ids,
            "current_formalized_bank_dirty_shard_ids": dirty_ids,
            "current_formalized_bank_dirty_matches": {
                str(case["shard_index"]): case["current_formalized_bank_matches"]
                for case in results
                if not case["current_formalized_bank_clean"]
            },
            "immediate_k_a_consumer_count": sum(
                core["immediate_k_a_consumer"]
                for case in results
                for core in case["minimal_cores"]
            ),
        },
        "scope": {
            "only_final_fresh_checkpoint_loaded": True,
            "fixed_card_12_555_placement_only": True,
            "all_11_fresh_sat_survivors_checked": True,
            "marco_restricted_to_6_live_broader_bank_clean_survivors": True,
            "all_13_strict_pair_grids_linked": True,
            "grid_selection_changes_named_roles_not_equality_ideal": True,
            "complex_equality_ideal_only": True,
            "real_feasibility_checked": False,
            "convexity_or_orientation_encoded": False,
            "exact_off_radius_disequalities_encoded": False,
            "producer_proved": False,
            "lean_theorem_proved": False,
            "trusted_exact_cas_computation": True,
            "nullstellensatz_certificate_replayed": False,
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--full-only", action="store_true")
    parser.add_argument("--per-solver-timeout-seconds", type=float, default=15.0)
    parser.add_argument("--max-oracle-calls", type=int, default=96)
    parser.add_argument("--max-minimal-cores", type=int, default=4)
    parser.add_argument("--max-map-iterations", type=int, default=256)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    document = build_document(args)
    rendered = json.dumps(document, indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists():
            raise FileNotFoundError(args.output)
        saved = json.loads(args.output.read_text(encoding="utf-8"))
        if document != saved:
            raise AssertionError("fresh continuation MARCO checkpoint drift")
    else:
        args.output.write_text(rendered, encoding="utf-8")
    print(json.dumps(document["summary"], sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
