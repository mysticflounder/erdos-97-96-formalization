#!/usr/bin/env python3
"""Independent reconstruction and exact-CAS audit of the 17-equality core.

The generator pairs are checked against the terminal witness rows.  Solver
input is rebuilt here from squared distances; no producer or certificate
script is imported.
"""

from __future__ import annotations

import hashlib
import json
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
from typing import Any

import sympy as sp

import audit
import minimize_core as core


HERE = Path(__file__).resolve().parent
COMPARISON = (
    audit.REPO
    / "scratch/atail-force/bank-clean-lean-certificate/checkpoint.json"
)
EXPECTED_COMPARISON_HASH = (
    "501e72748dc8938b808c2f22789dc57601e4d6cdeb717a3746f33a4d4db30777"
)

# name, center, left, right.  Each equation is d(center,left)^2 -
# d(center,right)^2 = 0.  The pairs are deliberately reconstructed from the
# row supports, not copied as polynomials.
SPECS = (
    ("ROW_A_O_G", "A", "O", "G"),
    ("ROW_A_O_K", "A", "O", "K"),
    ("ROW_F_A_Z", "F", "A", "Z"),
    ("ROW_F_A_K", "F", "A", "K"),
    ("ROW_G_X_E", "G", "X", "E"),
    ("ROW_G_X_K", "G", "X", "K"),
    ("ROW_K_O_Y", "K", "O", "Y"),
    ("ROW_K_O_G", "K", "O", "G"),
    ("ROW_K_O_I", "K", "O", "I"),
    ("ROW_O_A_E", "O", "A", "E"),
    ("ROW_X_Z_G", "X", "Z", "G"),
    ("ROW_X_Z_F", "X", "Z", "F"),
    ("ROW_Y_O_X", "Y", "O", "X"),
    ("ROW_Y_O_Z", "Y", "O", "Z"),
    ("ROW_Y_O_E", "Y", "O", "E"),
    ("ROW_Z_A_Y", "Z", "A", "Y"),
    ("ROW_Z_A_G", "Z", "A", "G"),
)

NUMERIC_ROLE_MAP = {
    "O": 0,
    "A": 1,
    "C": 2,
    "X": 3,
    "Y": 4,
    "Z": 5,
    "D": 6,
    "J": 7,
    "E": 8,
    "G": 9,
    "K": 10,
    "t1": 11,
    "I": 12,
    "F": 13,
}


