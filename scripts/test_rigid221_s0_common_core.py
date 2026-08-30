#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Tests for deterministic Rigid221 S0 custody and common-core extraction."""

from __future__ import annotations

import hashlib
import json
import sys
from collections import Counter
from pathlib import Path

import pytest
import z3

sys.path.insert(0, str(Path(__file__).resolve().parent))

import rigid221_s0_common_core as mod


def assert_rejected(code: str, action: object) -> None:
    with pytest.raises(mod.VerificationError) as caught:
        action()  # type: ignore[operator]
    assert caught.value.code == code


def test_source_cells_regenerate_exactly_without_solver_calls(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    def forbidden_check(*_args: object, **_kwargs: object) -> object:
        raise AssertionError("extractor invoked a solver")

    monkeypatch.setattr(z3.Solver, "check", forbidden_check)
    sources = mod.regenerate_source_cells()
    assert tuple(sources) == mod.CELL_ORDER
    for cell_id in mod.CELL_ORDER:
        source = sources[cell_id]
        assert len(source.occurrences) == 1365
        assert hashlib.sha256(source.smt2.encode()).hexdigest() == mod.SOURCE_CELL_SHA256[cell_id]
        assert source.smt2.startswith(source.header + "(assert")
        assert source.smt2.endswith("(check-sat)\n")


def test_source_hash_pin_rejects_generator_drift(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setitem(mod.SOURCE_CELL_SHA256, mod.CELL_ORDER[0], "0" * 64)
    assert_rejected("source_hash", mod.regenerate_source_cells)


def test_legacy_decisive_bytes_counts_and_known_selection_bugs() -> None:
    bundle = mod.build_bundle()
    surface = bundle.manifest["surfaces"]["legacy_decisive"]
    for cell_id, branch, filename in (
        (mod.CELL_ORDER[0], "S0-I", "s0_i_physical_min.smt2"),
        (mod.CELL_ORDER[1], "S0-N", "s0_n_physical_min.smt2"),
    ):
        content = bundle.files[filename]
        assert hashlib.sha256(content).hexdigest() == mod.LEGACY_DECISIVE_SHA256[cell_id]
        assert len(z3.parse_smt2_string(content.decode())) == mod.LEGACY_DECISIVE_COUNTS[cell_id]
        assert surface["cell_assertion_counts"][branch] == mod.LEGACY_DECISIVE_COUNTS[cell_id]

    assert surface["known_selection_bugs"]["S0-I"] == {
        "auxiliary_cap_offset_leaks": 9,
        "auxiliary_orientation_leaks": 126,
    }
    assert surface["known_selection_bugs"]["S0-N"] == {
        "auxiliary_cap_offset_leaks": 0,
        "auxiliary_orientation_leaks": 126,
    }


def test_retained_only_is_symmetric_and_has_no_auxiliary_roles() -> None:
    sources = mod.regenerate_source_cells()
    surface = mod.build_surfaces(sources)["retained_only"]
    for occurrences in (surface.i, surface.n):
        assert len(occurrences) == 82
        assert sum(item.semantic_group == "strict_convex_orientation" for item in occurrences) == 30
        assert sum(item.semantic_group == "cap_arm" for item in occurrences) == 15
        assert all(set(item.all_role_names) <= mod.RETAINED_ROLES for item in occurrences)
        assert all(not item.auxiliary_roles for item in occurrences)
        cap_subjects = {
            next(iter(set(item.all_role_names) - set(mod.full_l1.MOSER)))
            for item in occurrences
            if item.semantic_group == "cap_arm"
        }
        assert cap_subjects == mod.PHYSICAL_CAP_ROLES


def test_multiplicity_partition_preserves_occurrence_counts_and_order() -> None:
    partition = mod.multiplicity_partition(
        ["a", "a", "b", "c", "c", "c"],
        ["a", "b", "b", "c", "c", "d"],
    )
    assert partition.common_pairs == ((0, 0), (2, 1), (3, 3), (4, 4))
    assert partition.left_only == (1, 5)
    assert partition.right_only == (2, 5)


@pytest.mark.parametrize(
    ("surface_name", "common_count", "i_only_count", "n_only_count"),
    (
        ("legacy_decisive", 170, 47, 38),
        ("retained_only", 68, 14, 14),
    ),
)
def test_split_files_share_namespace_parse_and_reconstruct_multisets(
    surface_name: str,
    common_count: int,
    i_only_count: int,
    n_only_count: int,
) -> None:
    sources = mod.regenerate_source_cells()
    surface = mod.build_surfaces(sources)[surface_name]
    files = mod.SURFACE_FILES[surface_name]
    bundle = mod.build_bundle()
    decomposition = bundle.manifest["surfaces"][surface_name]["decomposition"]
    assert (
        decomposition["common_count"],
        decomposition["i_only_count"],
        decomposition["n_only_count"],
    ) == (common_count, i_only_count, n_only_count)

    common = bundle.files[files["common"]].decode()
    assert f"{mod.GENERIC_NAMESPACE}__" in common
    assert "m0_distinct_s0_i__" not in common
    assert "m0_distinct_s0_n__" not in common
    for side, suffix_name, expected in (
        ("I", files["i_only"], surface.i),
        ("N", files["n_only"], surface.n),
    ):
        combined = common + bundle.files[suffix_name].decode()
        assert combined.endswith("(check-sat)\n")
        parsed = z3.parse_smt2_string(combined)
        actual = Counter(mod._normalize_sexpr(item.sexpr()) for item in parsed)
        wanted = Counter(item.cell_alpha_sexpr for item in expected)
        assert actual == wanted, side


def test_occurrence_ledger_is_complete_and_occurrence_level() -> None:
    bundle = mod.build_bundle()
    rows = [
        json.loads(line)
        for line in bundle.files["assertion_ledger.jsonl"].decode().splitlines()
    ]
    assert len(rows) == 217 + 208 + 82 + 82
    required = {
        "all_role_names",
        "auxiliary_roles",
        "branch",
        "canonical_sexpr_sha256",
        "cell_alpha_sexpr_sha256",
        "cell_id",
        "dependency_flags",
        "duplicate_ordinal",
        "partition",
        "raw_assertion_sha256",
        "semantic_group",
        "source_assertion_index",
        "source_universal_status",
        "surface",
    }
    assert all(required <= row.keys() for row in rows)
    assert all(row["duplicate_ordinal"] >= 1 for row in rows)
    issues = Counter(issue for row in rows for issue in row["selection_issues"])
    assert issues == {
        "AUXILIARY_ORIENTATION_LEAK": 252,
        "AUXILIARY_CAP_OFFSET_LEAK": 9,
    }


def test_bundle_bytes_are_deterministic_and_checksums_are_sorted() -> None:
    first = mod.build_bundle()
    second = mod.build_bundle()
    assert first.files == second.files
    checksum_lines = first.files["SHA256SUMS"].decode().splitlines()
    checksum_names = [line.split("  ", 1)[1] for line in checksum_lines]
    assert checksum_names == sorted(name for name in first.files if name != "SHA256SUMS")
    for line in checksum_lines:
        digest, filename = line.split("  ", 1)
        assert hashlib.sha256(first.files[filename]).hexdigest() == digest


def test_generate_verify_and_mutation_rejection(tmp_path: Path) -> None:
    generated = mod.write_bundle(tmp_path)
    verified = mod.verify_bundle(tmp_path)
    assert generated.files == verified.files

    target = tmp_path / "common.smt2"
    target.write_bytes(target.read_bytes() + b"\n")
    assert_rejected("artifact_bytes", lambda: mod.verify_bundle(tmp_path))
    assert_rejected("existing_artifact_mismatch", lambda: mod.write_bundle(tmp_path))


def test_cli_is_sparse_by_default_and_verbose_on_request(
    tmp_path: Path, capsys: pytest.CaptureFixture[str]
) -> None:
    assert mod.main(["generate", "--output-dir", str(tmp_path)]) == 0
    sparse = capsys.readouterr()
    assert sparse.err == ""
    sparse_payload = json.loads(sparse.out)
    assert sparse_payload == {
        "action": "generate",
        "output_dir": str(tmp_path),
        "status": "VERIFIED",
    }

    assert mod.main(["verify", "--output-dir", str(tmp_path), "--verbose"]) == 0
    verbose = capsys.readouterr()
    assert verbose.err == ""
    payload = json.loads(verbose.out)
    assert payload["status"] == "VERIFIED"
    assert payload["legacy"] == {"S0-I": 217, "S0-N": 208}
    assert payload["retained"] == {"S0-I": 82, "S0-N": 82}
