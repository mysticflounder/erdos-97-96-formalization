#!/usr/bin/env python3
"""Minimize the exact equality cores in the two saved ATAIL row networks.

This is a theorem-discovery probe.  Each atom is an equality

    dist(center, left)^2 = dist(center, right)^2.

The fixed gauge ``p0 = (0, 0)``, ``p1 = (1, 0)`` is legitimate for any
realization with distinct labels 0 and 1.  A Singular ``UNIT`` verdict is an
exact certificate that the gauge-fixed equality ideal has no complex point.
It is stronger than real/convex impossibility, but this script does not yet
emit or kernel-check a Nullstellensatz certificate.
"""
from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, Sequence

from census.global_confinement.equality_ideal_probe import (
    OracleResult,
    run_singular_script,
    singular_script,
    squared_distance,
    variable_names,
)
HERE = Path(__file__).resolve().parent
DEFAULT_OUTPUT = HERE / "minimized_critical_unit_cores.json"
SCHEMA = "p97-atail-minimized-critical-unit-cores-v1"
N = 12


def _load_candidates() -> tuple[object, ...]:
    source = HERE / "critical_row_metric_discriminator.py"
    spec = importlib.util.spec_from_file_location(
        "p97_atail_critical_row_metric_discriminator", source
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load candidate source {source}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return tuple(module.CANDIDATES)


@dataclass(frozen=True, order=True)
class EqualityAtom:
    center: int
    left: int
    right: int

    def __post_init__(self) -> None:
        if self.left == self.right:
            raise ValueError("an equality atom needs two distinct endpoints")
        if self.center in {self.left, self.right}:
            raise ValueError("a radius equality cannot use its center as an endpoint")

    def polynomial(self) -> str:
        return (
            f"({squared_distance(self.center, self.left)})"
            f"-({squared_distance(self.center, self.right)})"
        )

    def as_dict(self) -> dict[str, int]:
        return {
            "center": self.center,
            "left": self.left,
            "right": self.right,
        }


def atoms_of_rows(rows: Iterable[object]) -> tuple[EqualityAtom, ...]:
    atoms: list[EqualityAtom] = []
    for row in rows:
        support = tuple(row.support)
        if len(support) < 2:
            raise ValueError("a metric row needs at least two support points")
        pivot = support[0]
        atoms.extend(
            EqualityAtom(row.center, pivot, point) for point in support[1:]
        )
    return tuple(atoms)


def probe_atoms(
    atoms: Sequence[EqualityAtom],
    *,
    timeout_s: float,
    executable: str,
) -> OracleResult:
    script = singular_script(
        variable_names(N), tuple(atom.polynomial() for atom in atoms)
    )
    return run_singular_script(
        script, timeout_s=timeout_s, executable=executable
    )


def lift_support(
    atoms: Sequence[EqualityAtom],
    *,
    timeout_s: float,
    executable: str,
) -> tuple[EqualityAtom, ...]:
    """Return generators used by an exact Singular representation of one."""

    polynomials = ",\n  ".join(atom.polynomial() for atom in atoms)
    script = "\n".join(
        (
            f"ring r = 0, ({','.join(variable_names(N))}), dp;",
            f"ideal I = {polynomials};",
            "ideal G = slimgb(I);",
            'string("G1:", G[1]);',
            "matrix M = lift(I,G);",
            "poly chk = 0; int i;",
            "for (i=1;i<=size(I);i=i+1){chk=chk+I[i]*M[i,1];}",
            'string("CHK:", chk);',
            'for (i=1;i<=size(I);i=i+1){if(M[i,1]!=0){string("NZ:",i);}}',
            "exit;",
            "",
        )
    )
    try:
        process = subprocess.run(
            [executable, "-q"],
            input=script,
            capture_output=True,
            text=True,
            timeout=timeout_s,
            check=False,
        )
    except subprocess.TimeoutExpired as exc:
        raise RuntimeError("Singular lift timed out") from exc
    if process.returncode != 0:
        raise RuntimeError(process.stderr.strip() or "Singular lift failed")
    lines = tuple(line.strip() for line in process.stdout.splitlines())
    if "G1:1" not in lines or "CHK:1" not in lines:
        raise RuntimeError(
            "Singular lift did not return a checked representation of one"
        )
    indices = tuple(
        int(line.removeprefix("NZ:")) - 1
        for line in lines
        if line.startswith("NZ:")
    )
    if not indices:
        raise RuntimeError("Singular lift returned empty generator support")
    return tuple(atoms[index] for index in indices)


def minimize_atoms(
    atoms: Sequence[EqualityAtom],
    *,
    initial_timeout_s: float,
    timeout_s: float,
    executable: str,
) -> tuple[tuple[EqualityAtom, ...], list[dict[str, object]], bool]:
    current = list(atoms)
    initial = probe_atoms(
        current, timeout_s=initial_timeout_s, executable=executable
    )
    if initial.verdict != "UNIT":
        raise RuntimeError(f"initial atom system is not UNIT: {initial.verdict}")

    attempts: list[dict[str, object]] = []
    index = 0
    while index < len(current):
        atom = current[index]
        trial = current[:index] + current[index + 1 :]
        result = probe_atoms(
            trial, timeout_s=timeout_s, executable=executable
        )
        removed = result.verdict == "UNIT"
        attempts.append(
            {
                "atom": atom.as_dict(),
                "verdict": result.verdict,
                "removed": removed,
                "remaining_count": len(trial),
            }
        )
        if removed:
            current = trial
        else:
            index += 1

    final = tuple(current)
    final_result = probe_atoms(
        final, timeout_s=initial_timeout_s, executable=executable
    )
    if final_result.verdict != "UNIT":
        raise RuntimeError("minimization lost the UNIT verdict")

    retained_verdicts = {
        (
            attempt["atom"]["center"],
            attempt["atom"]["left"],
            attempt["atom"]["right"],
        ): attempt["verdict"]
        for attempt in attempts
        if not attempt["removed"]
    }
    bounded_irredundant = all(
        retained_verdicts[(atom.center, atom.left, atom.right)] == "NONUNIT"
        for atom in final
    )
    return final, attempts, bounded_irredundant


def _digest(atoms: Sequence[EqualityAtom]) -> str:
    payload = [atom.as_dict() for atom in atoms]
    return hashlib.sha256(
        json.dumps(payload, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def build_report(
    *,
    lift_timeout_s: float,
    initial_timeout_s: float,
    probe_timeout_s: float,
    executable: str,
    profile_index: int | None,
    skip_lift: bool,
) -> dict[str, object]:
    cores = []
    candidates = _load_candidates()
    if profile_index is not None:
        candidates = (candidates[profile_index],)
    for candidate in candidates:
        initial_atoms = atoms_of_rows(candidate.confirmed_unit_subsystem)
        lifted_atoms = (
            initial_atoms
            if skip_lift
            else lift_support(
                initial_atoms, timeout_s=lift_timeout_s, executable=executable
            )
        )
        final_atoms, attempts, bounded_irredundant = minimize_atoms(
            lifted_atoms,
            initial_timeout_s=initial_timeout_s,
            timeout_s=probe_timeout_s,
            executable=executable,
        )
        active_labels = sorted(
            {
                label
                for atom in final_atoms
                for label in (atom.center, atom.left, atom.right)
            }
        )
        cores.append(
            {
                "profile": list(candidate.profile),
                "initial_atom_count": len(initial_atoms),
                "lift_support_atom_count": len(lifted_atoms),
                "final_atom_count": len(final_atoms),
                "active_labels": active_labels,
                "core_sha256": _digest(final_atoms),
                "atoms": [atom.as_dict() for atom in final_atoms],
                "attempt_count": len(attempts),
                "atom_irredundant_within_probe_bound": bounded_irredundant,
                "deletion_verdict_histogram": {
                    verdict: sum(
                        attempt["verdict"] == verdict for attempt in attempts
                    )
                    for verdict in ("UNIT", "NONUNIT", "TIMEOUT", "ERROR")
                },
                "singular_verdict": "UNIT",
            }
        )
    return {
        "schema": SCHEMA,
        "scope": {
            "exact_qq_unit_ideal_verdict": True,
            "gauge_requires_labels_0_1_distinct": True,
            "nullstellensatz_certificate_emitted": False,
            "lean_theorem_proved": False,
            "candidate_family_exhaustive": False,
            "retained_timeout_means_indispensable": False,
        },
        "cores": cores,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--lift-timeout-s", type=float, default=120.0)
    parser.add_argument("--initial-timeout-s", type=float, default=30.0)
    parser.add_argument("--probe-timeout-s", type=float, default=5.0)
    parser.add_argument("--singular", default="Singular")
    parser.add_argument("--profile-index", type=int, choices=(0, 1))
    parser.add_argument("--skip-lift", action="store_true")
    parser.add_argument("--out", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    report = build_report(
        lift_timeout_s=args.lift_timeout_s,
        initial_timeout_s=args.initial_timeout_s,
        probe_timeout_s=args.probe_timeout_s,
        executable=args.singular,
        profile_index=args.profile_index,
        skip_lift=args.skip_lift,
    )
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.out.exists():
            raise SystemExit(f"missing checkpoint: {args.out}")
        if args.out.read_text() != rendered:
            raise SystemExit(f"checkpoint drift: {args.out}")
    else:
        args.out.write_text(rendered)
    for core in report["cores"]:
        print(
            f"profile={tuple(core['profile'])} "
            f"atoms={core['initial_atom_count']}->{core['final_atom_count']} "
            f"labels={len(core['active_labels'])}"
        )


if __name__ == "__main__":
    main()
