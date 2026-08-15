"""Produce and independently verify DRAT proofs for all 24 static cases."""

from __future__ import annotations

import hashlib
import json
import subprocess
from concurrent.futures import ProcessPoolExecutor
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while chunk := stream.read(1 << 20):
            digest.update(chunk)
    return digest.hexdigest()


def authenticate(case: tuple[int, int]) -> dict[str, object]:
    order, variant = case
    stem = HERE / f"three-pair-static-o{order}-v{variant}"
    cnf = stem.with_suffix(".cnf")
    proof = stem.with_suffix(".drat")
    verify_log = stem.with_suffix(".drat-verify.log")
    solve = subprocess.run(
        ["cadical", "-q", "--binary=false", str(cnf), str(proof)],
        capture_output=True,
        text=True,
        check=False,
    )
    verify = subprocess.run(
        ["drat-trim", str(cnf), str(proof)],
        capture_output=True,
        text=True,
        check=False,
    )
    verify_text = verify.stdout + verify.stderr
    verify_log.write_text(verify_text, encoding="utf-8")
    return {
        "case": f"o{order}-v{variant}",
        "cadical_exit": solve.returncode,
        "drat_trim_exit": verify.returncode,
        "verified": verify.returncode == 0 and "s VERIFIED" in verify_text,
        "cnf_bytes": cnf.stat().st_size,
        "cnf_sha256": sha256(cnf),
        "drat_bytes": proof.stat().st_size,
        "drat_sha256": sha256(proof),
        "verify_log_sha256": sha256(verify_log),
    }


def main() -> int:
    cases = [(order, variant) for order in range(2) for variant in range(12)]
    with ProcessPoolExecutor(max_workers=8) as pool:
        results = list(pool.map(authenticate, cases))
    source_paths = (
        HERE / "probe.py",
        HERE / "first_fiber_probe.py",
        HERE / "alternation_static_probe.py",
        HERE / "three_pair_static_probe.py",
        ROOT / "lean/Erdos9796Proof/P97/ATail/KalmansonThreeEqualitySchemas.lean",
    )
    manifest = {
        "schema": "rigid221-blockerv-offclass-exact15-three-pair-static-v1",
        "case_count": len(results),
        "all_verified": all(result["verified"] for result in results),
        "sources": {
            str(path.relative_to(ROOT)): sha256(path) for path in source_paths
        },
        "cases": results,
    }
    target = HERE / "three-pair-static-authenticated-manifest.json"
    target.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "manifest": str(target),
                "case_count": len(results),
                "verified_count": sum(result["verified"] for result in results),
                "total_cnf_bytes": sum(result["cnf_bytes"] for result in results),
                "total_drat_bytes": sum(result["drat_bytes"] for result in results),
            },
            sort_keys=True,
        )
    )
    return 0 if manifest["all_verified"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
