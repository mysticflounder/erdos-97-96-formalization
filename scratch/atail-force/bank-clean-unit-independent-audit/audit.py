#!/usr/bin/env python3
"""Independent exact-algebra audit of the corrected bank-clean shadow.

This script deliberately does not import the CEGAR/MARCO implementation or any
other metric-oracle helper.  It decodes the terminal checkpoint, reconstructs
the squared-distance equations directly, gauge-fixes O=(0,0), A=(1,0), and
asks Singular over QQ plus msolve in two variable orders whether the resulting
ideal is the unit ideal.
"""

from __future__ import annotations

import hashlib
import json
import subprocess
import time
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
from typing import Any, Iterable

import sympy as sp


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[2]
CHECKPOINT = (
    REPO
    / "scratch/atail-force/robust-all-center-marco/bank_cegar_checkpoint.json"
)

EXPECTED_STATUS = "SAT_PRODUCER_BANK_CLEAN_CORRECTED_SHADOW"
EXPECTED_ROW_HASH = "f4c8e9e69d7ca3bec381d27178710fc7aa4ab7f4308e70973b675a38b8eacc66"
EXPECTED_BLOCKER_HASH = (
    "726f7c38f5c125a17442ad4780ad30ce879d056fe8ae7d99ae225514ca2ff602"
)
ROLES = ("A", "C", "D", "E", "F", "G", "I", "J", "K", "O", "X", "Y", "Z", "t1")
AMBIENT_O_SUPPORT = ("A", "C", "D", "E", "J")

# Hard-coded transcription of the terminal witness.  Comparing this table with
# the JSON before constructing equations makes role or row drift fail closed.
EXPECTED_ROWS = {
    "A": ("C", "G", "K", "O"),
    "C": ("G", "I", "X", "t1"),
    "D": ("A", "E", "F", "I"),
    "E": ("J", "K", "Y", "t1"),
    "F": ("A", "I", "K", "Z"),
    "G": ("E", "F", "K", "X"),
    "I": ("C", "F", "Y", "t1"),
    "J": ("F", "O", "Z", "t1"),
    "K": ("G", "I", "O", "Y"),
    "O": ("A", "C", "D", "E"),
    "X": ("F", "G", "J", "Z"),
    "Y": ("E", "O", "X", "Z"),
    "Z": ("A", "D", "G", "Y"),
    "t1": ("D", "X", "Y", "Z"),
}


def compact_hash(value: Any) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(payload.encode()).hexdigest()


def run(
    argv: list[str], *, timeout: float, input_text: str | None = None
) -> dict[str, Any]:
    started = time.monotonic()
    try:
        proc = subprocess.run(
            argv,
            input=input_text,
            capture_output=True,
            text=True,
            timeout=timeout,
            check=False,
        )
    except subprocess.TimeoutExpired as exc:
        return {
            "status": "TIMEOUT",
            "seconds": time.monotonic() - started,
            "stdout": exc.stdout or "",
            "stderr": exc.stderr or "",
        }
    return {
        "status": "EXITED",
        "exit_code": proc.returncode,
        "seconds": time.monotonic() - started,
        "stdout": proc.stdout,
        "stderr": proc.stderr,
    }


def singular_verdict(stdout: str) -> str:
    markers = [line.strip() for line in stdout.splitlines() if line.strip()]
    if "STATUS_UNIT" in markers:
        return "UNIT"
    if "STATUS_NONUNIT" in markers:
        return "NONUNIT"
    return "UNKNOWN"


def msolve_verdict(text: str) -> str:
    stripped = text.strip()
    if stripped.startswith("[-1]"):
        return "UNIT"
    if stripped:
        return "NONUNIT"
    return "UNKNOWN"


def singular_script(
    variables: Iterable[sp.Symbol], polynomials: Iterable[sp.Expr]
) -> str:
    names = ",".join(str(v) for v in variables)
    polys = ",\n  ".join(sp.sstr(sp.expand(p)).replace("**", "^") for p in polynomials)
    return "\n".join(
        [
            f"ring R=0,({names}),dp;",
            f"ideal I = {polys};",
            "ideal G = std(I);",
            'if (size(G)==1 and G[1]==1) { print(\"STATUS_UNIT\"); }',
            'else { print(\"STATUS_NONUNIT\"); print(\"DIM=\"+string(dim(G))); }',
            "quit;",
            "",
        ]
    )


