#!/usr/bin/env python3
"""Submit and finalize the sixteenth Lean-owned exact-17 PIQD root.

The fifteenth-root runner is a historical custody artifact. Load its audited
bytes, specialize root-local labels in memory, and bind the combined generic-
cancellation plus convex-five-point child so no earlier job state or artifact
can be overwritten.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
BASE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_fifteenth_root.py"
BASE_RUNNER_SHA256 = "b317ed173f3ebec0c965526dc4fbedf6a702ca9a1f34bc2094518de9c3c3daff"


def load_runner() -> dict[str, Any]:
    source_bytes = BASE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != BASE_RUNNER_SHA256:
        raise RuntimeError(
            "historical fifteenth-root runner changed: "
            f"expected {BASE_RUNNER_SHA256}, got {actual_hash}"
        )
    source = source_bytes.decode("utf-8")
    if source.count("fifteenth") != 5:
        raise RuntimeError("unexpected fifteenth-root specialization surface")
    source = source.replace("fifteenth", "sixteenth")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_sixteenth_root_base",
    }
    # The executed bytes are pinned above; this is specialization, not input evaluation.
    exec(compile(source, str(BASE_RUNNER), "exec"), namespace)  # noqa: S102
    inherited = namespace["load_runner"]()
    if not isinstance(inherited, dict):
        raise TypeError("fifteenth-root runner did not return a namespace")
    return inherited


def main() -> None:
    runner = load_runner()
    scratch = runner["SCRATCH"]
    runner.update(
        {
            "CNF": scratch
            / "exact17-sixteenth-root-fifth-convex-five-point.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-fifth-convex-five-point.json",
            "INGRESS_REPORT": scratch
            / "exact17-sixteenth-root-fifth-convex-five-point-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_112,
            "BYTES": 291_569_428,
            "CNF_SHA256": "c8e6011fce2f0373fffa23b45285d38e95224a60778623bdb5c53e323b951d38",
            "MANIFEST_SHA256": "ff186483a724beddc0a3af06d8bfe7e7cd012384e3e0f06636ec3bd2aac57796",
            "DAEMON_SHA256": "0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360",
        }
    )
    runner["main"]()


if __name__ == "__main__":
    main()
