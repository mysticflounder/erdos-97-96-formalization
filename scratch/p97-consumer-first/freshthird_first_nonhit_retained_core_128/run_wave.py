"""Bounded FreshThird first-nonhit retained-core structural wave.

This runner is deliberately a finite QF_LIA abstraction.  It records the
source constructor pair and retained deletion arm, but does not claim to
encode Euclidean realizability, a universal extraction/lift, or Lean closure.
The common-endpoint condition is a derived report tag only: all 16 endpoint
tuples are emitted for every one of the eight constructor pairs.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import subprocess
from pathlib import Path
from typing import Any

from z3 import Bool, BoolVal, If, Int, Solver, Sum, sat, unknown

ROOT = Path(__file__).resolve().parent
REPO_ROOT = ROOT.parents[2]
POINTS = ("source0", "source1", "x0", "x1", "y0", "y1")
PAIR_X = ("x0", "x1")
PAIR_Y = ("y0", "y1")

SOURCE_FILES = {
    "fiber": REPO_ROOT
    / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean",
    "residual": REPO_ROOT
    / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean",
    "retained_producer": REPO_ROOT
    / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdRetainedProducer.lean",
}

NONHIT_ARMS = (
    ("sameBlocker", ("center_eq", "support_eq")),
    (
        "sourceRowOmission",
        (
            "deleted",
            "deleted_eq_source1_or_source2",
            "deleted_not_mem_source_row",
            "deletion_survives_exact_four",
        ),
    ),
)
INTERACTION_ARMS = (
    ("sameBlocker", ("center_eq", "support_eq")),
    (
        "sourceRowOmission",
        ("deleted", "deleted_not_mem_source_row", "deletion_survives_exact_four"),
    ),
    (
        "distinctBlockersDifferentCaps",
        (
            "centers_ne",
            "source1_mem_source_row",
            "source2_mem_source_row",
            "exact_two_point_overlap",
            "source_cap",
            "fresh_cap",
            "source_center_mem_source_cap_interior",
            "fresh_center_mem_fresh_cap_interior",
            "caps_ne",
        ),
    ),
    (
        "sameCapWithInternalFiberSource",
        (
            "centers_ne",
            "source1_mem_source_row",
            "source2_mem_source_row",
            "exact_two_point_overlap",
            "cap_index",
            "source_center_mem_same_cap_interior",
            "fresh_center_mem_same_cap_interior",
            "fiber_source_mem_cap",
        ),
    ),
)


def bool_sum(items: Any) -> Any:
    return Sum([If(item, 1, 0) for item in items])


def endpoint_arms() -> tuple[tuple[int, int, int, int], ...]:
    return tuple(itertools.product(range(2), repeat=4))


def arm_name(arm: tuple[int, int, int, int]) -> str:
    x0, y0, x1, y1 = arm
    return f"x{x0}y{y0}_x{x1}y{y1}"


def common_tag(arm: tuple[int, int, int, int]) -> dict[str, Any]:
    x0, y0, x1, y1 = arm
    x = x0 == x1
    y = y0 == y1
    side = "x+y" if x and y else "x" if x else "y" if y else None
    return {
        "kind": "derived_conditional_tag",
        "applicable": x or y,
        "side": side,
        "solver_constraint": False,
    }


def pair_records() -> tuple[dict[str, Any], ...]:
    return tuple(
        {
            "pair_id": f"nh_{nh_label}__interaction_{interaction_label}",
            "nonhit_constructor": nh_label,
            "interaction_constructor": interaction_label,
            "nonhit_source_fields": list(nh_fields),
            "interaction_source_fields": list(interaction_fields),
        }
        for nh_label, nh_fields in NONHIT_ARMS
        for interaction_label, interaction_fields in INTERACTION_ARMS
    )


def build_schema(
    *,
    fixed_arm: tuple[int, int, int, int] | None = None,
    overfull_row: int | None = None,
    force_present: tuple[int, str] | None = None,
) -> tuple[Solver, dict[str, Any]]:
    """Build retained deletion facts only; common omission is never asserted."""
    solver = Solver()
    solver.set(timeout=10_000)
    rows = {
        row: {point: Bool(f"row{row}_{point}") for point in POINTS} for row in range(2)
    }
    slices = {
        row: {point: Bool(f"firstApexSlice{row}_{point}") for point in POINTS}
        for row in range(2)
    }
    radii = [Int("firstApexRadius0"), Int("firstApexRadius1")]
    source_survival = [Bool(f"sourceRowSurvival{row}") for row in range(2)]
    first_failure = [Bool(f"firstApexFailure{row}") for row in range(2)]
    core_nonempty = [Bool(f"minimalDeletionCoreNonempty{row}") for row in range(2)]
    choice = {
        row: {"x": Int(f"row{row}_xChoice"), "y": Int(f"row{row}_yChoice")}
        for row in range(2)
    }

    solver.add(radii[0] != radii[1])
    for row, owner in enumerate(("source0", "source1")):
        solver.add(slices[row][owner])
        for point in POINTS:
            if point != owner:
                solver.add(slices[row][point] == BoolVal(False))
        solver.add(bool_sum(slices[row].values()) == 1)

    for row in range(2):
        solver.add(rows[row]["source0"], rows[row]["source1"])
        solver.add(bool_sum(rows[row].values()) == 4)
        if overfull_row == row:
            solver.add(bool_sum(rows[row].values()) == 5)
        solver.add(choice[row]["x"] >= 0, choice[row]["x"] < 2)
        solver.add(choice[row]["y"] >= 0, choice[row]["y"] < 2)
        for endpoint_index, endpoint in enumerate(PAIR_X):
            solver.add(
                If(choice[row]["x"] == endpoint_index, If(rows[row][endpoint], 1, 0), 0)
                == 0
            )
        for endpoint_index, endpoint in enumerate(PAIR_Y):
            solver.add(
                If(choice[row]["y"] == endpoint_index, If(rows[row][endpoint], 1, 0), 0)
                == 0
            )
        for x_index, x in enumerate(PAIR_X):
            for y_index, y in enumerate(PAIR_Y):
                selected = (choice[row]["x"] == x_index) & (choice[row]["y"] == y_index)
                survivors = bool_sum(
                    rows[row][point] for point in POINTS if point not in (x, y)
                )
                solver.add(If(selected, survivors, 4) == 4)
        solver.add(source_survival[row], first_failure[row], core_nonempty[row])

    if fixed_arm is not None:
        x0, y0, x1, y1 = fixed_arm
        solver.add(choice[0]["x"] == x0, choice[0]["y"] == y0)
        solver.add(choice[1]["x"] == x1, choice[1]["y"] == y1)
    if force_present is not None:
        row, point = force_present
        solver.add(rows[row][point])
    return solver, {
        "rows": rows,
        "slices": slices,
        "radii": radii,
        "choice": choice,
        "source_survival": source_survival,
        "first_failure": first_failure,
        "core_nonempty": core_nonempty,
    }


def model_bool(model: Any, expression: Any) -> bool:
    return bool(model.eval(expression, model_completion=True))


def validate_model(
    model: Any, ctx: dict[str, Any], fixed_arm: tuple[int, int, int, int]
) -> dict[str, Any]:
    rows = ctx["rows"]
    slices = ctx["slices"]
    choice = ctx["choice"]
    radii = ctx["radii"]
    if (
        model.eval(radii[0], model_completion=True).as_long()
        == model.eval(radii[1], model_completion=True).as_long()
    ):
        raise RuntimeError("readback: radii are not distinct")
    row_points: list[list[str]] = []
    for row, owner in enumerate(("source0", "source1")):
        points = [point for point in POINTS if model_bool(model, rows[row][point])]
        if len(points) != 4 or owner not in points:
            raise RuntimeError(f"readback: row {row} support={points}")
        slice_points = [
            point for point in POINTS if model_bool(model, slices[row][point])
        ]
        if slice_points != [owner]:
            raise RuntimeError(f"readback: row {row} slice={slice_points}")
        row_points.append(points)
    values = tuple(
        model.eval(choice[row][axis], model_completion=True).as_long()
        for row, axis in ((0, "x"), (0, "y"), (1, "x"), (1, "y"))
    )
    if values != fixed_arm:
        raise RuntimeError(f"readback: choice={values}, expected={fixed_arm}")
    for row, (x_index, y_index) in enumerate(
        ((fixed_arm[0], fixed_arm[1]), (fixed_arm[2], fixed_arm[3]))
    ):
        deleted = (PAIR_X[x_index], PAIR_Y[y_index])
        if any(point in row_points[row] for point in deleted):
            raise RuntimeError(f"readback: selected deletion survives in row {row}")
        if (
            len(
                [
                    point
                    for point in POINTS
                    if point not in deleted and point in row_points[row]
                ]
            )
            != 4
        ):
            raise RuntimeError(f"readback: exact-four survival failed in row {row}")
    return {"row_supports": row_points, "choices": list(values)}


def emit_smt(solver: Solver, path: Path) -> str:
    text = "(set-logic QF_LIA)\n" + solver.sexpr() + "\n(check-sat)\n"
    if text.count("(check-sat)") != 1:
        raise RuntimeError(f"artifact does not contain exactly one check-sat: {path}")
    path.write_text(text, encoding="utf-8")
    return text


def run_cvc5(path: Path, label: str) -> str:
    try:
        process = subprocess.run(
            ["cvc5", "--lang", "smt2", "--tlimit=10000", str(path)],
            capture_output=True,
            text=True,
            timeout=20,
            check=False,
        )
    except (FileNotFoundError, subprocess.TimeoutExpired) as exc:
        raise RuntimeError(f"fail-closed: cvc5 {label} unavailable/timeout") from exc
    tokens = [line.strip() for line in process.stdout.splitlines() if line.strip()]
    statuses = [token for token in tokens if token in {"sat", "unsat", "unknown"}]
    if len(statuses) != 1 or statuses[0] == "unknown":
        raise RuntimeError(
            f"fail-closed: cvc5 {label} malformed/unknown: {process.stdout[:160]!r}"
        )
    return statuses[0]


def check_case(
    label: str,
    solver: Solver,
    ctx: dict[str, Any],
    path: Path,
    expected: str,
    fixed_arm: tuple[int, int, int, int],
) -> dict[str, Any]:
    emit_smt(solver, path)
    result = solver.check()
    if result == unknown:
        raise RuntimeError(
            f"fail-closed: z3 {label}=unknown ({solver.reason_unknown()})"
        )
    z3_status = "sat" if result == sat else "unsat"
    if z3_status != expected:
        raise RuntimeError(f"{label}: expected z3 {expected}, got {z3_status}")
    readback = (
        validate_model(solver.model(), ctx, fixed_arm) if expected == "sat" else None
    )
    cvc5_status = run_cvc5(path, label)
    if cvc5_status != expected:
        raise RuntimeError(f"{label}: expected cvc5 {expected}, got {cvc5_status}")
    return {
        "label": label,
        "expected": expected,
        "z3": z3_status,
        "cvc5": cvc5_status,
        "readback": readback,
    }


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1 << 16), b""):
            digest.update(chunk)
    return digest.hexdigest()


def source_hashes() -> dict[str, str]:
    if not all(path.is_file() for path in SOURCE_FILES.values()):
        missing = [str(path) for path in SOURCE_FILES.values() if not path.is_file()]
        raise RuntimeError(f"missing source files: {missing}")
    return {
        str(path.relative_to(REPO_ROOT)): sha256_file(path)
        for path in SOURCE_FILES.values()
    }


def object_tables() -> tuple[list[dict[str, Any]], list[dict[str, Any]]]:
    objects = [
        {
            "object": "two_source_rows",
            "origin": "RetainedProducer:FreshThirdAlignedRetainedConsumerPacket",
            "representation": "two Boolean supports with exact cardinality four and both source labels",
            "guard": "exact-four row support",
        },
        {
            "object": "first_apex_slices",
            "origin": "RetainedProducer:FreshThirdAlignedRetainedConsumerPacket",
            "representation": "one-hot Boolean singleton slices",
            "guard": "singleton owner is source row",
        },
        {
            "object": "deletion_choices",
            "origin": "RetainedProducer:FreshThirdAlignedSourceDeletionCorePacket",
            "representation": "two bounded integer endpoint indices per row",
            "guard": "selected endpoints absent and exact-four survival",
        },
        {
            "object": "constructor_pair",
            "origin": "Fiber:FreshThirdCapSourceNonHit/Interaction",
            "representation": "metadata labels and source-field names",
            "guard": "not a solver cut; no universal extraction claim",
        },
        {
            "object": "common_endpoint_omission",
            "origin": "retained endpoint tuple projection",
            "representation": "derived x/y/x+y/none tag",
            "guard": "conditional report only; never asserted",
        },
    ]
    cuts = [
        {
            "cut_id": "C01",
            "cut": "exact_four_support",
            "admission": "admitted",
            "basis": "retained deletion packet",
            "guard": "each source row",
        },
        {
            "cut_id": "C02",
            "cut": "both_source_labels_in_row",
            "admission": "admitted",
            "basis": "retained source row",
            "guard": "each source row",
        },
        {
            "cut_id": "C03",
            "cut": "singleton_first_apex_slice",
            "admission": "admitted",
            "basis": "retained consumer packet",
            "guard": "one owner per row",
        },
        {
            "cut_id": "C04",
            "cut": "unequal_first_apex_radii",
            "admission": "admitted",
            "basis": "retained consumer packet",
            "guard": "two radii",
        },
        {
            "cut_id": "C05",
            "cut": "endpoint_omission_and_exact_four_survival",
            "admission": "admitted",
            "basis": "fixed deletion core packet",
            "guard": "selected pair per row",
        },
        {
            "cut_id": "C06",
            "cut": "common_endpoint_omission",
            "admission": "derived_conditional_tag",
            "basis": "tuple projection",
            "guard": "not a universal ingress constraint",
        },
        {
            "cut_id": "C07",
            "cut": "Euclidean_metric_realizability",
            "admission": "rejected",
            "basis": "out of scope",
            "guard": "no NRA/metric variables",
        },
        {
            "cut_id": "C08",
            "cut": "universal_extraction_lift",
            "admission": "rejected",
            "basis": "not encoded",
            "guard": "diagnostic only",
        },
        {
            "cut_id": "C09",
            "cut": "Lean_consumer_closure",
            "admission": "rejected",
            "basis": "no named query licensed",
            "guard": "no proof claim",
        },
    ]
    return objects, cuts


def write_json(path: Path, value: Any) -> None:
    path.write_text(
        json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )


def write_sha256sums() -> None:
    transient_names = {"SHA256SUMS", "latest-run.stdout", "file-list.actual.txt"}
    transient_dirs = {".pytest_cache", ".ruff_cache", "__pycache__"}
    entries = []
    for path in sorted(ROOT.rglob("*")):
        if (
            not path.is_file()
            or path.name in transient_names
            or transient_dirs.intersection(path.parts)
        ):
            continue
        entries.append(f"{sha256_file(path)}  {path.relative_to(ROOT)}")
    (ROOT / "SHA256SUMS").write_text("\n".join(entries) + "\n", encoding="utf-8")


def build_manifest(
    mode: str, records: list[dict[str, Any]], smoke: list[dict[str, Any]]
) -> dict[str, Any]:
    objects, cuts = object_tables()
    return {
        "schema_version": "freshthird_first_nonhit_retained_core_128.v1",
        "campaign": "freshthird_first_nonhit_retained_core_128",
        "wave_mode": mode,
        "claim_scope": "bounded QF_LIA structural diagnostic only; no metric, geometry, universal lift, Lean closure, or CE claim",
        "logic": "QF_LIA",
        "constructor_product": {
            "nonhit": 2,
            "interaction": 4,
            "retained_endpoint_choices_per_pair": 16,
            "raw_slices": 128,
        },
        "common_endpoint_omission": {
            "raw_per_pair": 16,
            "derived_tagged_per_pair": 12,
            "universal_ingress": False,
        },
        "case_count": len(records),
        "smoke_count": len(smoke),
        "source_hashes": source_hashes(),
        "object_origin_representation_guard": objects,
        "cut_admission_records": cuts,
        "named_consumer_queries": [],
        "consumer_query_license": "none; this finite wave does not license a named Lean consumer query",
        "solver_policy": {
            "dual": "Z3 and cvc5 required",
            "unknown": "fail-closed",
            "timeout_ms": 10000,
            "serial": True,
        },
        "records": records,
        "smoke_controls": smoke,
    }


def run(mode: str) -> int:
    (ROOT / "artifacts" / "smoke").mkdir(parents=True, exist_ok=True)
    smoke: list[dict[str, Any]] = []
    try:
        positive_solver, positive_ctx = build_schema(fixed_arm=(0, 0, 1, 0))
        smoke.append(
            check_case(
                "smoke_known_sat",
                positive_solver,
                positive_ctx,
                ROOT / "artifacts/smoke/known_sat.smt2",
                "sat",
                (0, 0, 1, 0),
            )
        )
        overfull_solver, overfull_ctx = build_schema(
            fixed_arm=(0, 0, 1, 0), overfull_row=0
        )
        smoke.append(
            check_case(
                "smoke_malformed_overfull",
                overfull_solver,
                overfull_ctx,
                ROOT / "artifacts/smoke/malformed_overfull.smt2",
                "unsat",
                (0, 0, 1, 0),
            )
        )
        conflict_solver, conflict_ctx = build_schema(
            fixed_arm=(0, 0, 1, 0), force_present=(0, "x0")
        )
        smoke.append(
            check_case(
                "smoke_malformed_endpoint_present",
                conflict_solver,
                conflict_ctx,
                ROOT / "artifacts/smoke/malformed_endpoint_present.smt2",
                "unsat",
                (0, 0, 1, 0),
            )
        )
        records: list[dict[str, Any]] = []
        if mode == "full":
            for pair in pair_records():
                pair_dir = ROOT / "artifacts" / pair["pair_id"]
                pair_dir.mkdir(parents=True, exist_ok=True)
                for index, arm in enumerate(endpoint_arms()):
                    label = f"{pair['pair_id']}_arm{index:02d}_{arm_name(arm)}"
                    solver, ctx = build_schema(fixed_arm=arm)
                    result = check_case(
                        label,
                        solver,
                        ctx,
                        pair_dir / f"arm{index:02d}_{arm_name(arm)}.smt2",
                        "sat",
                        arm,
                    )
                    result.update(
                        {
                            "pair_id": pair["pair_id"],
                            "arm_index": index,
                            "arm": list(arm),
                            "common_endpoint_omission": common_tag(arm),
                        }
                    )
                    records.append(result)
        manifest = build_manifest(mode, records, smoke)
        write_json(ROOT / "manifest.json", manifest)
        result_payload = {
            "status": "PASS",
            "campaign": manifest["campaign"],
            "wave_mode": mode,
            "smoke_count": len(smoke),
            "case_count": len(records),
            "raw_case_count": len(records),
            "z3_statuses": {
                "sat": sum(r["z3"] == "sat" for r in records),
                "unsat": sum(r["z3"] == "unsat" for r in records),
            },
            "cvc5_statuses": {
                "sat": sum(r["cvc5"] == "sat" for r in records),
                "unsat": sum(r["cvc5"] == "unsat" for r in records),
            },
            "records": records,
            "smoke": smoke,
        }
        write_json(ROOT / "results.partial.json", result_payload)
        write_json(ROOT / "results.json", result_payload)
        write_sha256sums()
        print(f"status=PASS mode={mode} smoke={len(smoke)} raw_slices={len(records)}")
        print(f"output={ROOT}")
        return 0
    except Exception as exc:  # noqa: BLE001 - serialize every failure fail-closed
        failure = {"status": "FAIL", "error": str(exc), "smoke": smoke}
        write_json(ROOT / "results.partial.json", failure)
        print(f"status=FAIL error={exc}")
        print(f"output={ROOT}")
        return 1


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--smoke-only", action="store_true")
    args = parser.parse_args()
    return run("smoke-only" if args.smoke_only else "full")


if __name__ == "__main__":
    raise SystemExit(main())
