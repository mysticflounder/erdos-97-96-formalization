#!/usr/bin/env python3
"""Exact equality-ideal oracle for the two card-12 Q-C shadows.

The source witnesses contain 29 named rows, but repeated provenance rows do
not add metric equations.  This driver validates and regenerates those
witnesses, canonicalizes their distinct center/support circles, pins

    point 0 = (0, 0), point 1 = (1, 0),

and asks whether the resulting squared-distance equalities generate the unit
ideal over QQ.  A unit ideal excludes normalized complex coordinates and,
hence, normalized real coordinates.  A proper ideal only establishes a
complex point abstractly; it is *not* a real witness.

Every decisive target verdict is checked by Singular over QQ and by msolve in
two declared variable orders.  The calculations are trusted exact-CAS
computations; no Nullstellensatz certificate is independently replayed.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
import tempfile
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Mapping, Sequence

import sympy as sp


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SOURCE_DIR = HERE.parent / "second_center_query"
CHECKPOINT = HERE / "checkpoint.json"
MANIFEST = HERE / "manifest.json"
SCHEMA = "p97-atail-second-center-metric-oracle-v1"
CASE_SCHEMA = "p97-atail-second-center-metric-oracle-case-v1"
CASE_BUDGET_S = 55.0
ORACLE_TIMEOUT_S = 12.0
DELETION_TIMEOUT_S = 4.0
DELETION_RESERVE_S = 12.0

# query.py imports its sibling validator by its unqualified module name.
for path in (str(ROOT), str(SOURCE_DIR)):
    if path not in sys.path:
        sys.path.insert(0, path)

import query as source_query  # noqa: E402
from census.global_confinement.equality_ideal_probe import (  # noqa: E402
    OracleResult,
    parse_singular_verdict,
    singular_script,
)
from census.global_confinement.metric_realizability_probe import (  # noqa: E402
    MetricRow,
)


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_manifest() -> dict[str, Any]:
    manifest = json.loads(MANIFEST.read_text(encoding="utf-8"))
    assert manifest["scope"]["target_faithful"] is False
    assert manifest["omitted_fail_closed"]
    return manifest


def coordinate_symbols(n: int) -> tuple[tuple[sp.Expr, sp.Expr], ...]:
    if n < 2:
        raise ValueError("the normalized 0/1 gauge needs at least two labels")
    points: list[tuple[sp.Expr, sp.Expr]] = [
        (sp.Integer(0), sp.Integer(0)),
        (sp.Integer(1), sp.Integer(0)),
    ]
    for label in range(2, n):
        points.append(sp.symbols(f"x{label}x x{label}y"))
    return tuple(points)


def variable_symbols(n: int) -> tuple[sp.Symbol, ...]:
    return tuple(
        coordinate
        for point in coordinate_symbols(n)[2:]
        for coordinate in point
        if isinstance(coordinate, sp.Symbol)
    )


def squared_distance(
    points: Sequence[tuple[sp.Expr, sp.Expr]], left: int, right: int
) -> sp.Expr:
    return sp.expand(
        (points[left][0] - points[right][0]) ** 2
        + (points[left][1] - points[right][1]) ** 2
    )


def row_polynomials(n: int, row: MetricRow) -> tuple[sp.Poly, ...]:
    if len(row.support) < 2:
        raise ValueError("a metric row needs at least two support points")
    points = coordinate_symbols(n)
    variables = variable_symbols(n)
    pivot = row.support[0]
    pivot_distance = squared_distance(points, row.center, pivot)
    return tuple(
        sp.Poly(
            sp.expand(
                pivot_distance
                - squared_distance(points, row.center, support_point)
            ),
            *variables,
            domain=sp.QQ,
        )
        for support_point in row.support[1:]
    )


def system_polynomials(n: int, rows: Sequence[MetricRow]) -> tuple[sp.Poly, ...]:
    return tuple(
        polynomial for row in rows for polynomial in row_polynomials(n, row)
    )


def serialize_poly(poly: sp.Poly) -> str:
    """Serialize an expanded QQ polynomial without parser-sensitive grouping."""

    terms: list[str] = []
    variables = poly.gens
    for exponents, coefficient in poly.terms():
        if not coefficient:
            continue
        factors = [
            str(variable) if exponent == 1 else f"{variable}^{exponent}"
            for variable, exponent in zip(variables, exponents)
            if exponent
        ]
        monomial = "*".join(factors)
        magnitude = abs(coefficient)
        if monomial:
            coefficient_text = "" if magnitude == 1 else f"{magnitude}*"
            body = coefficient_text + monomial
        else:
            body = str(magnitude)
        if not terms:
            terms.append(("-" if coefficient < 0 else "") + body)
        else:
            terms.append(("-" if coefficient < 0 else "+") + body)
    result = "".join(terms) or "0"
    if "(" in result or ")" in result or "**" in result:
        raise AssertionError(f"polynomial was not fully expanded: {result}")
    return result


def serialized_system(n: int, rows: Sequence[MetricRow]) -> tuple[str, ...]:
    return tuple(serialize_poly(poly) for poly in system_polynomials(n, rows))


def _metric_key(record: Mapping[str, object]) -> tuple[int, tuple[int, ...]]:
    return int(record["center"]), tuple(int(point) for point in record["support"])


def canonicalize_rows(
    records: Sequence[Mapping[str, object]],
) -> tuple[tuple[MetricRow, ...], dict[tuple[int, tuple[int, ...]], tuple[str, ...]]]:
    provenance: dict[tuple[int, tuple[int, ...]], list[str]] = {}
    for record in records:
        key = _metric_key(record)
        provenance.setdefault(key, []).append(str(record["name"]))
    ordered_keys = sorted(provenance)
    rows = tuple(
        MetricRow(center, support, exact=False) for center, support in ordered_keys
    )
    frozen_provenance = {
        key: tuple(sorted(provenance[key])) for key in ordered_keys
    }
    return rows, frozen_provenance


def row_dict(row: MetricRow) -> dict[str, Any]:
    return {"center": row.center, "support": list(row.support)}


def row_from_dict(record: Mapping[str, object]) -> MetricRow:
    return MetricRow(
        int(record["center"]),
        tuple(int(point) for point in record["support"]),
        exact=False,
    )


@dataclass
class CaseBudget:
    seconds: float = CASE_BUDGET_S

    def __post_init__(self) -> None:
        self.started = time.monotonic()

    def remaining(self) -> float:
        return max(0.0, self.seconds - (time.monotonic() - self.started))

    def timeout(self, cap: float, *, reserve: float = 0.0) -> float:
        available = self.remaining() - reserve
        if available <= 0.05:
            return 0.0
        return min(cap, available)


def run_singular(
    variables: Sequence[str],
    polynomials: Sequence[str],
    *,
    timeout_s: float,
    executable: str = "Singular",
) -> OracleResult:
    if timeout_s <= 0:
        return OracleResult("TIMEOUT", detail="case wall-clock budget exhausted")
    try:
        process = subprocess.run(
            [executable, "-q"],
            input=singular_script(variables, polynomials),
            capture_output=True,
            text=True,
            timeout=timeout_s,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return OracleResult("TIMEOUT")
    except OSError as error:
        return OracleResult("ERROR", detail=f"{type(error).__name__}: {error}")
    if process.returncode != 0:
        detail = process.stderr.strip() or process.stdout.strip()
        return OracleResult(
            "ERROR",
            detail=detail or "Singular exited without diagnostics",
            returncode=process.returncode,
        )
    verdict = parse_singular_verdict(process.stdout)
    if verdict == "ERROR":
        return OracleResult(
            "ERROR",
            detail="missing or malformed marked Singular verdict",
            returncode=process.returncode,
        )
    return OracleResult(verdict, returncode=process.returncode)


def _msolve_input(
    variables: Sequence[str], polynomials: Sequence[str]
) -> str:
    if not variables:
        raise ValueError("msolve input needs at least one variable")
    if any("(" in polynomial or ")" in polynomial for polynomial in polynomials):
        raise ValueError("msolve polynomials must be expanded")
    return (
        ",".join(variables)
        + "\n0\n"
        + ",\n".join(polynomials)
        + "\n"
    )


def parse_msolve_verdict(output: str) -> str:
    stripped = output.strip()
    if stripped.startswith("[-1]:") or stripped == "[-1]":
        return "UNIT"
    if stripped:
        return "NONUNIT"
    return "ERROR"


def run_msolve(
    variables: Sequence[str],
    polynomials: Sequence[str],
    *,
    timeout_s: float,
    executable: str = "msolve",
) -> OracleResult:
    if timeout_s <= 0:
        return OracleResult("TIMEOUT", detail="case wall-clock budget exhausted")
    try:
        with tempfile.TemporaryDirectory(prefix="p97-atail-msolve-") as temp:
            input_path = Path(temp) / "system.ms"
            output_path = Path(temp) / "output.txt"
            input_path.write_text(
                _msolve_input(variables, polynomials), encoding="utf-8"
            )
            process = subprocess.run(
                [
                    executable,
                    "-f",
                    str(input_path),
                    "-o",
                    str(output_path),
                    "-t",
                    "1",
                ],
                capture_output=True,
                text=True,
                timeout=timeout_s,
                check=False,
            )
            output = (
                output_path.read_text(encoding="utf-8")
                if output_path.exists()
                else ""
            )
    except subprocess.TimeoutExpired:
        return OracleResult("TIMEOUT")
    except OSError as error:
        return OracleResult("ERROR", detail=f"{type(error).__name__}: {error}")
    if process.returncode != 0:
        detail = process.stderr.strip() or process.stdout.strip()
        return OracleResult(
            "ERROR",
            detail=detail or "msolve exited without diagnostics",
            returncode=process.returncode,
        )
    verdict = parse_msolve_verdict(output)
    if verdict == "ERROR":
        return OracleResult(
            "ERROR",
            detail="empty or malformed msolve output",
            returncode=process.returncode,
        )
    return OracleResult(verdict, returncode=process.returncode)


def result_dict(result: OracleResult) -> dict[str, Any]:
    # Stable checkpoints intentionally omit platform return codes and timings.
    answer: dict[str, Any] = {"verdict": result.verdict}
    if result.detail is not None:
        answer["detail"] = result.detail
    return answer


def smoke_gates() -> dict[str, Any]:
    variables = ("z",)
    cases = {
        "known_unit": (("z", "z-1"), "UNIT"),
        "known_nonunit": (("z^2-1",), "NONUNIT"),
    }
    report: dict[str, Any] = {}
    for name, (polynomials, expected) in cases.items():
        singular = run_singular(
            variables, polynomials, timeout_s=5.0, executable="Singular"
        )
        msolve = run_msolve(
            variables, polynomials, timeout_s=5.0, executable="msolve"
        )
        if singular.verdict != expected or msolve.verdict != expected:
            raise RuntimeError(
                f"smoke gate {name} expected {expected}: "
                f"Singular={singular.verdict}, msolve={msolve.verdict}"
            )
        report[name] = {
            "expected": expected,
            "singular": result_dict(singular),
            "msolve": result_dict(msolve),
        }
    return report


def crosscheck_system(
    n: int,
    rows: Sequence[MetricRow],
    *,
    budget: CaseBudget,
    reserve_s: float = 0.0,
) -> dict[str, Any]:
    variables = tuple(str(variable) for variable in variable_symbols(n))
    polynomials = serialized_system(n, rows)
    singular = run_singular(
        variables,
        polynomials,
        timeout_s=budget.timeout(ORACLE_TIMEOUT_S, reserve=reserve_s),
    )
    msolve_forward = run_msolve(
        variables,
        polynomials,
        timeout_s=budget.timeout(ORACLE_TIMEOUT_S, reserve=reserve_s),
    )
    msolve_reverse = run_msolve(
        tuple(reversed(variables)),
        polynomials,
        timeout_s=budget.timeout(ORACLE_TIMEOUT_S, reserve=reserve_s),
    )
    verdicts = (
        singular.verdict,
        msolve_forward.verdict,
        msolve_reverse.verdict,
    )
    if len(set(verdicts)) == 1 and verdicts[0] in {"UNIT", "NONUNIT"}:
        status = f"CROSSCHECKED_{verdicts[0]}"
    else:
        status = "UNDECIDED_ORACLE_DISAGREEMENT_OR_TIMEOUT"
    return {
        "status": status,
        "singular_qq": result_dict(singular),
        "msolve_qq_forward_variables": result_dict(msolve_forward),
        "msolve_qq_reverse_variables": result_dict(msolve_reverse),
    }


def bounded_row_deletion(
    n: int,
    rows: Sequence[MetricRow],
    *,
    budget: CaseBudget,
) -> dict[str, Any]:
    """One deterministic row-deletion pass, retaining timeout/error rows."""

    active = list(enumerate(rows))
    attempts: list[dict[str, Any]] = []
    variables = tuple(str(variable) for variable in variable_symbols(n))
    for original_index, row in tuple(active):
        timeout = budget.timeout(DELETION_TIMEOUT_S, reserve=DELETION_RESERVE_S)
        if timeout <= 0:
            result = OracleResult(
                "TIMEOUT", detail="deletion budget exhausted before attempt"
            )
        else:
            candidate = tuple(
                candidate_row
                for index, candidate_row in active
                if index != original_index
            )
            result = run_singular(
                variables,
                serialized_system(n, candidate),
                timeout_s=timeout,
            )
        removed = result.verdict == "UNIT"
        attempts.append(
            {
                "original_index": original_index,
                "verdict": result.verdict,
                "removed": removed,
            }
        )
        if removed:
            active = [item for item in active if item[0] != original_index]
    retained = tuple(row for _, row in active)
    retained_indices = {index for index, _ in active}
    confirmed_irredundant = all(
        attempt["verdict"] == "NONUNIT"
        for attempt in attempts
        if int(attempt["original_index"]) in retained_indices
    )
    return {
        "strategy": "one-pass-canonical-row-deletion",
        "initial_row_count": len(rows),
        "retained_row_count": len(retained),
        "retained_equality_count": len(serialized_system(n, retained)),
        "complete": all(
            attempt["verdict"] in {"UNIT", "NONUNIT"}
            for attempt in attempts
        ),
        "confirmed_row_irredundant": confirmed_irredundant,
        "retained_rows": [row_dict(row) for row in retained],
        "attempts": attempts,
    }


def _provenance_document(
    provenance: Mapping[tuple[int, tuple[int, ...]], Sequence[str]],
) -> list[dict[str, Any]]:
    return [
        {
            "center": center,
            "support": list(support),
            "source_row_names": list(provenance[(center, support)]),
        }
        for center, support in sorted(provenance)
    ]


def _base_case(case: Mapping[str, object]) -> tuple[dict[str, Any], tuple[MetricRow, ...]]:
    n = int(case["frame"]["n"])
    records = list(case["rows"])
    rows, provenance = canonicalize_rows(records)
    polynomials = serialized_system(n, rows)
    base = {
        "schema": CASE_SCHEMA,
        "profile": list(case["profile"]),
        "source_witness_sha256": str(case["witness_sha256"]),
        "serialized_row_count": len(records),
        "distinct_metric_row_count": len(rows),
        "duplicate_provenance_row_count": len(records) - len(rows),
        "equality_count": len(polynomials),
        "coordinate_variable_count": len(variable_symbols(n)),
        "coordinate_gauge": {"point_0": [0, 0], "point_1": [1, 0]},
        "distinct_metric_rows_sha256": canonical_sha256(
            [row_dict(row) for row in rows]
        ),
        "row_provenance_sha256": canonical_sha256(
            _provenance_document(provenance)
        ),
        "expanded_polynomial_sha256": canonical_sha256(list(polynomials)),
    }
    return base, rows


def discover_case(case: Mapping[str, object]) -> dict[str, Any]:
    base, rows = _base_case(case)
    n = int(case["frame"]["n"])
    budget = CaseBudget()
    full = crosscheck_system(
        n, rows, budget=budget, reserve_s=DELETION_RESERVE_S
    )
    base["full_equality_ideal"] = full
    if full["status"] != "CROSSCHECKED_UNIT":
        base["reported_status"] = (
            "NORMALIZED_COMPLEX_REALIZATION_NOT_EXCLUDED"
            if full["status"] == "CROSSCHECKED_NONUNIT"
            else "UNDECIDED_FAIL_CLOSED"
        )
        base["bounded_deletion"] = {"status": "NOT_RUN_FULL_IDEAL_NOT_UNIT"}
        return base

    deletion = bounded_row_deletion(n, rows, budget=budget)
    retained = tuple(row_from_dict(row) for row in deletion["retained_rows"])
    deletion["retained_core_crosscheck"] = crosscheck_system(
        n, retained, budget=budget
    )
    base["bounded_deletion"] = deletion
    base["reported_status"] = "NO_NORMALIZED_COMPLEX_OR_REAL_EQUALITY_REALIZATION"
    return base


def replay_case(
    case: Mapping[str, object], saved: Mapping[str, object]
) -> dict[str, Any]:
    base, rows = _base_case(case)
    for field in (
        "schema",
        "profile",
        "source_witness_sha256",
        "serialized_row_count",
        "distinct_metric_row_count",
        "duplicate_provenance_row_count",
        "equality_count",
        "coordinate_variable_count",
        "coordinate_gauge",
        "distinct_metric_rows_sha256",
        "row_provenance_sha256",
        "expanded_polynomial_sha256",
    ):
        if base[field] != saved[field]:
            raise AssertionError(f"saved case drift in field {field}")
    n = int(case["frame"]["n"])
    budget = CaseBudget()
    base["full_equality_ideal"] = crosscheck_system(
        n, rows, budget=budget, reserve_s=DELETION_RESERVE_S
    )
    saved_deletion = dict(saved["bounded_deletion"])
    retained = tuple(
        row_from_dict(row) for row in saved_deletion["retained_rows"]
    )
    if not set(retained) <= set(rows):
        raise AssertionError("saved deletion core is not a source-row subset")
    saved_deletion["retained_core_crosscheck"] = crosscheck_system(
        n, retained, budget=budget
    )
    base["bounded_deletion"] = saved_deletion
    base["reported_status"] = str(saved["reported_status"])
    return base


def source_artifact() -> dict[str, Any]:
    artifact = source_query.build_artifact()
    if len(artifact["cases"]) != 2:
        raise AssertionError("expected exactly the two saved card-12 cases")
    return artifact


def document(*, saved: Mapping[str, object] | None = None) -> dict[str, Any]:
    manifest = load_manifest()
    source = source_artifact()
    if saved is None:
        cases = [discover_case(case) for case in source["cases"]]
    else:
        saved_by_profile = {
            tuple(int(x) for x in case["profile"]): case
            for case in saved["cases"]
        }
        cases = [
            replay_case(case, saved_by_profile[tuple(case["profile"])])
            for case in source["cases"]
        ]
    return {
        "schema": SCHEMA,
        "manifest_sha256": canonical_sha256(manifest),
        "source": {
            "query_checkpoint_sha256": file_sha256(SOURCE_DIR / "checkpoint.json"),
            "query_manifest_sha256": file_sha256(SOURCE_DIR / "manifest.json"),
            "source_artifact_manifest_sha256": source["manifest_sha256"],
        },
        "smoke_gates": smoke_gates(),
        "cases": cases,
        "scope": {
            "target_faithful": False,
            "trusted_exact_cas_computation": True,
            "singular_qq_and_msolve_two_order_crosscheck": True,
            "nullstellensatz_certificate_replayed": False,
            "normalized_complex_branch_only": True,
            "real_exclusion_follows_from_complex_exclusion": True,
            "all_card_12_placements_exhausted": False,
            "card_11_included": False,
            "producer_proved": False,
            "lean_theorem_proved": False,
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--discover",
        action="store_true",
        help="run bounded core discovery instead of replaying the checkpoint",
    )
    parser.add_argument(
        "--check",
        action="store_true",
        help="replay exact full/core verdicts and compare to checkpoint",
    )
    args = parser.parse_args()
    if args.discover and args.check:
        parser.error("choose at most one of --discover and --check")
    if args.discover:
        result = document(saved=None)
    else:
        if not CHECKPOINT.exists():
            raise FileNotFoundError(CHECKPOINT)
        saved = json.loads(CHECKPOINT.read_text(encoding="utf-8"))
        result = document(saved=saved)
        if args.check and result != saved:
            raise AssertionError("metric-oracle checkpoint drift")
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
