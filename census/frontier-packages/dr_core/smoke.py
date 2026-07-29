"""Positive witnesses and DRAT-verified negative probes for D-R."""

from __future__ import annotations

import json
import sys
import time
from pathlib import Path
from typing import Any

sys.path.insert(0, str(Path(__file__).resolve().parent))
import encoding as enc  # noqa: E402

OUT_DIR = Path(__file__).resolve().parent / "out" / "smoke"


def solve_probe(
    encoder: enc.DREncoder,
    name: str,
    run_name: str,
    extra: list[tuple[int, ...]],
    expected: str,
    timeout: int = 60,
) -> dict[str, Any]:
    instance = enc.RunInstance(encoder, encoder.clauses_for(run_name))
    cnf_path = OUT_DIR / f"{name}.cnf"
    proof_path = OUT_DIR / f"{name}.drat" if expected == "UNSAT" else None
    start = time.monotonic()
    result = enc.solve_cadical(
        instance, cnf_path, extra_clauses=extra,
        timeout_seconds=timeout, proof_path=proof_path,
    )
    record: dict[str, Any] = {
        "gate": name,
        "run": run_name,
        "verdict": result.verdict,
        "expected": expected,
        "pass": result.verdict == expected and (
            expected != "UNSAT" or result.proof_verified
        ),
        "proof_verified": result.proof_verified,
        "wall_seconds": round(time.monotonic() - start, 3),
    }
    if result.verdict == "SAT" and result.cube is not None:
        model_path = OUT_DIR / f"{name}.model.json"
        model_path.write_text(
            json.dumps(result.cube, sort_keys=True, indent=2), encoding="utf-8"
        )
        record["model_file"] = str(model_path.relative_to(OUT_DIR.parents[1]))
    return record


def main() -> int:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    encoder = enc.DREncoder()
    gates: list[dict[str, Any]] = []

    # Hand-built total assignments: every named atom receives a unit.
    for run_name in ("dr-common", "dr-d1", "dr-d2"):
        gates.append(
            solve_probe(
                encoder, f"positive-{run_name}", run_name,
                encoder.witness_units(run_name), "SAT",
            )
        )

    # A concrete legal two-point B1/B2 overlap.
    gates.append(
        solve_probe(
            encoder, "positive-overlap-two", "dr-common",
            encoder.witness_units("dr-common", overlap=2), "SAT",
        )
    )

    # D1 witness disjointness: every forbidden cross-identification is checked.
    for left in enc.GROUPS["X"]:
        for right in enc.GROUPS["Y"]:
            gates.append(
                solve_probe(
                    encoder, f"negative-disjoint-{left}-{right}", "dr-d1",
                    [(encoder.eqv(left, right),)], "UNSAT",
                )
            )

    # Three distinct shared witness points violate I-OVERLAP.
    gates.append(
        solve_probe(
            encoder, "negative-overlap-three", "dr-common",
            [
                (encoder.eqv(enc.GROUPS["B1"][i], enc.GROUPS["B2"][i]),)
                for i in range(3)
            ],
            "UNSAT",
        )
    )

    # Corrected swap gate: only the five-entry role/cap map is involutive.
    role_swap = {
        "firstApex": "secondApex", "secondApex": "firstApex",
        "firstCap": "secondCap", "secondCap": "firstCap",
        "surplusCap": "surplusCap",
    }
    double_swap_ok = all(role_swap[role_swap[key]] == key for key in role_swap)
    gates.append({
        "gate": "direct-double-role-swap",
        "scope": "five role/cap aliases only; no packet or a0p identity",
        "verdict": "PASS" if double_swap_ok else "FAIL",
        "expected": "PASS",
        "pass": double_swap_ok,
        "proof_verified": False,
        "wall_seconds": 0.0,
    })
    for index, alias in enumerate(enc.SWAP_ALIASES):
        gates.append(
            solve_probe(
                encoder, f"negative-swap-alias-{index + 1}", "dr-d2",
                [(-encoder.swap[alias],)], "UNSAT",
            )
        )

    # Selector and deletion one-hot/distinctness probes.
    gates.append(
        solve_probe(
            encoder, "negative-qF-wF-same-slot", "dr-common",
            [(encoder.sel[("qF", 0)],), (encoder.sel[("wF", 0)],)], "UNSAT",
        )
    )
    gates.append(
        solve_probe(
            encoder, "negative-p-pP-same-slot", "dr-common",
            [(encoder.sel[("p", 0)],), (encoder.sel[("pP", 0)],)], "UNSAT",
        )
    )
    gates.append(
        solve_probe(
            encoder, "negative-double-deletion-choice", "dr-common",
            [(encoder.delta_q,), (encoder.delta_w,)], "UNSAT",
        )
    )

    report = {
        "scope": "named-local incidence shadow; not a carrier enumeration",
        "all_gates_pass": all(gate["pass"] for gate in gates),
        "gates": gates,
    }
    (OUT_DIR / "smoke_report.json").write_text(
        json.dumps(report, sort_keys=True, indent=2), encoding="utf-8"
    )
    for gate in gates:
        print(
            f"{gate['gate']:35s} {gate['verdict']:6s} "
            f"verified={gate['proof_verified']} pass={gate['pass']}"
        )
    print(f"all_gates_pass={report['all_gates_pass']}")
    return 0 if report["all_gates_pass"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
