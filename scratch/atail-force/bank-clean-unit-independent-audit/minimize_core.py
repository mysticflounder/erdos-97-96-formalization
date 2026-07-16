#!/usr/bin/env python3
"""Independent confirmation and minimization of a small UNIT row core."""

from __future__ import annotations

import hashlib
import json
import tempfile
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
from typing import Any, Iterable

import sympy as sp

import audit


HERE = Path(__file__).resolve().parent
CANDIDATE_ROWS = ("A", "F", "G", "K", "X", "Y", "Z")


def build(
    gauge_roles: tuple[str, str] = ("O", "A"),
) -> tuple[list[sp.Symbol], list[dict[str, Any]]]:
    payload = json.loads(audit.CHECKPOINT.read_text())
    witness = payload["witness"]
    assert payload["status"] == audit.EXPECTED_STATUS
    assert audit.compact_hash(witness["rows"]) == audit.EXPECTED_ROW_HASH
    decoded = {str(r["center"]): tuple(r["support"]) for r in witness["rows"]}
    assert decoded == audit.EXPECTED_ROWS

    coords = {
        role: (sp.Symbol(f"{role}x"), sp.Symbol(f"{role}y")) for role in audit.ROLES
    }
    origin, unit = gauge_roles
    gauge = {
        coords[origin][0]: sp.Integer(0),
        coords[origin][1]: sp.Integer(0),
        coords[unit][0]: sp.Integer(1),
        coords[unit][1]: sp.Integer(0),
    }
    variables = [
        coordinate
        for role in audit.ROLES
        for coordinate in coords[role]
        if coordinate not in gauge
    ]

    def d2(center: str, point: str) -> sp.Expr:
        cx, cy = coords[center]
        px, py = coords[point]
        return (px - cx) ** 2 + (py - cy) ** 2

    generators: list[dict[str, Any]] = []

    def add(atom: str, center: str, support: tuple[str, ...]) -> None:
        base = support[0]
        for point in support[1:]:
            polynomial = sp.Poly(
                sp.expand((d2(center, point) - d2(center, base)).subs(gauge)),
                *variables,
                domain=sp.QQ,
            ).as_expr()
            generators.append(
                {
                    "atom": atom,
                    "center": center,
                    "left": point,
                    "right": base,
                    "id": f"{atom}:{center}:{point}={base}",
                    "polynomial": polynomial,
                }
            )

    add("ambient_O", "O", audit.AMBIENT_O_SUPPORT)
    for center in audit.ROLES:
        if center != "O":
            add(f"row_{center}", center, decoded[center])
    assert len(generators) == 43
    return variables, generators


def msolve_one(
    variables: list[sp.Symbol], polynomials: list[sp.Expr], reverse: bool
) -> dict[str, Any]:
    order = list(reversed(variables)) if reverse else variables
    with tempfile.TemporaryDirectory(prefix="p97-independent-core-msolve-") as temp:
        root = Path(temp)
        source = root / "input.ms"
        output = root / "output.txt"
        source.write_text(audit.msolve_input(order, polynomials))
        result = audit.run(
            ["msolve", "-f", str(source), "-o", str(output), "-t", "4"],
            timeout=180,
        )
        text = output.read_text() if output.exists() else ""
        result["verdict"] = audit.msolve_verdict(text)
        return result


def msolve_pair(
    variables: list[sp.Symbol], generators: list[dict[str, Any]]
) -> dict[str, Any]:
    polynomials = [g["polynomial"] for g in generators]
    with ThreadPoolExecutor(max_workers=2) as pool:
        forward = pool.submit(msolve_one, variables, polynomials, False)
        reverse = pool.submit(msolve_one, variables, polynomials, True)
        return {"forward": forward.result(), "reverse": reverse.result()}