def main() -> None:
    terminal = json.loads(audit.CHECKPOINT.read_text())
    assert terminal["status"] == audit.EXPECTED_STATUS
    witness = terminal["witness"]
    assert audit.compact_hash(witness["rows"]) == audit.EXPECTED_ROW_HASH
    rows = {str(row["center"]): set(row["support"]) for row in witness["rows"]}
    assert set(rows) == set(audit.ROLES)
    for name, center, left, right in SPECS:
        if left not in rows[center] or right not in rows[center]:
            raise AssertionError(f"{name} is not implied by decoded row {center}")

    coords = {
        role: (sp.Symbol(f"{role}x"), sp.Symbol(f"{role}y"))
        for role in audit.ROLES
    }
    gauge = {
        coords["O"][0]: sp.Integer(0),
        coords["O"][1]: sp.Integer(0),
        coords["A"][0]: sp.Integer(1),
        coords["A"][1]: sp.Integer(0),
    }

    def d2(center: str, point: str) -> sp.Expr:
        cx, cy = coords[center]
        px, py = coords[point]
        return (px - cx) ** 2 + (py - cy) ** 2

    generators: list[dict[str, Any]] = []
    for name, center, left, right in SPECS:
        polynomial = sp.expand((d2(center, left) - d2(center, right)).subs(gauge))
        generators.append(
            {
                "name": name,
                "center": center,
                "left": left,
                "right": right,
                "polynomial": polynomial,
            }
        )
    used = set().union(*(g["polynomial"].free_symbols for g in generators))
    # Match the independent certificate lane's sparse numeric role order; this
    # is only a variable permutation, and is separately reversed for msolve.
    variable_roles = [
        role
        for role, _index in sorted(NUMERIC_ROLE_MAP.items(), key=lambda item: item[1])
        if role not in {"O", "A"}
    ]
    active_roles = [
        role
        for role in variable_roles
        if coords[role][0] in used or coords[role][1] in used
    ]
    variables = [coordinate for role in variable_roles for coordinate in coords[role]]
    polynomials = [g["polynomial"] for g in generators]

    # Adversarially compare the independently reconstructed polynomials to the
    # separately generated kernel-lane checkpoint after applying its arbitrary
    # x0..x13 naming map.  Equality is semantic, not string-based.
    comparison = json.loads(COMPARISON.read_text())
    stored = comparison["equality_core"]
    assert stored["polynomial_sha256"] == EXPECTED_COMPARISON_HASH
    stored_polynomials = [str(item["polynomial"]) for item in stored["generators"]]
    assert hashlib.sha256(
        json.dumps(stored_polynomials, separators=(",", ":")).encode()
    ).hexdigest() == EXPECTED_COMPARISON_HASH
    assert [item["name"] for item in stored["generators"]] == [
        item["name"] for item in generators
    ]
    numeric_symbols = {
        sp.Symbol(f"x{index}{axis}"): coords[role][0 if axis == "x" else 1]
        for role, index in NUMERIC_ROLE_MAP.items()
        for axis in ("x", "y")
    }
    for reconstructed, stored_text in zip(polynomials, stored_polynomials, strict=True):
        parsed = sp.sympify(stored_text.replace("^", "**"), locals={str(k): k for k in numeric_symbols})
        role_expression = sp.expand(parsed.xreplace(numeric_symbols))
        if sp.expand(reconstructed - role_expression) != 0:
            raise AssertionError(
                f"stored polynomial drift for {reconstructed}: {stored_text}"
            )

    audit.solver_smokes()
    singular_source = HERE / "target_17.sing"
    singular_names = ",".join(str(variable) for variable in variables)
    singular_polynomials = ",\n  ".join(
        sp.sstr(sp.expand(polynomial)).replace("**", "^")
        for polynomial in polynomials
    )
    singular_source.write_text(
        "\n".join(
            [
                f"ring R=0,({singular_names}),dp;",
                f"ideal I={singular_polynomials};",
                "ideal G=slimgb(I);",
                "poly remainder=reduce(1,G);",
                'if (remainder==0) { print("STATUS_UNIT"); }',
                'else { print("STATUS_NONUNIT"); }',
                "quit;",
                "",
            ]
        )
    )
    forward_source = HERE / "target_17_forward.ms"
    reverse_source = HERE / "target_17_reverse.ms"
    forward_output = HERE / "target_17_forward.ms.out"
    reverse_output = HERE / "target_17_reverse.ms.out"
    forward_source.write_text(audit.msolve_input(variables, polynomials))
    reverse_source.write_text(audit.msolve_input(list(reversed(variables)), polynomials))
    for output in (forward_output, reverse_output):
        if output.exists():
            output.unlink()

    def run_singular() -> dict[str, Any]:
        result = audit.run(["Singular", "-q", str(singular_source)], timeout=120)
        result["verdict"] = audit.singular_verdict(str(result.get("stdout", "")))
        return result

    def run_msolve(source: Path, output: Path) -> dict[str, Any]:
        result = audit.run(
            ["msolve", "-f", str(source), "-o", str(output), "-t", "4"],
            timeout=600,
        )
        text = output.read_text() if output.exists() else ""
        result["verdict"] = audit.msolve_verdict(text)
        result["output"] = text
        return result

    with ThreadPoolExecutor(max_workers=3) as pool:
        futures = {
            "singular": pool.submit(run_singular),
            "forward": pool.submit(run_msolve, forward_source, forward_output),
            "reverse": pool.submit(run_msolve, reverse_source, reverse_output),
        }
        singular = futures["singular"].result()
        forward = futures["forward"].result()
        reverse = futures["reverse"].result()

    report = {
        "schema": "p97-bank-clean-17-equality-independent-audit-v1",
        "checkpoint_row_sha256": audit.EXPECTED_ROW_HASH,
        "comparison_checkpoint_sha256": hashlib.sha256(COMPARISON.read_bytes()).hexdigest(),
        "comparison_polynomial_sha256_replayed": EXPECTED_COMPARISON_HASH,
        "gauge": {"O": [0, 0], "A": [1, 0]},
        "gauge_precondition": "O != A in the intended distinct-point real configuration",
        "active_roles": active_roles,
        "variable_roles_including_inactive_padding": variable_roles,
        "active_variables": [str(variable) for variable in variables],
        "generators": [
            {
                "name": str(g["name"]),
                "center": str(g["center"]),
                "left": str(g["left"]),
                "right": str(g["right"]),
                "polynomial": str(g["polynomial"]),
            }
            for g in generators
        ],
        "oracles": {
            "singular_QQ_char0_std": singular,
            "msolve_QQ_forward_expanded": forward,
            "msolve_QQ_reverse_expanded": reverse,
        },
        "crosscheck": {
            "status": (
                "CROSSCHECKED_UNIT"
                if singular["verdict"] == forward["verdict"] == reverse["verdict"] == "UNIT"
                else "DISAGREEMENT_OR_UNKNOWN"
            ),
            "verdicts": [singular["verdict"], forward["verdict"], reverse["verdict"]],
        },
        "trust_boundary": [
            "direct squared-distance reconstruction from the terminal checkpoint rows",
            "Singular 4.4.1 characteristic-zero std as exact computation, not a kernel certificate",
            "msolve 0.10.1 expanded input in two variable orders as an independent crosscheck",
            "UNIT excludes normalized complex and hence intended real solutions of these equalities",
            "no structural coverage theorem or K-A closure follows from one excluded shadow",
        ],
    }
    (HERE / "confirm_17.json").write_text(
        json.dumps(report, indent=2, sort_keys=True) + "\n"
    )
    print(
        json.dumps(
            {
                "comparison_hash": EXPECTED_COMPARISON_HASH,
                "roles": active_roles,
                "verdicts": report["crosscheck"]["verdicts"],
                "status": report["crosscheck"]["status"],
            },
            sort_keys=True,
        ),
        flush=True,
    )


if __name__ == "__main__":
    main()
