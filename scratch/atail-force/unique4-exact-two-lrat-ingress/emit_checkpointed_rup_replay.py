#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Emit separately replayable Lean modules from a checked RUP package."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
import shutil
import sys
import tempfile
from typing import Any

import materialize_checkpointed_rup


MODULE_NAMESPACE = "CheckpointedRupReplay"
MODULE_FILENAMES = ("Common.lean", "First.lean", "Second.lean", "Compose.lean")
ARTIFACT_FILENAMES = {
    "start_cnf": "start.cnf",
    "checkpoint_cnf": "checkpoint.cnf",
    "shard_1_lrat": "shard-1.lrat",
    "shard_2_lrat": "shard-2.lrat",
}
FORBIDDEN_GENERATED_TOKENS = (
    "native_decide",
    "axiom",
    "sorry",
    "admit",
    "implemented_by",
)


class ReplayEmissionError(RuntimeError):
    """The package is valid but unsuitable for deterministic module emission."""


def _positive_nat(value: object, *, label: str) -> int:
    if isinstance(value, bool) or not isinstance(value, int) or value <= 0:
        raise ReplayEmissionError(f"{label} must be a positive integer")
    return value


def _artifact_path(payload: dict[str, Any], package_dir: Path, key: str) -> Path:
    records = payload.get("artifacts")
    if not isinstance(records, dict):
        raise ReplayEmissionError("verified package has no artifact records")
    record = records.get(key)
    if not isinstance(record, dict):
        raise ReplayEmissionError(f"verified package lacks artifact record: {key}")
    relative = Path(str(record.get("path", "")))
    expected = Path(ARTIFACT_FILENAMES[key])
    if relative != expected:
        raise ReplayEmissionError(
            f"unexpected canonical path for {key}: {relative} (expected {expected})"
        )
    return package_dir / relative


def _common_module(n: int) -> str:
    return f'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Certificate.CheckpointedRup

namespace {MODULE_NAMESPACE}

/-- One larger than the package's DIMACS variable count. -/
abbrev n : Nat := {n}

/-- The package's original CNF, kept separate from both replay shards. -/
abbrev startText : String := include_str "../start.cnf"

/-- The exact compact checkpoint shared by the two replay shards. -/
abbrev checkpointText : String := include_str "../checkpoint.cnf"

end {MODULE_NAMESPACE}
'''


def _first_module() -> str:
    return f'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Certificate.CheckpointedRup
import {MODULE_NAMESPACE}.Common

namespace {MODULE_NAMESPACE}

/-- The first pure-RUP shard, checked independently against the shared checkpoint. -/
abbrev firstText : String := include_str "../shard-1.lrat"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem firstAccepted :
    Problem97.CheckpointedRup.TextIngress.checkRebaseText
      (n := n) startText firstText checkpointText = true := by
  unfold n startText firstText checkpointText
  decide

end {MODULE_NAMESPACE}
'''


def _second_module() -> str:
    return f'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Certificate.CheckpointedRup
import {MODULE_NAMESPACE}.Common

namespace {MODULE_NAMESPACE}

/-- The terminal pure-RUP shard, checked independently from the first shard. -/
abbrev secondText : String := include_str "../shard-2.lrat"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem secondAccepted :
    Problem97.CheckpointedRup.TextIngress.checkTerminalText
      (n := n) checkpointText secondText = true := by
  unfold n checkpointText secondText
  decide

end {MODULE_NAMESPACE}
'''


def _compose_module() -> str:
    return f'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Certificate.CheckpointedRup
import {MODULE_NAMESPACE}.First
import {MODULE_NAMESPACE}.Second

namespace {MODULE_NAMESPACE}

/-- Compose the already checked shard results without re-evaluating either shard. -/
theorem replaySound :=
  Problem97.CheckpointedRup.TextIngress.checkSeparateText_sound
    firstAccepted secondAccepted

end {MODULE_NAMESPACE}
'''


def _module_sources(n: int) -> dict[str, str]:
    return {
        "Common.lean": _common_module(n),
        "First.lean": _first_module(),
        "Second.lean": _second_module(),
        "Compose.lean": _compose_module(),
    }


def _assert_safe_generated_source(source: str, *, label: str) -> None:
    lowered = source.lower()
    for token in FORBIDDEN_GENERATED_TOKENS:
        if token in lowered:
            raise ReplayEmissionError(f"generated {label} contains forbidden token {token}")


def emit(package_dir: Path, output_dir: Path) -> dict[str, Any]:
    """Validate one package and emit its four fixed-name Lean replay modules."""

    package_dir = package_dir.resolve()
    output_dir = output_dir.resolve()
    payload = materialize_checkpointed_rup.verify_package(package_dir)

    counts = payload.get("counts")
    if not isinstance(counts, dict):
        raise ReplayEmissionError("verified package has no counts object")
    n = _positive_nat(counts.get("variable_count"), label="variable_count") + 1

    artifact_paths = {
        key: _artifact_path(payload, package_dir, key)
        for key in ARTIFACT_FILENAMES
    }
    if output_dir.exists():
        raise ReplayEmissionError(
            f"refusing to overwrite existing replay output: {output_dir}"
        )

    sources = _module_sources(n)
    if tuple(sources) != MODULE_FILENAMES:
        raise ReplayEmissionError("internal module layout is not deterministic")
    for name, source in sources.items():
        _assert_safe_generated_source(source, label=name)

    output_dir.parent.mkdir(parents=True, exist_ok=True)
    temporary = Path(
        tempfile.mkdtemp(prefix=f".{output_dir.name}.tmp-", dir=output_dir.parent)
    )
    try:
        module_dir = temporary / MODULE_NAMESPACE
        module_dir.mkdir()
        for key, filename in ARTIFACT_FILENAMES.items():
            shutil.copyfile(artifact_paths[key], temporary / filename)
        for filename, source in sources.items():
            (module_dir / filename).write_text(source, encoding="utf-8")
        try:
            temporary.rename(output_dir)
        except FileExistsError as exc:
            raise ReplayEmissionError(
                f"refusing to overwrite existing replay output: {output_dir}"
            ) from exc
    except BaseException:
        shutil.rmtree(temporary, ignore_errors=True)
        raise

    return {
        "package_dir": str(package_dir),
        "output_dir": str(output_dir),
        "module_namespace": MODULE_NAMESPACE,
        "n": n,
        "package_sha256": payload.get("package_sha256"),
    }


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Emit separate Lean RUP replay modules from one checked package."
    )
    parser.add_argument("--package-dir", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    args = parser.parse_args(argv)
    try:
        result = emit(args.package_dir, args.output_dir)
    except (materialize_checkpointed_rup.MaterializationError, ReplayEmissionError) as exc:
        parser.error(str(exc))
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    sys.exit(main())
