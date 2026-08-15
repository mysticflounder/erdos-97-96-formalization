#!/usr/bin/env python3
"""Named-incidence canary for the FreshThird six-center provenance packet.

This deliberately encodes only source-clean finite consequences of
`SixSurvivorExactRowsSourceProvenanceBoundary`: six exact four-point rows,
common-deletion and own-center omission, the B0/B1 collision-row labels, and
the surviving source in B5.  It does not claim to encode the full geometric
carrier, global K4, cap order, or a universal-cardinality lift.

The query asks whether these named facts alone force an instance of the eight
incidences consumed by
`U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility`.
"""

from __future__ import annotations

import json

import z3


ROWS = tuple(f"B{i}" for i in range(6))
CENTERS = tuple(f"c{i}" for i in range(6))
NAMED = (
    "deleted",
    "rho1",
    "rho2",
    "p1",
    "p2",
    "q_source",
    "q_other",
    "source5",
)
FILLERS = tuple(f"f{i}" for i in range(8))
ATOMS = CENTERS + NAMED + FILLERS


def support_vars() -> dict[tuple[int, str], z3.BoolRef]:
    return {
        (row, atom): z3.Bool(f"mem_B{row}_{atom}")
        for row in range(6)
        for atom in ATOMS
    }


def base_solver(
    mem: dict[tuple[int, str], z3.BoolRef], timeout_ms: int = 5_000
) -> z3.Solver:
    solver = z3.SolverFor("QF_FD")
    solver.set(timeout=timeout_ms, random_seed=97)

    for row in range(6):
        solver.add(z3.PbEq([(mem[row, atom], 1) for atom in ATOMS], 4))
        solver.add(z3.Not(mem[row, "deleted"]))
        solver.add(z3.Not(mem[row, CENTERS[row]]))

    solver.add(mem[0, "rho1"], mem[0, "rho2"])
    for atom in ("p1", "p2", "q_source", "q_other"):
        solver.add(mem[1, atom])
    solver.add(mem[5, "source5"])
    return solver


def tetrahedron_motifs(
    mem: dict[tuple[int, str], z3.BoolRef],
) -> list[z3.BoolRef]:
    motifs: list[z3.BoolRef] = []
    for x in range(6):
        for y in range(6):
            if y == x:
                continue
            for b in range(6):
                if b == x or b == y:
                    continue
                for a in ATOMS:
                    motifs.append(
                        z3.And(
                            mem[x, CENTERS[y]],
                            mem[x, a],
                            mem[y, CENTERS[x]],
                            mem[y, a],
                            mem[y, CENTERS[b]],
                            mem[b, CENTERS[x]],
                            mem[b, CENTERS[y]],
                            mem[b, a],
                        )
                    )
    return motifs


def check_with(
    mem: dict[tuple[int, str], z3.BoolRef], extra: z3.BoolRef | None
) -> tuple[str, z3.ModelRef | None]:
    solver = base_solver(mem)
    if extra is not None:
        solver.add(extra)
    result = solver.check()
    if result == z3.sat:
        return "sat", solver.model()
    if result == z3.unsat:
        return "unsat", None
    return f"unknown:{solver.reason_unknown()}", None


def model_rows(
    model: z3.ModelRef, mem: dict[tuple[int, str], z3.BoolRef]
) -> dict[str, list[str]]:
    return {
        ROWS[row]: [
            atom
            for atom in ATOMS
            if z3.is_true(model.eval(mem[row, atom], model_completion=True))
        ]
        for row in range(6)
    }


def main() -> None:
    mem = support_vars()
    motifs = tetrahedron_motifs(mem)

    base_status, _ = check_with(mem, None)
    no_motif_status, no_motif_model = check_with(mem, z3.Not(z3.Or(motifs)))
    motif_status, _ = check_with(mem, z3.Or(motifs))

    controls = {}
    for name, contradiction in {
        "omit_rho1_from_B0": z3.Not(mem[0, "rho1"]),
        "put_deleted_in_B0": mem[0, "deleted"],
        "omit_q_other_from_B1": z3.Not(mem[1, "q_other"]),
        "put_deleted_in_B5": mem[5, "deleted"],
    }.items():
        controls[name], _ = check_with(mem, contradiction)

    payload = {
        "schema": "freshthird-six-center-provenance-v1",
        "solver": f"z3-{z3.get_version_string()}",
        "scope": "named-incidence abstraction; no geometry/global-K4/lift",
        "atom_count": len(ATOMS),
        "row_count": len(ROWS),
        "tetrahedron_motif_count": len(motifs),
        "base": base_status,
        "tetrahedron_motif_present": motif_status,
        "tetrahedron_motif_absent": no_motif_status,
        "negative_controls": controls,
        "no_motif_model_rows": (
            model_rows(no_motif_model, mem) if no_motif_model is not None else None
        ),
        "interpretation": (
            "SAT with the motif absent means the new B0/B1/B5 provenance facts "
            "do not propositionally force the checked tetrahedron consumer."
        ),
    }
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