def msolve_input(
    variables: Iterable[sp.Symbol], polynomials: Iterable[sp.Expr]
) -> str:
    names = ",".join(str(v) for v in variables)
    rows = [sp.sstr(sp.expand(p)).replace("**", "^") for p in polynomials]
    # msolve 0.10.x must receive expanded, parenthesis-free input.
    if any("(" in p or ")" in p for p in rows):
        raise AssertionError("unexpanded parenthesis in msolve input")
    return names + "\n0\n" + ",\n".join(rows) + "\n"


def solver_smokes() -> dict[str, Any]:
    x, y = sp.symbols("x y")
    cases = {
        "hand_known_sat": ([x, y], [x - 1, y - 2], "NONUNIT"),
        "hand_known_unit": ([x], [x, x - 1], "UNIT"),
    }
    answer: dict[str, Any] = {}
    for name, (variables, polynomials, expected) in cases.items():
        sing_path = HERE / f"smoke_{name}.sing"
        sing_path.write_text(singular_script(variables, polynomials))
        singular = run(["Singular", "-q", str(sing_path)], timeout=30)
        singular["verdict"] = singular_verdict(str(singular.get("stdout", "")))

        ms_path = HERE / f"smoke_{name}.ms"
        ms_out = HERE / f"smoke_{name}.ms.out"
        ms_path.write_text(msolve_input(variables, polynomials))
        msolve = run(
            ["msolve", "-f", str(ms_path), "-o", str(ms_out), "-t", "2"],
            timeout=30,
        )
        output = ms_out.read_text() if ms_out.exists() else ""
        msolve["verdict"] = msolve_verdict(output)
        msolve["output"] = output

        if singular["verdict"] != expected or msolve["verdict"] != expected:
            raise AssertionError(f"{name} smoke failed: {singular}, {msolve}")
        answer[name] = {
            "expected": expected,
            "singular": singular,
            "msolve": msolve,
        }
    return answer


