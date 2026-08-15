#!/usr/bin/env python3
"""Submit and finalize the seventeenth Lean-owned exact-17 PIQD root.

The sixteenth-root runner is a historical custody artifact. Load its audited
bytes, specialize root-local labels in memory, and bind the eight-motif child
so no earlier job state or artifact can be overwritten.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
BASE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_sixteenth_root.py"
BASE_RUNNER_SHA256 = "feb9e9d3da2f22909549e5416d5eb273aa53b6c33dd7d8b5c5c8d4d648c78916"


def load_runner() -> dict[str, Any]:
    source_bytes = BASE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != BASE_RUNNER_SHA256:
        raise RuntimeError(
            "historical sixteenth-root runner changed: "
            f"expected {BASE_RUNNER_SHA256}, got {actual_hash}"
        )
    source = source_bytes.decode("utf-8")
    if source.count("sixteenth") != 5:
        raise RuntimeError("unexpected sixteenth-root specialization surface")
    source = source.replace("sixteenth", "seventeenth")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_seventeenth_root_base",
    }
    # The executed bytes are pinned above; this is specialization, not input evaluation.
    exec(compile(source, str(BASE_RUNNER), "exec"), namespace)  # noqa: S102
    inherited = namespace["load_runner"]()
    if not isinstance(inherited, dict):
        raise TypeError("sixteenth-root runner did not return a namespace")
    return inherited


def main() -> None:
    runner = load_runner()
    scratch = runner["SCRATCH"]
    runner.update(
        {
            "CNF": scratch
            / "exact17-seventeenth-root-sixteenth-model-refinements.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-sixteenth-model-refinements.json",
            "INGRESS_REPORT": scratch
            / "exact17-seventeenth-root-sixteenth-model-refinements-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_144,
            "BYTES": 291_570_878,
            "CNF_SHA256": "f02af969370d424cc45059e6f7996dce60b5efdabe0f9d8a34d89d42da40448c",
            "MANIFEST_SHA256": "38dcebf8796f8e822cf45d58fe1bd4b5a7d810c9184631460a1e3d5dcad9b9c7",
            "DAEMON_SHA256": "0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360",
        }
    )
    runner["main"]()


if __name__ == "__main__":
    main()
