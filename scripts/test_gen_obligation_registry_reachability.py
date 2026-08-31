# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
"""Adversarial tests for reviewed private-edge reachability overrides."""

from __future__ import annotations

import importlib.util
import json
import subprocess
import sys
from pathlib import Path

import pytest

SCRIPT = Path(__file__).resolve().parent / "gen_obligation_registry.py"
_spec = importlib.util.spec_from_file_location("gen_obligation_registry_reachability", SCRIPT)
assert _spec is not None and _spec.loader is not None
gor = importlib.util.module_from_spec(_spec)
sys.modules[_spec.name] = gor
_spec.loader.exec_module(gor)

LEAVES = sorted(gor.PRIVATE_EDGE_REACHABILITY)
CONSUMERS = [gor.PRIVATE_EDGE_REACHABILITY[leaf]["consumer"] for leaf in LEAVES]
FILE = "Fixture/FrontierLiveClosure.lean"


def record(symbol: str) -> dict:
    return {"symbol": symbol, "file": FILE, "line": 10, "kind": "theorem"}


def manifest() -> dict:
    return {
        "schema": gor.PRIVATE_EDGE_SCHEMA,
        "entries": [
            {
                "leaf": leaf,
                "consumer": gor.PRIVATE_EDGE_REACHABILITY[leaf]["consumer"],
                "path": gor.PRIVATE_EDGE_REACHABILITY[leaf]["path"],
            }
            for leaf in LEAVES
        ],
    }


def test_valid_reviewed_manifest_promotes_only_offspine_leaves() -> None:
    registry, _ = gor.build_registry(
        [record(consumer) for consumer in CONSUMERS],
        [record(leaf) for leaf in LEAVES],
        "a" * 40,
        {"assigned": {}, "retired": {}, "aliases": {}},
        private_edge_overrides=manifest()["entries"],
    )
    assert {
        row["lean_decl"] for row in registry["obligations"] if row["reachable"]
    } == set(CONSUMERS) | set(LEAVES)


@pytest.mark.parametrize(
    "mutate",
    [
        lambda data: data["entries"].pop(),
        lambda data: data["entries"].append(data["entries"][0].copy()),
        lambda data: data["entries"][0].update(path=[]),
        lambda data: data.update(extra=True),
    ],
    ids=["missing", "duplicate", "malformed-path", "unknown-key"],
)
def test_manifest_shape_is_fail_closed(tmp_path: Path, mutate) -> None:
    data = manifest()
    mutate(data)
    path = tmp_path / gor.PRIVATE_EDGE_REACHABILITY_NAME
    path.write_text(json.dumps(data), encoding="utf-8")
    with pytest.raises(gor.RegistryError):
        gor.load_private_edge_reachability(tmp_path)


@pytest.mark.parametrize(
    "spine,offspine,needle",
    [
        ([record(LEAVES[0])], [record(LEAVES[1])], "already-spine/redundant"),
        ([], [record(LEAVES[0]), record(LEAVES[0]), record(LEAVES[1])], "duplicated"),
        ([], [record(LEAVES[0])], "missing from off-spine"),
    ],
    ids=["already-spine", "duplicate-export", "missing-export"],
)
def test_override_must_be_exclusive_offspine(spine, offspine, needle: str) -> None:
    overrides = manifest()["entries"]
    violations = gor.validate_private_edge_overrides(spine, offspine, overrides)
    assert any(needle in violation for violation in violations)


def test_generate_and_check_use_the_same_promoted_roster(tmp_path: Path, monkeypatch) -> None:
    status = tmp_path / "proof-status"
    baseline = status / "baseline"
    baseline.mkdir(parents=True)
    (baseline / gor.BASE_HEAD_FILE).write_text("b" * 40 + "\n", encoding="utf-8")
    (status / gor.PRIVATE_EDGE_REACHABILITY_NAME).write_text(
        gor.dump_canonical(manifest()), encoding="utf-8"
    )
    spine = [record(consumer) for consumer in CONSUMERS]
    offspine = [record(leaf) for leaf in LEAVES]
    exports = lambda: (spine, offspine)
    assert gor.main(
        ["generate", "--baseline", str(baseline), "--out", str(status)],
        export_source=exports,
    ) == 0
    generated = json.loads((status / gor.REGISTRY_NAME).read_text(encoding="utf-8"))
    assert {
        row["lean_decl"] for row in generated["obligations"] if row["reachable"]
    } == set(CONSUMERS) | set(LEAVES)
    (status / gor.META_NAME).write_text(
        json.dumps(
            {
                row["id"]: {"prose_status": "OPEN_MATHEMATICAL"}
                for row in generated["obligations"]
            }
        ),
        encoding="utf-8",
    )
    monkeypatch.setattr(gor, "refs_check_state", dict)
    assert gor.main(
        [
            "check",
            "--baseline",
            str(baseline),
            "--registry",
            str(status / gor.REGISTRY_NAME),
            "--receipts-dir",
            str(status / "receipts"),
        ],
        export_source=exports,
    ) == 0


