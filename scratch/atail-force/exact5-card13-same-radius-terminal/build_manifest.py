#!/usr/bin/env python3
"""Assemble a hash-anchored replay manifest for the two certificate orbits."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def artifact(path: Path) -> dict[str, object]:
    return {
        "path": path.name,
        "bytes": path.stat().st_size,
        "sha256": sha256(path),
    }


def main() -> int:
    orbits = {}
    for orientation in ("direct", "mirror"):
        metadata = json.loads((HERE / f"{orientation}.metadata.json").read_text())
        solved = json.loads((HERE / f"{orientation}.cadical.json").read_text())
        checked = json.loads((HERE / f"{orientation}.drat-check.json").read_text())
        trimmed = json.loads((HERE / f"{orientation}.trim.json").read_text())
        orbits[orientation] = {
            "normalized_orbit": metadata["normalized_orbit"],
            "cnf_variables": metadata["cnf_variable_count"],
            "cnf_clauses": metadata["cnf_clause_count"],
            "cadical_status": solved["status"],
            "drat_status": checked["status"],
            "core_clauses": trimmed["core_num_clauses"],
            "lrat_independently_checked": False,
            "artifacts": {
                suffix.replace(".", "_"): artifact(HERE / f"{orientation}.{suffix}")
                for suffix in (
                    "cnf",
                    "metadata.json",
                    "cadical.log",
                    "cadical.json",
                    "drat",
                    "drat-trim.log",
                    "drat-check.json",
                    "core.cnf",
                    "lrat",
                    "trim.log",
                    "trim.json",
                )
            },
        }
    manifest = {
        "schema": "p97-exact5-card13-asymmetric-same-certificate-manifest-v1",
        "epistemic_status": "CNF_UNSAT_DRAT_VERIFIED_SOURCE_TO_CNF_MAP_NOT_LEAN_CHECKED",
        "source_surface": {
            "file": artifact(HERE / "asymmetric_ordinal_rank.py"),
            "base_encoder": artifact(
                HERE.parent / "exact5-full-role-retained-gate" / "decision.py"
            ),
            "base_outer": artifact(
                HERE.parent / "exact5-global-cover-parent-gate" / "encode.py"
            ),
        },
        "encoder": artifact(HERE / "bitblast_ordinal_cnf.py"),
        "smoke": artifact(HERE / "smoke.json"),
        "orbits": orbits,
        "source_map_gates_remaining": [
            "audit BaseOuter clause blocks against named Lean source fields",
            "prove direct/mirror asymmetric orbit exhaustiveness",
            "prove the card-13 (5,6,5) Fin 13 boundary transport",
            "port the finite source formula and certificate checker to Lean",
        ],
        "replay_commands": [
            "UV_CACHE_DIR=.uv-cache uv run --no-project python scratch/atail-force/exact5-card13-same-radius-terminal/smoke_bitblast.py --output scratch/atail-force/exact5-card13-same-radius-terminal/smoke.json",
            "UV_CACHE_DIR=.uv-cache uv run --no-project python scratch/atail-force/exact5-card13-same-radius-terminal/bitblast_ordinal_cnf.py --orientation direct --seed 17 --output-cnf scratch/atail-force/exact5-card13-same-radius-terminal/direct.cnf --output-metadata scratch/atail-force/exact5-card13-same-radius-terminal/direct.metadata.json",
            "UV_CACHE_DIR=.uv-cache uv run --no-project python scratch/atail-force/exact5-card13-same-radius-terminal/bitblast_ordinal_cnf.py --orientation mirror --seed 17 --output-cnf scratch/atail-force/exact5-card13-same-radius-terminal/mirror.cnf --output-metadata scratch/atail-force/exact5-card13-same-radius-terminal/mirror.metadata.json",
            "UV_CACHE_DIR=.uv-cache uv run --no-project python scratch/atail-force/exact5-card13-same-radius-terminal/run_cadical_drat.py --cnf scratch/atail-force/exact5-card13-same-radius-terminal/direct.cnf --proof scratch/atail-force/exact5-card13-same-radius-terminal/direct.drat --log scratch/atail-force/exact5-card13-same-radius-terminal/direct.cadical.log --output scratch/atail-force/exact5-card13-same-radius-terminal/direct.cadical.json --timeout-seconds 600",
            "UV_CACHE_DIR=.uv-cache uv run --no-project python scratch/atail-force/exact5-card13-same-radius-terminal/run_cadical_drat.py --cnf scratch/atail-force/exact5-card13-same-radius-terminal/mirror.cnf --proof scratch/atail-force/exact5-card13-same-radius-terminal/mirror.drat --log scratch/atail-force/exact5-card13-same-radius-terminal/mirror.cadical.log --output scratch/atail-force/exact5-card13-same-radius-terminal/mirror.cadical.json --timeout-seconds 600",
            "UV_CACHE_DIR=.uv-cache uv run --no-project python scratch/atail-force/exact5-card13-same-radius-terminal/check_drat.py --cnf scratch/atail-force/exact5-card13-same-radius-terminal/direct.cnf --proof scratch/atail-force/exact5-card13-same-radius-terminal/direct.drat --log scratch/atail-force/exact5-card13-same-radius-terminal/direct.drat-trim.log --output scratch/atail-force/exact5-card13-same-radius-terminal/direct.drat-check.json --timeout-seconds 600",
            "UV_CACHE_DIR=.uv-cache uv run --no-project python scratch/atail-force/exact5-card13-same-radius-terminal/check_drat.py --cnf scratch/atail-force/exact5-card13-same-radius-terminal/mirror.cnf --proof scratch/atail-force/exact5-card13-same-radius-terminal/mirror.drat --log scratch/atail-force/exact5-card13-same-radius-terminal/mirror.drat-trim.log --output scratch/atail-force/exact5-card13-same-radius-terminal/mirror.drat-check.json --timeout-seconds 600",
            "UV_CACHE_DIR=.uv-cache uv run --no-project python scratch/atail-force/exact5-card13-same-radius-terminal/trim_to_lrat.py --cnf scratch/atail-force/exact5-card13-same-radius-terminal/direct.cnf --proof scratch/atail-force/exact5-card13-same-radius-terminal/direct.drat --core scratch/atail-force/exact5-card13-same-radius-terminal/direct.core.cnf --lrat scratch/atail-force/exact5-card13-same-radius-terminal/direct.lrat --log scratch/atail-force/exact5-card13-same-radius-terminal/direct.trim.log --output scratch/atail-force/exact5-card13-same-radius-terminal/direct.trim.json --timeout-seconds 1200",
            "UV_CACHE_DIR=.uv-cache uv run --no-project python scratch/atail-force/exact5-card13-same-radius-terminal/trim_to_lrat.py --cnf scratch/atail-force/exact5-card13-same-radius-terminal/mirror.cnf --proof scratch/atail-force/exact5-card13-same-radius-terminal/mirror.drat --core scratch/atail-force/exact5-card13-same-radius-terminal/mirror.core.cnf --lrat scratch/atail-force/exact5-card13-same-radius-terminal/mirror.lrat --log scratch/atail-force/exact5-card13-same-radius-terminal/mirror.trim.log --output scratch/atail-force/exact5-card13-same-radius-terminal/mirror.trim.json --timeout-seconds 1200",
        ],
    }
    (HERE / "certificate-manifest.json").write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({
        "status": manifest["epistemic_status"],
        "output": str(HERE / "certificate-manifest.json"),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
