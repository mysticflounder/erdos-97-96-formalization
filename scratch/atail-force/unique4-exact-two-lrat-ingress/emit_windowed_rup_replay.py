#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Emit one independently replayable Lean module from a windowed RUP package."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
import shutil
import sys
import tempfile
from typing import Any

import materialize_windowed_rup


MODULE_NAMESPACE = "WindowedRupReplay"
MODULE_FILENAMES = ("Common.lean", "Window.lean")
FORBIDDEN_GENERATED_TOKENS = (
    "native_decide",
    "axiom",
    "sorry",
    "admit",
    "implemented_by",
)


class WindowReplayEmissionError(RuntimeError):
    """A verified package cannot be emitted with the requested selection."""


def _positive_int(value: object, *, label: str) -> int:
    if isinstance(value, bool) or not isinstance(value, int) or value <= 0:
        raise WindowReplayEmissionError(f"{label} must be a positive integer")
    return value


def _select_window(
    payload: dict[str, Any], *, shard: int, window: int
) -> dict[str, Any]:
    if shard not in (1, 2):
        raise WindowReplayEmissionError("shard must be 1 or 2")
    window = _positive_int(window, label="window")
    records = payload.get("windows", {}).get(f"shard_{shard}")
    if not isinstance(records, list) or window > len(records):
        raise WindowReplayEmissionError(
            f"window {window} is out of range for shard {shard}"
        )
    record = records[window - 1]
    if record.get("index") != window:
        raise WindowReplayEmissionError("verified window index drift")
    if record.get("role") not in ("rebase", "terminal"):
        raise WindowReplayEmissionError("unsupported window role")
    return record


def _artifact_path(
    package_dir: Path, record: dict[str, Any], *, label: str
) -> Path:
    return materialize_windowed_rup.resolve_package_relative(
        package_dir, record, label=label
    )


def _common_module(n: int) -> str:
    return f'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Certificate.CheckpointedRup

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace {MODULE_NAMESPACE}

open Problem97.CheckpointedRup

/-- One larger than the DIMACS variable count. -/
abbrev n : Nat := {n}

/-- The canonical checkpoint at the selected window's entrance. -/
abbrev startText : String := include_str "../start.cnf"

/-- The selected window's rebased pure-RUP actions. -/
abbrev actionText : String := include_str "../actions.lrat"

/-- The canonical checkpoint at the selected window's exit. -/
abbrev endText : String := include_str "../end.cnf"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem startIsSome :
    (TextIngress.parseDimacs (n := n) startText).isSome := by
  unfold n startText
  decide

def start : Array (Option (DefaultClause n)) :=
  (TextIngress.parseDimacs (n := n) startText).get startIsSome

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem finishIsSome :
    (TextIngress.parseDimacs (n := n) endText).isSome := by
  unfold n endText
  decide

def finish : Array (Option (DefaultClause n)) :=
  (TextIngress.parseDimacs (n := n) endText).get finishIsSome

theorem startParsed :
    TextIngress.parseDimacs (n := n) startText = some start := by
  unfold start
  exact Option.eq_some_of_isSome startIsSome

theorem finishParsed :
    TextIngress.parseDimacs (n := n) endText = some finish := by
  unfold finish
  exact Option.eq_some_of_isSome finishIsSome

end {MODULE_NAMESPACE}
'''


def _window_module(role: str) -> str:
    if role == "rebase":
        accepted_type = (
            "TextIngress.checkRebaseText (n := n) startText actionText "
            "endText = true"
        )
        sound_type = """\
    Limplies (PosFin n) (DefaultFormula.ofArray start)
      (DefaultFormula.ofArray finish)"""
        sound_value = """\
  TextIngress.checkRebaseText_sound_of_parse
    startParsed finishParsed accepted"""
    elif role == "terminal":
        accepted_type = (
            "TextIngress.checkTerminalText (n := n) startText actionText = true"
        )
        sound_type = (
            "    Unsatisfiable (PosFin n) (DefaultFormula.ofArray start)"
        )
        sound_value = """\
  TextIngress.checkTerminalText_sound_of_parse startParsed accepted"""
    else:
        raise WindowReplayEmissionError(f"unsupported window role: {role}")
    return f'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import {MODULE_NAMESPACE}.Common

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace {MODULE_NAMESPACE}

open Problem97.CheckpointedRup

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    {accepted_type} := by
  unfold n startText actionText endText
  decide

theorem sound :
{sound_type} :=
{sound_value}

end {MODULE_NAMESPACE}
'''