def spine_output(declarations: list[str], target: str = gor.PUBLISH_TARGET) -> str:
    lines = [
        *gor.SPINE_BANNER_LINES,
        "spine rooted at: " + target,
        "(this is a [publish] target_symbol — the claim being gated)",
        "approved axioms: core",
        "open: 1/99 node(s)",
        "spine source: 1 line(s) of lean across 1 decl(s)",
        "",
        "open obligations (" + str(len(declarations)) + "):",
    ]
    lines.extend("  💧 " + declaration + "  [sorry]" for declaration in declarations)
    lines.extend(
        [
            "  ❌ Total sorryAx == " + str(len(declarations)),
            "",
            "(open branches only — closed subtrees collapsed; --full for everything)",
            "└── " + target,
            "",
            "❌ NOT kernel-complete — spine of `" + target + "` has:",
            "  - reaches sorry via " + str(len(declarations)) + " symbol(s)",
            "  - unapproved axiom on spine: sorryAx (Total sorryAx == "
            + str(len(declarations))
            + ")",
            "",
            "off-spine sorries: none — all live work is wired into the spine",
            "",
            "unimported files (0 file(s), 0 symbol(s), 0 sorry — never reached by any lake import chain) — --full to list",
            "",
        ]
    )
    return "\n".join(lines)


def make_status_surfaces(tmp_path: Path):
    status = tmp_path / "proof-status"
    docs = tmp_path / "docs"
    status.mkdir()
    docs.mkdir()
    (status / gor.PRIVATE_EDGE_REACHABILITY_NAME).write_text(
        gor.dump_canonical(manifest()), encoding="utf-8"
    )
    registry, _ = gor.build_registry(
        [record(consumer) for consumer in CONSUMERS],
        [record(leaf) for leaf in LEAVES],
        "a" * 40,
        {"assigned": {}, "retired": {}, "aliases": {}},
        private_edge_overrides=manifest()["entries"],
    )
    (status / gor.REGISTRY_NAME).write_text(gor.dump_canonical(registry), encoding="utf-8")
    (status / gor.FRONTIER_TABLE_NAME).write_text(gor.frontier_table(registry), encoding="utf-8")
    output = spine_output(CONSUMERS)
    readme = tmp_path / "README.md"
    readme.write_text(gor.README_STATUS_BEGIN + "\nold\n" + gor.README_STATUS_END + "\n", encoding="utf-8")
    snapshot = docs / "live-blueprint.md"
    snapshot.write_text(output, encoding="utf-8")
    return registry, status / gor.REGISTRY_NAME, status / gor.FRONTIER_TABLE_NAME, readme, snapshot, output


def status_args(paths) -> list[str]:
    _registry, registry, table, readme, snapshot, _output = paths
    return [
        "status", "--check", "--registry", str(registry), "--frontier-table", str(table),
        "--readme", str(readme), "--live-blueprint", str(snapshot),
    ]


def test_status_accepts_exactly_the_reviewed_hidden_private_set(tmp_path: Path) -> None:
    paths = make_status_surfaces(tmp_path)
    runner = lambda command: subprocess.CompletedProcess(command, 1, paths[-1], "")
    assert gor.main(status_args(paths), spine_runner=runner) == 1  # stale README marker block
    paths[3].write_text(gor.readme_status_block(paths[0]), encoding="utf-8")
    assert gor.main(status_args(paths), spine_runner=runner) == 0


def test_status_rejects_visible_or_unregistered_override(tmp_path: Path) -> None:
    paths = make_status_surfaces(tmp_path)
    paths[3].write_text(gor.readme_status_block(paths[0]), encoding="utf-8")
    visible = spine_output(CONSUMERS + [LEAVES[0]])
    paths[4].write_text(visible, encoding="utf-8")
    runner = lambda command: subprocess.CompletedProcess(command, 1, visible, "")
    assert gor.main(status_args(paths), spine_runner=runner) == 1
    broken = json.loads(paths[1].read_text(encoding="utf-8"))
    for row in broken["obligations"]:
        if row["lean_decl"] == LEAVES[0]:
            row["reachable"] = False
    paths[1].write_text(gor.dump_canonical(broken), encoding="utf-8")
    paths[2].write_text(gor.frontier_table(broken), encoding="utf-8")
    assert gor.main(status_args(paths), spine_runner=lambda command: subprocess.CompletedProcess(command, 1, paths[-1], "")) == 1
