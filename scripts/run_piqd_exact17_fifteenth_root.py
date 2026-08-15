#!/usr/bin/env python3
"""Submit and finalize the fifteenth Lean-owned exact-17 PIQD root.

The fourteenth-root runner is a historical custody artifact. Load its audited
bytes, specialize root-local labels in memory, and bind the four-row
two-circle child so no earlier job state or artifact can be overwritten.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
BASE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_fourteenth_root.py"
BASE_RUNNER_SHA256 = "e6dbe2ef213a4dc1f9690b268cd3ada00a80203c177e2196f1ad1eed6c6128b8"


def load_runner() -> dict[str, Any]:
    source_bytes = BASE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != BASE_RUNNER_SHA256:
        raise RuntimeError(
            "historical fourteenth-root runner changed: "
            f"expected {BASE_RUNNER_SHA256}, got {actual_hash}"
        )
    source = source_bytes.decode("utf-8")
    if source.count("fourteenth") != 5:
        raise RuntimeError("unexpected fourteenth-root specialization surface")
    source = source.replace("fourteenth", "fifteenth")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_fifteenth_root_base",
    }
    # The executed bytes are pinned above; this is specialization, not input evaluation.
    exec(compile(source, str(BASE_RUNNER), "exec"), namespace)  # noqa: S102
    inherited = namespace["load_runner"]()
    if not isinstance(inherited, dict):
        raise TypeError("fourteenth-root runner did not return a namespace")
    return inherited


def main() -> None:
    runner = load_runner()
    scratch = runner["SCRATCH"]
    runner.update(
        {
            "CNF": scratch
            / "exact17-fifteenth-root-four-row-two-circle-bisector.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-four-row-two-circle-bisector.json",
            "INGRESS_REPORT": scratch
            / "exact17-fifteenth-root-four-row-two-circle-bisector-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_104,
            "BYTES": 291_569_030,
            "CNF_SHA256": "394b93e9e79fc36cdfbcb943832e46898da3944e6f24f6a0d777802e761238fd",
            "MANIFEST_SHA256": "d0fad08e38973a0c574c5f38d24b37f3b44f6638825d828cfa8a4921cc34e8d7",
            "DAEMON_SHA256": "0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360",
        }
    )
    runner["main"]()


if __name__ == "__main__":
    main()