def _assert_safe_generated_source(source: str, *, label: str) -> None:
    lowered = source.lower()
    for token in FORBIDDEN_GENERATED_TOKENS:
        if token in lowered:
            raise WindowReplayEmissionError(
                f"generated {label} contains forbidden token {token}"
            )


def emit(
    package_dir: Path,
    output_dir: Path,
    *,
    shard: int,
    window: int,
) -> dict[str, Any]:
    """Verify the whole package and emit one selected replay window."""

    package_dir = package_dir.resolve()
    output_dir = output_dir.resolve()
    payload = materialize_windowed_rup.verify_windowed_package(package_dir)
    record = _select_window(payload, shard=shard, window=window)

    counts = payload.get("counts")
    if not isinstance(counts, dict):
        raise WindowReplayEmissionError("verified package has no counts object")
    n = _positive_int(
        counts.get("variable_count"), label="variable_count"
    ) + 1

    checkpoints = payload.get("checkpoints")
    if not isinstance(checkpoints, list):
        raise WindowReplayEmissionError("verified package has no checkpoints")
    start_index = int(record["start_checkpoint"])
    end_index = int(record["end_checkpoint"])
    start_path = _artifact_path(
        package_dir, checkpoints[start_index], label="start checkpoint"
    )
    end_path = _artifact_path(
        package_dir, checkpoints[end_index], label="end checkpoint"
    )
    action_path = _artifact_path(
        package_dir,
        record["artifacts"]["actions_lrat"],
        label="window actions",
    )

    if output_dir.exists():
        raise WindowReplayEmissionError(
            f"refusing to overwrite existing replay output: {output_dir}"
        )

    sources = {
        "Common.lean": _common_module(n),
        "Window.lean": _window_module(str(record["role"])),
    }
    if tuple(sources) != MODULE_FILENAMES:
        raise WindowReplayEmissionError(
            "internal module layout is not deterministic"
        )
    for name, source in sources.items():
        _assert_safe_generated_source(source, label=name)

    output_dir.parent.mkdir(parents=True, exist_ok=True)
    temporary = Path(
        tempfile.mkdtemp(prefix=f".{output_dir.name}.tmp-", dir=output_dir.parent)
    )
    try:
        module_dir = temporary / MODULE_NAMESPACE
        module_dir.mkdir()
        shutil.copyfile(start_path, temporary / "start.cnf")
        shutil.copyfile(action_path, temporary / "actions.lrat")
        shutil.copyfile(end_path, temporary / "end.cnf")
        for filename, source in sources.items():
            (module_dir / filename).write_text(source, encoding="utf-8")
        temporary.rename(output_dir)
    except BaseException:
        shutil.rmtree(temporary, ignore_errors=True)
        raise

    return {
        "package_dir": str(package_dir),
        "output_dir": str(output_dir),
        "package_sha256": payload.get("package_sha256"),
        "module_namespace": MODULE_NAMESPACE,
        "n": n,
        "shard": shard,
        "window": window,
        "role": record["role"],
        "start_checkpoint": start_index,
        "end_checkpoint": end_index,
    }


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Emit one Lean replay module from a windowed RUP package."
    )
    parser.add_argument("--package-dir", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--shard", type=int, choices=(1, 2), required=True)
    parser.add_argument("--window", type=int, required=True)
    args = parser.parse_args(argv)
    try:
        result = emit(
            args.package_dir,
            args.output_dir,
            shard=args.shard,
            window=args.window,
        )
    except (
        materialize_windowed_rup.MaterializationError,
        WindowReplayEmissionError,
    ) as exc:
        parser.error(str(exc))
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    sys.exit(main())