def main() -> None:
    payload = json.loads(CHECKPOINT.read_text())
    if payload.get("status") != EXPECTED_STATUS:
        raise AssertionError(f"checkpoint status drift: {payload.get('status')}")
    witness = payload["witness"]
    if witness.get("row_assignment_sha256") != EXPECTED_ROW_HASH:
        raise AssertionError("reported row hash drift")
    if compact_hash(witness["rows"]) != EXPECTED_ROW_HASH:
        raise AssertionError("canonical checkpoint row hash does not replay")
    if witness.get("blocker_assignment_sha256") != EXPECTED_BLOCKER_HASH:
        raise AssertionError("reported blocker hash drift")
    if compact_hash(witness["blockers"]) != EXPECTED_BLOCKER_HASH:
        raise AssertionError("canonical checkpoint blocker hash does not replay")

    rows = witness["rows"]
    if len(rows) != 14:
        raise AssertionError(f"expected 14 rows, got {len(rows)}")
    row_map = {str(row["center"]): tuple(row["support"]) for row in rows}
    if tuple(row_map) != ROLES:
        raise AssertionError(f"row center order/roles drift: {tuple(row_map)}")
    if row_map != EXPECTED_ROWS:
        raise AssertionError("checkpoint row decoding differs from hard-coded audit table")
    if set(witness["blockers"]) != set(ROLES):
        raise AssertionError("blocker-domain roles drift")
    if not set(witness["blockers"].values()) <= set(ROLES):
        raise AssertionError("blocker codomain contains an unknown role")
    for center, support in row_map.items():
        if len(support) != 4 or len(set(support)) != 4:
            raise AssertionError(f"row {center} is not a four-element support")
        if center in support:
            raise AssertionError(f"row {center} contains its own center")
        if not set(support) <= set(ROLES):
            raise AssertionError(f"row {center} contains an unknown role")
    if row_map["O"] != AMBIENT_O_SUPPORT[:4]:
        raise AssertionError("selected O row is not the first four ambient points")

    coords = {
        role: (sp.Symbol(f"{role}x"), sp.Symbol(f"{role}y")) for role in ROLES
    }
    gauge = {
        coords["O"][0]: sp.Integer(0),
        coords["O"][1]: sp.Integer(0),
        coords["A"][0]: sp.Integer(1),
        coords["A"][1]: sp.Integer(0),
    }
    variables = [
        coordinate
        for role in ROLES
        for coordinate in coords[role]
        if coordinate not in gauge
    ]

    def d2(center: str, point: str) -> sp.Expr:
        cx, cy = coords[center]
        px, py = coords[point]
        return (px - cx) ** 2 + (py - cy) ** 2

    generators: list[dict[str, Any]] = []

    def add_radius_class(kind: str, center: str, support: tuple[str, ...]) -> None:
        base = support[0]
        for point in support[1:]:
            expression = sp.expand((d2(center, point) - d2(center, base)).subs(gauge))
            generators.append(
                {
                    "id": f"{kind}:{center}:{point}={base}",
                    "kind": kind,
                    "center": center,
                    "left": point,
                    "right": base,
                    "expression": expression,
                }
            )

    add_radius_class("ambient_O_five", "O", AMBIENT_O_SUPPORT)
    for center in ROLES:
        add_radius_class("selected_row", center, row_map[center])

    unique: list[dict[str, Any]] = []
    seen: dict[str, str] = {}
    duplicates: list[dict[str, str]] = []
    for generator in generators:
        canonical = sp.srepr(sp.Poly(generator["expression"], *variables, domain=sp.QQ).as_expr())
        if canonical in seen:
            duplicates.append(
                {"duplicate": str(generator["id"]), "first": seen[canonical]}
            )
        else:
            seen[canonical] = str(generator["id"])
            unique.append(generator)

    if len(generators) != 46 or len(unique) != 43 or len(duplicates) != 3:
        raise AssertionError(
            f"unexpected equality counts raw={len(generators)} "
            f"unique={len(unique)} duplicates={len(duplicates)}"
        )
    polynomials = [sp.Poly(g["expression"], *variables, domain=sp.QQ).as_expr() for g in unique]
    if any(p == 0 for p in polynomials):
        raise AssertionError("zero polynomial survived deduplication")

    smokes = solver_smokes()

    singular_path = HERE / "target.sing"
    singular_path.write_text(singular_script(variables, polynomials))

    msolve_jobs: dict[str, tuple[Path, Path]] = {}
    for order_name, order in (
        ("forward", variables),
        ("reverse", list(reversed(variables))),
    ):
        input_path = HERE / f"target_{order_name}.ms"
        output_path = HERE / f"target_{order_name}.ms.out"
        input_path.write_text(msolve_input(order, polynomials))
        if output_path.exists():
            output_path.unlink()
        msolve_jobs[order_name] = (input_path, output_path)

    def run_singular_target() -> dict[str, Any]:
        result = run(["Singular", "-q", str(singular_path)], timeout=600)
        result["verdict"] = singular_verdict(str(result.get("stdout", "")))
        return result

    def run_msolve_target(order_name: str) -> dict[str, Any]:
        input_path, output_path = msolve_jobs[order_name]
        result = run(
            ["msolve", "-f", str(input_path), "-o", str(output_path), "-t", "4"],
            timeout=600,
        )
        output = output_path.read_text() if output_path.exists() else ""
        result["verdict"] = msolve_verdict(output)
        result["output"] = output
        return result

    with ThreadPoolExecutor(max_workers=3) as pool:
        futures = {
            "singular": pool.submit(run_singular_target),
            "forward": pool.submit(run_msolve_target, "forward"),
            "reverse": pool.submit(run_msolve_target, "reverse"),
        }
        singular = futures["singular"].result()
        msolve_results = {
            "forward": futures["forward"].result(),
            "reverse": futures["reverse"].result(),
        }

    exact_flags = {
        str(row["center"]): bool(row["exact_from_blocker_image"]) for row in rows
    }
    report = {
        "schema": "p97-bank-clean-unit-independent-audit-v1",
        "checkpoint": str(CHECKPOINT.relative_to(REPO)),
        "checkpoint_status": payload["status"],
        "checkpoint_source_sha256": hashlib.sha256(CHECKPOINT.read_bytes()).hexdigest(),
        "row_assignment_sha256": EXPECTED_ROW_HASH,
        "blocker_assignment_sha256": EXPECTED_BLOCKER_HASH,
        "role_count": len(ROLES),
        "roles": list(ROLES),
        "decoded_rows": [
            {
                "center": center,
                "support": list(row_map[center]),
                "exact_from_blocker_image": exact_flags[center],
            }
            for center in ROLES
        ],
        "ambient_O_support": list(AMBIENT_O_SUPPORT),
        "gauge": {"O": [0, 0], "A": [1, 0]},
        "gauge_precondition": "O != A; guaranteed by distinct point roles in any intended real configuration",
        "free_coordinate_variables": [str(v) for v in variables],
        "free_coordinate_count": len(variables),
        "equality_counts": {
            "ambient_raw": 4,
            "selected_rows_raw": 42,
            "combined_raw": len(generators),
            "duplicate_O_equalities": len(duplicates),
            "combined_unique": len(unique),
        },
        "duplicate_equalities": duplicates,
        "unique_generators": [
            {
                "index": index,
                "id": str(generator["id"]),
                "center": str(generator["center"]),
                "left": str(generator["left"]),
                "right": str(generator["right"]),
                "polynomial": sp.sstr(polynomials[index]),
            }
            for index, generator in enumerate(unique)
        ],
        "unique_generator_sha256": compact_hash(
            [sp.sstr(polynomial) for polynomial in polynomials]
        ),
        "degree_histogram": {
            str(degree): sum(sp.Poly(p, *variables).total_degree() == degree for p in polynomials)
            for degree in sorted({sp.Poly(p, *variables).total_degree() for p in polynomials})
        },
        "smoke_gates": smokes,
        "target_oracles": {
            "singular_QQ_char0_dp": singular,
            "msolve_QQ_forward_expanded": msolve_results["forward"],
            "msolve_QQ_reverse_expanded": msolve_results["reverse"],
        },
        "encoded": [
            "O is equidistant from A,C,D,E,J",
            "for each of the 14 decoded centers, its four selected support points are equidistant",
            "Euclidean squared-distance polynomial equations over QQ",
            "real-similarity gauge O=(0,0), A=(1,0)",
        ],
        "omitted": [
            "all point-pair distinctness except the gauge pair O,A",
            "strict convexity and all orientation/cyclic-order inequalities",
            "MEC, cap, surplus, marginal, and interior inequalities/memberships",
            "critical-map/blocker semantics beyond the decoded row supports",
            "exact-radius-class off-circle disequalities for nonmembers",
            "global distance-color cardinality and rows outside these 14 selected classes",
            "ambient points outside the fixed 14-role shadow",
            "real feasibility or positivity certificates",
        ],
    }
    verdicts = {
        singular["verdict"],
        msolve_results["forward"]["verdict"],
        msolve_results["reverse"]["verdict"],
    }
    report["crosscheck"] = {
        "verdicts": sorted(verdicts),
        "status": (
            f"CROSSCHECKED_{singular['verdict']}"
            if len(verdicts) == 1 and singular["verdict"] in {"UNIT", "NONUNIT"}
            else "DISAGREEMENT_OR_UNKNOWN"
        ),
    }
    (HERE / "audit.json").write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "row_hash": EXPECTED_ROW_HASH,
                "raw_equalities": len(generators),
                "unique_equalities": len(unique),
                "singular": singular["verdict"],
                "msolve_forward": msolve_results["forward"]["verdict"],
                "msolve_reverse": msolve_results["reverse"]["verdict"],
                "crosscheck": report["crosscheck"]["status"],
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
