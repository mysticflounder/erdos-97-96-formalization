# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Adversarial tests for the generated status-authority gate.

Every command-level case uses temporary copies and an injected spine runner;
the suite never invokes the live blueprint database or writes a receipt.
"""

from __future__ import annotations

import importlib.util
import json
import subprocess
import sys
from pathlib import Path

import pytest

SCRIPT = Path(__file__).resolve().parent / "gen_obligation_registry.py"
_spec = importlib.util.spec_from_file_location("gen_obligation_registry_status", SCRIPT)
assert _spec is not None and _spec.loader is not None
gor = importlib.util.module_from_spec(_spec)
sys.modules[_spec.name] = gor
_spec.loader.exec_module(gor)

TARGET = gor.PUBLISH_TARGET
LEAF_A = "Fixture.Status.open_leaf_a"
LEAF_B = "Fixture.Status.open_leaf_b"
OFFSPINE = "Fixture.Status.off_spine_diagnostic"


def obligation(
    obligation_id: str,
    declaration: str,
    source_file: str,
    *,
    reachable: bool,
    status: str,
) -> dict:
    return {
        "id": obligation_id,
        "lean_decl": declaration,
        "reachable": reachable,
        "source_file": source_file,
        "line": 10,
        "cluster": gor.CLUSTER_LABELS[gor.CLUSTER_R221],
        "kind": "theorem",
        "legacy_labels": [],
        "meta_status": status,
        "terminal_family": "fixture",
        "mathematical_packet": None,
        "latest_checkpoint": None,
        "implementation_effect": "fixture only",
        "evidence_note": "synthetic",
    }


def registry() -> dict:
    return {
        "schema": gor.SCHEMA,
        "source_head": "a" * 40,
        "generated_by": gor.GENERATED_BY,
        "publish_target": TARGET,
        "meta_source": gor.META_NAME,
        "prose_status_vocabulary": list(gor.PROSE_STATUS_VOCABULARY),
        "obligations": [
            obligation(
                "FIXTURE-R221-A",
                LEAF_A,
                "Fixture/Rigid221Alpha.lean",
                reachable=True,
                status="OPEN_MATHEMATICAL",
            ),
            obligation(
                "FIXTURE-R221-B",
                LEAF_B,
                "Fixture/Rigid221Beta.lean",
                reachable=True,
                status="NORMAL_FORM_CLOSED_TERMINAL_OPEN",
            ),
            obligation(
                "FIXTURE-X-OFF",
                OFFSPINE,
                "Fixture/Rigid221Diagnostic.lean",
                reachable=False,
                status="OFF_SPINE_DIAGNOSTIC",
            ),
        ],
    }


def spine_output(
    declarations: list[str] | None = None,
    *,
    target: str = TARGET,
    node_total: int = 99,
) -> str:
    declarations = [LEAF_A, LEAF_B] if declarations is None else declarations
    count = len(declarations)
    lines = [
        *gor.SPINE_BANNER_LINES,
        "spine rooted at: " + target,
        "(this is a [publish] target_symbol — the claim being gated)",
        "approved axioms: core",
        "open: 17/" + str(node_total) + " node(s)",
        "trusted leaves: 2 🔒 (certs excluded from mine by [mining].skip; covered by `#print axioms`)",
        "spine source: 1234 line(s) of lean across " + str(node_total) + " decl(s)",
        "",
        "open obligations (" + str(count) + "):",
    ]
    lines.extend("  💧 " + declaration + "  [sorry]" for declaration in declarations)
    lines.extend(
        [
            "  ❌ Total sorryAx == " + str(count),
            "",
            "(open branches only — closed subtrees collapsed; --full for everything)",
            "└── " + target,
            "",
            "❌ NOT kernel-complete — spine of `" + target + "` has:",
            "  - reaches sorry via " + str(count) + " symbol(s)",
            "  - unapproved axiom on spine: sorryAx (Total sorryAx == "
            + str(count) + ")",
            "",
            "off-spine sorries: none — all live work is wired into the spine",
            "",
            "unimported files (0 file(s), 0 symbol(s), 0 sorry — never reached by any lake import chain) — --full to list",
            "",
        ]
    )
    return "\n".join(lines)


def completed(output: str, returncode: int = 1, stderr: str = ""):
    def runner(command: list[str]) -> subprocess.CompletedProcess[str]:
        return subprocess.CompletedProcess(command, returncode, output, stderr)

    return runner


def closed_spine_output() -> str:
    return "\n".join(
        [
            *gor.SPINE_BANNER_LINES,
            "spine rooted at: " + TARGET,
            "(this is a [publish] target_symbol — the claim being gated)",
            "approved axioms: core",
            "open: 0/99 node(s)",
            "spine source: 1234 line(s) of lean across 99 decl(s)",
            "",
            "(open branches only — closed subtrees collapsed; --full for everything)",
            "└── " + TARGET + "  [🟢]",
            "",
            "✅ kernel-complete: every branch of `" + TARGET
            + "` closes under the approved set",
            "",
            "off-spine sorries: none — all live work is wired into the spine",
            "",
            "unimported files (0 file(s), 0 symbol(s), 0 sorry — never reached by any lake import chain) — --full to list",
            "",
        ]
    )


def make_surfaces(tmp_path: Path, *, block: str | None = None, snapshot: str | None = None):
    data = registry()
    status_dir = tmp_path / "proof-status"
    docs_dir = tmp_path / "docs"
    status_dir.mkdir()
    docs_dir.mkdir()
    registry_path = status_dir / gor.REGISTRY_NAME
    table_path = status_dir / gor.FRONTIER_TABLE_NAME
    readme_path = tmp_path / "README.md"
    snapshot_path = docs_dir / "live-blueprint.md"
    registry_path.write_text(gor.dump_canonical(data), encoding="utf-8")
    table_path.write_text(gor.frontier_table(data), encoding="utf-8")
    rendered = gor.readme_status_block(data) if block is None else block
    readme_path.write_text("# Fixture\n\nBEFORE \t\n" + rendered + "AFTER  \n", encoding="utf-8")
    snapshot_path.write_text(snapshot or spine_output(), encoding="utf-8")
    return data, registry_path, table_path, readme_path, snapshot_path


def status_args(paths, mode: str = "--check") -> list[str]:
    _data, registry_path, table_path, readme_path, snapshot_path = paths
    return [
        "status",
        mode,
        "--registry",
        str(registry_path),
        "--frontier-table",
        str(table_path),
        "--readme",
        str(readme_path),
        "--live-blueprint",
        str(snapshot_path),
    ]


def all_bytes(root: Path) -> dict[Path, bytes]:
    return {path.relative_to(root): path.read_bytes() for path in root.rglob("*") if path.is_file()}


def test_status_check_is_strictly_read_only_and_uses_banner(tmp_path: Path) -> None:
    paths = make_surfaces(tmp_path)
    before = all_bytes(tmp_path)
    seen: list[list[str]] = []

    def runner(command: list[str]) -> subprocess.CompletedProcess[str]:
        seen.append(command)
        return subprocess.CompletedProcess(command, 1, spine_output(), "")

    assert gor.main(status_args(paths), spine_runner=runner) == 0
    assert seen == [[gor.BLUEPRINT_CMD, "spine", "--banner"]]
    assert all_bytes(tmp_path) == before
    assert not (tmp_path / "proof-status" / gor.RECEIPTS_DIRNAME).exists()


def test_status_rejects_frontier_table_drift_without_writing(tmp_path: Path) -> None:
    paths = make_surfaces(tmp_path)
    paths[2].write_text("drift\n", encoding="utf-8")
    before = all_bytes(tmp_path)
    assert gor.main(status_args(paths), spine_runner=completed(spine_output())) == 1
    assert all_bytes(tmp_path) == before


@pytest.mark.parametrize(
    ("surface_index", "expected"),
    [(1, 2), (2, 1), (4, 1)],
    ids=["registry", "frontier-table", "live-snapshot"],
)
def test_crlf_status_surfaces_are_rejected(
    tmp_path: Path, surface_index: int, expected: int
) -> None:
    paths = make_surfaces(tmp_path)
    path = paths[surface_index]
    path.write_bytes(path.read_bytes().replace(b"\n", b"\r\n"))
    assert gor.main(status_args(paths), spine_runner=completed(spine_output())) == expected


def test_check_rejects_stale_readme_block_without_writing(tmp_path: Path) -> None:
    stale = gor.README_STATUS_BEGIN + "\nstale\n" + gor.README_STATUS_END + "\n"
    paths = make_surfaces(tmp_path, block=stale)
    before = all_bytes(tmp_path)
    assert gor.main(status_args(paths), spine_runner=completed(spine_output())) == 1
    assert all_bytes(tmp_path) == before


@pytest.mark.parametrize(
    "block",
    [
        "no markers\n",
        gor.README_STATUS_BEGIN + "\nx\n" + gor.README_STATUS_BEGIN + "\ny\n"
        + gor.README_STATUS_END + "\n",
        "<!-- BEGIN GENERATED P97 OBLIGATION STATUS -- >\nx\n" + gor.README_STATUS_END + "\n",
        gor.README_STATUS_END + "\nx\n" + gor.README_STATUS_BEGIN + "\n",
    ],
    ids=["absent", "duplicate", "malformed", "reversed"],
)
def test_marker_faults_fail_closed(tmp_path: Path, block: str) -> None:
    paths = make_surfaces(tmp_path, block=block)
    before = all_bytes(tmp_path)
    assert gor.main(status_args(paths), spine_runner=completed(spine_output())) == 2
    assert all_bytes(tmp_path) == before


def test_sync_preserves_every_outside_byte_and_writes_only_readme(tmp_path: Path) -> None:
    stale = gor.README_STATUS_BEGIN + "\nstale\n" + gor.README_STATUS_END + "\n"
    paths = make_surfaces(tmp_path, block=stale)
    _data, _registry_path, _table_path, readme_path, _snapshot_path = paths
    before_files = all_bytes(tmp_path)
    before_text = readme_path.read_text(encoding="utf-8")
    prefix, _block, suffix = gor.readme_status_parts(before_text)

    assert gor.main(status_args(paths, "--sync"), spine_runner=completed(spine_output())) == 0
    after_text = readme_path.read_text(encoding="utf-8")
    after_prefix, after_block, after_suffix = gor.readme_status_parts(after_text)
    assert (after_prefix, after_suffix) == (prefix, suffix)
    assert after_block == gor.readme_status_block(paths[0])
    after_files = all_bytes(tmp_path)
    assert set(after_files) == set(before_files)
    for path, content in before_files.items():
        if path != Path("README.md"):
            assert after_files[path] == content


def test_sync_preserves_crlf_outside_prefix_and_suffix_byte_for_byte(tmp_path: Path) -> None:
    paths = make_surfaces(tmp_path)
    readme_path = paths[3]
    prefix = b"# Fixture\r\n\r\nBEFORE \t\r\n"
    stale = (gor.README_STATUS_BEGIN + "\nstale\n" + gor.README_STATUS_END + "\n").encode()
    suffix = b"AFTER  \r\n"
    readme_path.write_bytes(prefix + stale + suffix)

    assert gor.main(status_args(paths, "--sync"), spine_runner=completed(spine_output())) == 0
    synced = readme_path.read_bytes()
    assert synced.startswith(prefix)
    assert synced.endswith(suffix)
    assert synced == prefix + gor.readme_status_block(paths[0]).encode() + suffix


@pytest.mark.parametrize(
    ("output", "expected"),
    [
        (spine_output(target="Fixture.Wrong.target"), 1),
        (spine_output([LEAF_A]), 1),
        (spine_output([LEAF_A, "Fixture.Status.unknown"]), 1),
        (spine_output([LEAF_A, LEAF_A]), 2),
    ],
    ids=["wrong-target", "missing-and-wrong-count", "unknown-and-missing", "duplicate"],
)
def test_live_target_count_and_fqn_set_are_fail_closed(
    tmp_path: Path, output: str, expected: int
) -> None:
    paths = make_surfaces(tmp_path, snapshot=output)
    assert gor.main(status_args(paths), spine_runner=completed(output)) == expected


@pytest.mark.parametrize(
    "output",
    [
        spine_output().replace("open obligations (2):", "open obligations: 2"),
        spine_output().replace("  💧 " + LEAF_A, "  💧 Fixture.Bad-name"),
        spine_output().replace("  ❌ Total sorryAx == 2", "  ❌ Total sorryAx == 9"),
        spine_output().removesuffix("\n"),
    ],
    ids=["header", "malformed-fqn", "summary", "no-final-newline"],
)
def test_malformed_spine_output_is_rejected(tmp_path: Path, output: str) -> None:
    paths = make_surfaces(tmp_path, snapshot=spine_output())
    assert gor.main(status_args(paths), spine_runner=completed(output)) == 2


@pytest.mark.parametrize("summary", ["open: 100/99 node(s)", "open: 17/0 node(s)"])
def test_impossible_open_node_summary_is_rejected(tmp_path: Path, summary: str) -> None:
    output = spine_output().replace("open: 17/99 node(s)", summary)
    paths = make_surfaces(tmp_path, snapshot=output)
    assert gor.main(status_args(paths), spine_runner=completed(output)) == 2


def test_cli_exit_one_is_accepted_but_exit_zero_contradiction_is_not(tmp_path: Path) -> None:
    paths = make_surfaces(tmp_path)
    assert gor.main(status_args(paths), spine_runner=completed(spine_output(), 1)) == 0
    assert gor.main(status_args(paths), spine_runner=completed(spine_output(), 0)) == 2


def test_strict_parser_accepts_kernel_complete_exit_zero_grammar() -> None:
    parsed = gor.parse_spine_status(closed_spine_output())
    assert parsed["open_obligations"] == 0
    assert parsed["declarations"] == set()


def test_cli_failure_and_runner_exception_are_operational_errors(tmp_path: Path) -> None:
    paths = make_surfaces(tmp_path)
    assert gor.main(status_args(paths), spine_runner=completed("", 2, "database error")) == 2

    def raises(_command: list[str]):
        raise OSError("missing executable")

    assert gor.main(status_args(paths), spine_runner=raises) == 2


def test_spine_runner_unicode_decode_failure_is_an_operational_error(tmp_path: Path) -> None:
    paths = make_surfaces(tmp_path)

    def raises(_command: list[str]):
        raise UnicodeDecodeError("utf-8", b"\xff", 0, 1, "invalid start byte")

    assert gor.main(status_args(paths), spine_runner=raises) == 2


def test_nonempty_stderr_is_rejected_even_with_valid_exit_and_stdout(tmp_path: Path) -> None:
    paths = make_surfaces(tmp_path)
    runner = completed(spine_output(), 1, "unexpected warning\n")
    assert gor.main(status_args(paths), spine_runner=runner) == 2


def test_snapshot_drift_is_detected_even_when_live_roster_matches(tmp_path: Path) -> None:
    paths = make_surfaces(tmp_path, snapshot=spine_output(node_total=98))
    before = all_bytes(tmp_path)
    assert gor.main(status_args(paths), spine_runner=completed(spine_output())) == 1
    assert all_bytes(tmp_path) == before


def test_registry_json_format_drift_is_rejected(tmp_path: Path) -> None:
    paths = make_surfaces(tmp_path)
    paths[1].write_text(json.dumps(paths[0]), encoding="utf-8")
    assert gor.main(status_args(paths), spine_runner=completed(spine_output())) == 2


def test_sync_replace_failure_is_atomic_and_leaves_no_temp_file(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    stale = gor.README_STATUS_BEGIN + "\nstale\n" + gor.README_STATUS_END + "\n"
    paths = make_surfaces(tmp_path, block=stale)
    before = all_bytes(tmp_path)

    def fail_replace(_source, _target):
        raise OSError("injected replace failure")

    monkeypatch.setattr(gor.os, "replace", fail_replace)
    assert gor.main(status_args(paths, "--sync"), spine_runner=completed(spine_output())) == 2
    assert all_bytes(tmp_path) == before
    assert not list(tmp_path.glob(".README.md.*"))


def test_sync_mkstemp_permission_failure_leaves_readme_unchanged(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    stale = gor.README_STATUS_BEGIN + "\nstale\n" + gor.README_STATUS_END + "\n"
    paths = make_surfaces(tmp_path, block=stale)
    before = all_bytes(tmp_path)

    def fail_mkstemp(*_args, **_kwargs):
        raise PermissionError("injected mkstemp denial")

    monkeypatch.setattr(gor.tempfile, "mkstemp", fail_mkstemp)
    assert gor.main(status_args(paths, "--sync"), spine_runner=completed(spine_output())) == 2
    assert all_bytes(tmp_path) == before
    assert not list(tmp_path.glob(".README.md.*"))


def test_sync_refuses_snapshot_drift_before_touching_readme(tmp_path: Path) -> None:
    stale = gor.README_STATUS_BEGIN + "\nstale\n" + gor.README_STATUS_END + "\n"
    paths = make_surfaces(tmp_path, block=stale, snapshot=spine_output(node_total=98))
    before = all_bytes(tmp_path)
    assert gor.main(
        status_args(paths, "--sync"), spine_runner=completed(spine_output())
    ) == 1
    assert all_bytes(tmp_path) == before