def singular_one(
    variables: list[sp.Symbol], generators: list[dict[str, Any]], timeout: float = 300
) -> dict[str, Any]:
    polynomials = [g["polynomial"] for g in generators]
    with tempfile.TemporaryDirectory(prefix="p97-independent-core-singular-") as temp:
        source = Path(temp) / "input.sing"
        source.write_text(audit.singular_script(variables, polynomials))
        result = audit.run(["Singular", "-q", str(source)], timeout=timeout)
    result["verdict"] = audit.singular_verdict(str(result.get("stdout", "")))
    return result


def polynomial_hash(generators: Iterable[dict[str, Any]]) -> str:
    rows = [sp.sstr(sp.expand(g["polynomial"])) for g in generators]
    return hashlib.sha256(
        json.dumps(rows, separators=(",", ":")).encode()
    ).hexdigest()


def generator_hash(generators: Iterable[dict[str, Any]]) -> str:
    rows = [str(g["id"]) for g in generators]
    return hashlib.sha256(
        json.dumps(rows, separators=(",", ":")).encode()
    ).hexdigest()


def verdict_pair(result: dict[str, Any]) -> tuple[str, str]:
    return result["forward"]["verdict"], result["reverse"]["verdict"]


def main() -> None:
    variables, full = build()
    candidate = [
        g
        for g in full
        if g["atom"] == "ambient_O" or g["center"] in CANDIDATE_ROWS
    ]
    assert len(candidate) == 25
    audit.solver_smokes()

    print("checking externally proposed 8-row/25-equation comparison core", flush=True)
    with ThreadPoolExecutor(max_workers=2) as pool:
        singular_future = pool.submit(singular_one, variables, candidate, 600)
        msolve_future = pool.submit(msolve_pair, variables, candidate)
        candidate_singular = singular_future.result()
        candidate_msolve = msolve_future.result()
    print(
        "candidate verdicts",
        candidate_singular["verdict"],
        *verdict_pair(candidate_msolve),
        flush=True,
    )
    if candidate_singular["verdict"] != "UNIT" or verdict_pair(candidate_msolve) != (
        "UNIT",
        "UNIT",
    ):
        raise RuntimeError("comparison core did not independently crosscheck UNIT")

    # msolve is only a proposal oracle.  Try row deletions first, demanding
    # agreement under both declared variable orders before accepting a proposal.
    proposed = list(candidate)
    row_proposals: list[dict[str, Any]] = []
    for center in CANDIDATE_ROWS:
        trial = [g for g in proposed if g["center"] != center]
        result = msolve_pair(variables, trial)
        remove = verdict_pair(result) == ("UNIT", "UNIT")
        row_proposals.append(
            {"center": center, "removed": remove, "msolve": result}
        )
        print("row proposal", center, verdict_pair(result), "remove" if remove else "keep", flush=True)
        if remove:
            proposed = trial

    # Then minimize individual equalities, again as an msolve-only proposal.
    equality_proposals: list[dict[str, Any]] = []
    for generator in list(proposed):
        trial = [g for g in proposed if g["id"] != generator["id"]]
        result = msolve_pair(variables, trial)
        remove = verdict_pair(result) == ("UNIT", "UNIT")
        equality_proposals.append(
            {"id": generator["id"], "removed": remove, "msolve": result}
        )
        print(
            "equation proposal",
            generator["id"],
            verdict_pair(result),
            "remove" if remove else "keep",
            flush=True,
        )
        if remove:
            proposed = trial

    print(f"checking proposed {len(proposed)}-equation core in Singular", flush=True)
    proposed_singular = singular_one(variables, proposed, 600)
    proposed_msolve = msolve_pair(variables, proposed)
    print(
        "proposed verdicts",
        proposed_singular["verdict"],
        *verdict_pair(proposed_msolve),
        flush=True,
    )

    # Singular is the arbiter.  Only if the msolve proposal is UNIT do we run a
    # final characteristic-zero deletion pass.  A timeout is retained, never
    # interpreted as evidence either way.
    exact = list(proposed if proposed_singular["verdict"] == "UNIT" else candidate)
    singular_deletions: list[dict[str, Any]] = []
    for generator in list(exact):
        trial = [g for g in exact if g["id"] != generator["id"]]
        result = singular_one(variables, trial, 180)
        remove = result["verdict"] == "UNIT"
        singular_deletions.append(
            {"id": generator["id"], "removed": remove, "singular": result}
        )
        print(
            "Singular deletion",
            generator["id"],
            result["verdict"],
            "remove" if remove else "keep",
            flush=True,
        )
        if remove:
            exact = trial

    final_singular = singular_one(variables, exact, 600)
    final_msolve = msolve_pair(variables, exact)
    retained_checks: list[dict[str, Any]] = []
    for generator in exact:
        trial = [g for g in exact if g["id"] != generator["id"]]
        singular = singular_one(variables, trial, 180)
        msolve = msolve_pair(variables, trial)
        retained_checks.append(
            {"id": generator["id"], "singular": singular, "msolve": msolve}
        )
        print(
            "retained deletion",
            generator["id"],
            singular["verdict"],
            verdict_pair(msolve),
            flush=True,
        )

    report = {
        "schema": "p97-bank-clean-unit-independent-minimization-v1",
        "checkpoint_row_sha256": audit.EXPECTED_ROW_HASH,
        "gauge": {"O": [0, 0], "A": [1, 0]},
        "free_variable_count": len(variables),
        "full_unique_equality_count": len(full),
        "full_polynomial_sha256": polynomial_hash(full),
        "candidate": {
            "row_atoms": ["ambient_O", *[f"row_{c}" for c in CANDIDATE_ROWS]],
            "equation_count": len(candidate),
            "generator_sha256": generator_hash(candidate),
            "polynomial_sha256": polynomial_hash(candidate),
            "generators": [str(g["id"]) for g in candidate],
            "singular": candidate_singular,
            "msolve": candidate_msolve,
        },
        "row_proposals": row_proposals,
        "equality_proposals": equality_proposals,
        "proposed": {
            "equation_count": len(proposed),
            "generator_sha256": generator_hash(proposed),
            "polynomial_sha256": polynomial_hash(proposed),
            "generators": [str(g["id"]) for g in proposed],
            "singular": proposed_singular,
            "msolve": proposed_msolve,
        },
        "singular_deletions": singular_deletions,
        "final": {
            "equation_count": len(exact),
            "row_atoms": sorted({str(g["atom"]) for g in exact}),
            "generator_sha256": generator_hash(exact),
            "polynomial_sha256": polynomial_hash(exact),
            "generators": [
                {
                    "id": str(g["id"]),
                    "center": str(g["center"]),
                    "left": str(g["left"]),
                    "right": str(g["right"]),
                    "polynomial": sp.sstr(g["polynomial"]),
                }
                for g in exact
            ],
            "singular": final_singular,
            "msolve": final_msolve,
            "retained_single_deletion_checks": retained_checks,
            "deletion_minimal_in_singular": all(
                check["singular"]["verdict"] == "NONUNIT"
                for check in retained_checks
            ),
        },
        "trust_boundary": [
            "Singular 4.4.1 characteristic-zero std is the UNIT arbiter",
            "msolve 0.10.1 is used in expanded syntax under forward and reverse variable order",
            "UNIT is for the O=(0,0), A=(1,0) equality ideal over QQ/its complex variety",
            "the gauge is sound for intended real configurations because O and A are distinct",
            "no inequality, exact-off-circle, or real-feasibility claim is certified here",
        ],
    }
    (HERE / "minimization.json").write_text(
        json.dumps(report, indent=2, sort_keys=True) + "\n"
    )
    print(
        json.dumps(
            {
                "candidate": [
                    candidate_singular["verdict"],
                    *verdict_pair(candidate_msolve),
                ],
                "final_equations": len(exact),
                "final_rows": report["final"]["row_atoms"],
                "final_crosscheck": [
                    final_singular["verdict"],
                    *verdict_pair(final_msolve),
                ],
                "deletion_minimal_in_singular": report["final"][
                    "deletion_minimal_in_singular"
                ],
            },
            sort_keys=True,
        ),
        flush=True,
    )


if __name__ == "__main__":
    main()
