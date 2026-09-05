# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Tests for the exact-13 verified-core provenance projection."""

from __future__ import annotations

import json
import os
from pathlib import Path
from typing import Any

import project_cardge13_verified_core_provenance as subject
import pytest


def write(path: Path, payload: bytes) -> None:
    """Write one fixture file below its repository root."""
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(payload)


def dump(value: object) -> bytes:
    """Encode canonical JSON with its required terminal newline."""
    return subject.canonical_json_bytes(value) + b"\n"


def artifact(root: Path, path: Path, payload: bytes) -> dict[str, object]:
    """Build one repository-relative artifact record."""
    return {
        "path": path.relative_to(root).as_posix(),
        "sha256": subject.sha256_bytes(payload),
        "byte_count": len(payload),
    }


def self_hash(value: dict[str, Any], field: str) -> None:
    """Refresh one canonical self-hash in place."""
    value.pop(field, None)
    value[field] = subject.sha256_bytes(subject.canonical_json_bytes(value))


def render_cnf(variable_count: int, clauses: list[list[int]], *, comment: str = "") -> bytes:
    """Render a small strict DIMACS fixture."""
    lines = [f"c {comment}"] if comment else []
    lines.append(f"p cnf {variable_count} {len(clauses)}")
    lines.extend(" ".join([*(str(item) for item in clause), "0"]) for clause in clauses)
    return ("\n".join(lines) + "\n").encode("ascii")


def make_fixture(root: Path) -> dict[str, Path]:
    """Create two authenticated full CNFs and one two-clause verified core."""
    clauses = [[1], [2, 3], [-1], [-2]]
    selected = [1, 3]
    v1 = root / "inputs" / "v1.cnf"
    v2 = root / "inputs" / "v2.cnf"
    provenance = root / "inputs" / "provenance.jsonl"
    conversion_manifest = root / "inputs" / "conversion.json"
    core_map = root / "inputs" / "core-map.jsonl"
    dense_core = root / "inputs" / "dense.cnf"
    dense_lrat = root / "inputs" / "dense.lrat"
    raw_lrat = root / "inputs" / "raw.lrat"
    bare_core = root / "inputs" / "bare-core.cnf"
    trace = root / "inputs" / "core.trace"
    core_receipt = root / "inputs" / "core-receipt.json"
    run_manifest = root / "inputs" / "run-manifest.json"
    write(v1, render_cnf(3, clauses, comment="legacy bytes differ"))
    write(v2, render_cnf(3, clauses, comment="v2 custody"))

    provenance_rows: list[dict[str, Any]] = []
    for original_id, clause in enumerate(clauses, 1):
        subtype = "source_command" if original_id < 3 else "seed_cut"
        origin: dict[str, Any] = {
            "family": (
                "base_combinatorial" if original_id < 3 else "dynamic_kalmanson_nogood"
            ),
            "subtype": subtype,
        }
        if subtype == "seed_cut":
            origin["linear_conflict_kind"] = "transitive-incidence-path"
        provenance_rows.append(
            {
                "schema": subject.PROVENANCE_SCHEMA,
                "original_clause_id": original_id,
                "assertion_ordinal": original_id - 1,
                "assertion": f"fixture-{original_id}",
                "assertion_sha256": subject.sha256_bytes(f"fixture-{original_id}".encode()),
                "journal_locator": None,
                "orientation": "direct",
                "order": [0, 1, 2],
                "literals": clause,
                "literal_body_sha256": subject.literal_body_sha256(tuple(clause)),
                "origin": origin,
            }
        )
    provenance_payload = b"".join(dump(row) for row in provenance_rows)
    write(provenance, provenance_payload)

    conversion: dict[str, Any] = {
        "schema": subject.CONVERSION_SCHEMA,
        "variables": [
            {"dimacs": index, "symbol": f"v{index}"} for index in range(1, 4)
        ],
        "dimacs": {
            **artifact(root, v2, v2.read_bytes()),
            "variable_count": 3,
            "clause_count": 4,
        },
        "clause_provenance": artifact(root, provenance, provenance_payload),
        "clause_family_counts": {
            "base_combinatorial": 2,
            "dynamic_kalmanson_nogood": 2,
        },
        "role_pins": {"b0": 1},
        "row_pins": {"C0": [1, 2]},
        "orientation": "direct",
        "order": [0, 1, 2],
    }
    self_hash(conversion, "manifest_sha256")
    write(conversion_manifest, dump(conversion))

    map_rows = []
    for dense_id, original_id in enumerate(selected, 1):
        clause = clauses[original_id - 1]
        map_rows.append(
            {
                "core_clause_id": dense_id,
                "original_clause_id": original_id,
                "literal_body_sha256": subject.literal_body_sha256(tuple(clause)),
            }
        )
    map_payload = b"".join(dump(row) for row in map_rows)
    dense_payload = render_cnf(3, [clauses[index - 1] for index in selected])
    dense_lrat_payload = b"3 0 1 2 0\n"
    raw_lrat_payload = b"4 d 3 4 0\n3 0 1 2 0\n"
    trace_payload = b"1 1 0 0\n2 -1 0 0\n"
    write(core_map, map_payload)
    write(dense_core, dense_payload)
    write(dense_lrat, dense_lrat_payload)
    write(raw_lrat, raw_lrat_payload)
    write(bare_core, dense_payload)
    write(trace, trace_payload)
    receipt: dict[str, Any] = {
        "schema": subject.CORE_SCHEMA,
        "generator": {"path": "fixture", "sha256": "0" * 64},
        "inputs": {
            "full_cnf": artifact(root, v1, v1.read_bytes()),
            "raw_lrat": artifact(root, raw_lrat, raw_lrat_payload),
            "core_cnf": artifact(root, bare_core, dense_payload),
            "trace": artifact(root, trace, trace_payload),
        },
        "outputs": {
            "core_clause_map": artifact(root, core_map, map_payload),
            "dense_core_cnf": artifact(root, dense_core, dense_payload),
            "dense_core_lrat": artifact(root, dense_lrat, dense_lrat_payload),
        },
        "base_clause_count": 4,
        "core_clause_count": 2,
        "initial_deleted_clause_count": 2,
        "core_original_ids_sha256": subject.sha256_bytes(
            subject.canonical_json_bytes(selected)
        ),
        "lrat": {"additions": 1},
        "dense_rup_replay": {"verified": True, "additions": 1, "deletions": 0},
    }
    self_hash(receipt, "receipt_sha256")
    write(core_receipt, dump(receipt))
    input_paths = (
        conversion_manifest,
        v2,
        provenance,
        core_receipt,
        core_map,
        dense_core,
        v1,
        raw_lrat,
        bare_core,
        trace,
        dense_lrat,
    )
    run_data: dict[str, Any] = {
        "schema": "worktree-run-manifest/v1",
        "input_digests": {
            path.relative_to(root).as_posix(): subject.sha256_bytes(path.read_bytes())
            for path in input_paths
        },
        "source_digests": {
            str(Path(subject.__file__).resolve()): subject.sha256_bytes(
                Path(subject.__file__).read_bytes()
            ),
            str(Path(subject.core.__file__).resolve()): subject.sha256_bytes(
                Path(subject.core.__file__).read_bytes()
            ),
        },
    }
    self_hash(run_data, "manifest_sha256")
    write(run_manifest, dump(run_data))
    (root / "output").mkdir()
    return {
        "root": root,
        "v1": v1,
        "v2": v2,
        "provenance": provenance,
        "conversion": conversion_manifest,
        "map": core_map,
        "dense": dense_core,
        "receipt": core_receipt,
        "run_manifest": run_manifest,
        "output": root / "output" / "projection",
    }


def run(paths: dict[str, Path]) -> dict[str, Any]:
    """Run the projector on one fixture."""
    return subject.project_core_provenance(
        repo_root=paths["root"],
        conversion_manifest_path=paths["conversion"],
        v2_cnf_path=paths["v2"],
        provenance_path=paths["provenance"],
        core_receipt_path=paths["receipt"],
        core_map_path=paths["map"],
        dense_core_cnf_path=paths["dense"],
        run_manifest_path=paths["run_manifest"],
        output_dir=paths["output"],
        expected_variable_count=3,
        expected_full_clause_count=4,
        expected_core_clause_count=2,
        expected_orientation="direct",
        expected_order=[0, 1, 2],
        expected_role_pins={"b0": 1},
        expected_row_pins={"C0": [1, 2]},
    )


def rewrite_conversion(paths: dict[str, Path], update: Any) -> None:
    """Update and reauthenticate a conversion manifest and its selected inputs."""
    conversion = json.loads(paths["conversion"].read_bytes())
    update(conversion)
    self_hash(conversion, "manifest_sha256")
    write(paths["conversion"], dump(conversion))


def rewrite_receipt(paths: dict[str, Path], update: Any) -> None:
    """Update and reauthenticate the core receipt."""
    receipt = json.loads(paths["receipt"].read_bytes())
    update(receipt)
    self_hash(receipt, "receipt_sha256")
    write(paths["receipt"], dump(receipt))


def refresh_run_manifest(paths: dict[str, Path]) -> None:
    """Refresh every synthetic input/source anchor after an intentional mutation."""
    manifest = json.loads(paths["run_manifest"].read_bytes())
    for relative in manifest["input_digests"]:
        manifest["input_digests"][relative] = subject.sha256_bytes(
            (paths["root"] / relative).read_bytes()
        )
    manifest["source_digests"] = {
        str(Path(subject.__file__).resolve()): subject.sha256_bytes(
            Path(subject.__file__).read_bytes()
        ),
        str(Path(subject.core.__file__).resolve()): subject.sha256_bytes(
            Path(subject.core.__file__).read_bytes()
        ),
    }
    self_hash(manifest, "manifest_sha256")
    write(paths["run_manifest"], dump(manifest))


def test_projects_verified_core_with_counts_and_diagnostic_scope(tmp_path: Path) -> None:
    """The joined package retains every selected provenance row and claim limit."""
    paths = make_fixture(tmp_path)
    receipt = run(paths)
    assert receipt["counts"]["core_clause_count"] == 2
    assert receipt["counts"]["core_families"] == {
        "base_combinatorial": 1,
        "dynamic_kalmanson_nogood": 1,
    }
    assert receipt["claim_scope"]["source_general"] is False
    assert receipt["claim_scope"]["theorem_promotion"] is False
    rows = [json.loads(line) for line in (paths["output"] / "core-provenance.jsonl").read_bytes().splitlines()]
    assert [row["original_clause_id"] for row in rows] == [1, 3]


def test_rejects_conversion_manifest_self_hash_drift(tmp_path: Path) -> None:
    """A changed conversion field cannot retain the old self-hash."""
    paths = make_fixture(tmp_path)
    conversion = json.loads(paths["conversion"].read_bytes())
    conversion["orientation"] = "mirror"
    write(paths["conversion"], dump(conversion))
    with pytest.raises(subject.ProjectionError, match="manifest_sha256 mismatch"):
        run(paths)


def test_rejects_core_receipt_self_hash_drift(tmp_path: Path) -> None:
    """A changed verified-core count cannot retain the old receipt hash."""
    paths = make_fixture(tmp_path)
    receipt = json.loads(paths["receipt"].read_bytes())
    receipt["core_clause_count"] = 3
    write(paths["receipt"], dump(receipt))
    with pytest.raises(subject.ProjectionError, match="receipt_sha256 mismatch"):
        run(paths)


def test_rejects_v1_v2_clause_sequence_drift(tmp_path: Path) -> None:
    """Reauthenticated v2 bytes must still match the reducer's full CNF order."""
    paths = make_fixture(tmp_path)
    payload = render_cnf(3, [[1], [3, 2], [-1], [-2]], comment="drift")
    write(paths["v2"], payload)

    def update(conversion: dict[str, Any]) -> None:
        conversion["dimacs"].update(artifact(paths["root"], paths["v2"], payload))

    rewrite_conversion(paths, update)
    with pytest.raises(subject.ProjectionError, match="clause sequences differ"):
        run(paths)


def test_rejects_provenance_literal_drift_after_reauthentication(tmp_path: Path) -> None:
    """A provenance row cannot name literals other than its original clause."""
    paths = make_fixture(tmp_path)
    rows = [json.loads(line) for line in paths["provenance"].read_bytes().splitlines()]
    rows[0]["literals"] = [2, 1]
    rows[0]["literal_body_sha256"] = subject.literal_body_sha256((2, 1))
    payload = b"".join(dump(row) for row in rows)
    write(paths["provenance"], payload)

    def update(conversion: dict[str, Any]) -> None:
        conversion["clause_provenance"] = artifact(
            paths["root"], paths["provenance"], payload
        )

    rewrite_conversion(paths, update)
    with pytest.raises(subject.ProjectionError, match="provenance literals differ"):
        run(paths)


def test_rejects_core_map_id_drift_after_reauthentication(tmp_path: Path) -> None:
    """The map's original IDs must remain increasing and clause-faithful."""
    paths = make_fixture(tmp_path)
    rows = [json.loads(line) for line in paths["map"].read_bytes().splitlines()]
    rows[1]["original_clause_id"] = 1
    rows[1]["literal_body_sha256"] = subject.literal_body_sha256((1,))
    payload = b"".join(dump(row) for row in rows)
    write(paths["map"], payload)

    def update(receipt: dict[str, Any]) -> None:
        receipt["outputs"]["core_clause_map"] = artifact(
            paths["root"], paths["map"], payload
        )

    rewrite_receipt(paths, update)
    with pytest.raises(subject.ProjectionError, match="original IDs are invalid"):
        run(paths)


def test_rejects_dense_core_clause_drift_after_reauthentication(tmp_path: Path) -> None:
    """Dense core clauses must be the selected original clauses in exact order."""
    paths = make_fixture(tmp_path)
    payload = render_cnf(3, [[1], [2, 3]])
    write(paths["dense"], payload)

    def update(receipt: dict[str, Any]) -> None:
        receipt["outputs"]["dense_core_cnf"] = artifact(
            paths["root"], paths["dense"], payload
        )

    rewrite_receipt(paths, update)
    with pytest.raises(subject.ProjectionError, match="dense core clause 2 differs"):
        run(paths)


def test_rejects_duplicate_json_key_in_provenance(tmp_path: Path) -> None:
    """Duplicate JSON keys fail before any clause projection occurs."""
    paths = make_fixture(tmp_path)
    lines = paths["provenance"].read_bytes().splitlines()
    lines[0] = lines[0][:-1] + b',"original_clause_id":1}'
    payload = b"\n".join(lines) + b"\n"
    write(paths["provenance"], payload)

    def update(conversion: dict[str, Any]) -> None:
        conversion["clause_provenance"] = artifact(
            paths["root"], paths["provenance"], payload
        )

    rewrite_conversion(paths, update)
    with pytest.raises(subject.ProjectionError, match="duplicate JSON key"):
        run(paths)


def test_refuses_output_directory_collision(tmp_path: Path) -> None:
    """A second publication cannot replace an existing package directory."""
    paths = make_fixture(tmp_path)
    run(paths)
    with pytest.raises(subject.ProjectionError, match="refusing to overwrite"):
        run(paths)


def test_rejects_input_change_before_atomic_publication(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    """A post-validation input mutation aborts publication and cleans staging."""
    paths = make_fixture(tmp_path)
    original = subject.assert_snapshots_unchanged

    def mutate_then_check(
        snapshots: dict[Path, bytes], repo_root: Path | None = None
    ) -> None:
        paths["map"].write_bytes(paths["map"].read_bytes() + b"\n")
        original(snapshots, repo_root)

    monkeypatch.setattr(subject, "assert_snapshots_unchanged", mutate_then_check)
    with pytest.raises(subject.ProjectionError, match="input changed during projection"):
        run(paths)
    assert not paths["output"].exists()
    assert not list(paths["output"].parent.glob(".projection.*.tmp"))


def test_rejects_manifest_artifact_path_drift(tmp_path: Path) -> None:
    """A valid digest cannot authorize a different artifact path."""
    paths = make_fixture(tmp_path)

    def update(conversion: dict[str, Any]) -> None:
        conversion["dimacs"]["path"] = "inputs/v1.cnf"

    rewrite_conversion(paths, update)
    with pytest.raises(subject.ProjectionError, match="recorded path differs"):
        run(paths)


def test_rejects_unverified_dense_rup_receipt(tmp_path: Path) -> None:
    """A core receipt without successful dense replay cannot be projected."""
    paths = make_fixture(tmp_path)

    def update(receipt: dict[str, Any]) -> None:
        receipt["dense_rup_replay"]["verified"] = False

    rewrite_receipt(paths, update)
    with pytest.raises(subject.ProjectionError, match="verified dense RUP replay"):
        run(paths)


def test_rejects_noncanonical_provenance_json(tmp_path: Path) -> None:
    """Whitespace-normalized JSONL cannot silently change custody bytes."""
    paths = make_fixture(tmp_path)
    rows = [json.loads(line) for line in paths["provenance"].read_bytes().splitlines()]
    payload = b"".join(json.dumps(row, sort_keys=True).encode() + b"\n" for row in rows)
    write(paths["provenance"], payload)

    def update(conversion: dict[str, Any]) -> None:
        conversion["clause_provenance"] = artifact(
            paths["root"], paths["provenance"], payload
        )

    rewrite_conversion(paths, update)
    with pytest.raises(subject.ProjectionError, match="not canonical JSON"):
        run(paths)


def test_rejects_symlink_input_before_resolution(tmp_path: Path) -> None:
    """An input symlink cannot be hidden by path normalization."""
    paths = make_fixture(tmp_path)
    target = paths["root"] / "inputs" / "provenance-target.jsonl"
    paths["provenance"].rename(target)
    paths["provenance"].symlink_to(target.name)
    with pytest.raises(subject.ProjectionError, match="cannot securely open"):
        run(paths)


def test_rejects_hardlinked_input(tmp_path: Path) -> None:
    """A multiply linked input does not have unique file custody."""
    paths = make_fixture(tmp_path)
    os.link(paths["map"], paths["root"] / "inputs" / "map-alias.jsonl")
    with pytest.raises(subject.ProjectionError, match="not a unique file"):
        run(paths)


def test_rejects_control_character_in_manifest_path(tmp_path: Path) -> None:
    """A NUL-bearing manifest path fails as a classified projection error."""
    paths = make_fixture(tmp_path)

    def update(conversion: dict[str, Any]) -> None:
        conversion["dimacs"]["path"] = "inputs/v2.cnf\u0000alias"

    rewrite_conversion(paths, update)
    with pytest.raises(subject.ProjectionError, match="control character"):
        run(paths)


def test_rolls_back_when_parent_fsync_fails(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    """A post-rename durability failure restores the unpublished staging state."""
    paths = make_fixture(tmp_path)

    def fail_parent_fsync(_descriptor: int) -> None:
        raise OSError("injected parent fsync failure")

    monkeypatch.setattr(subject, "fsync_parent", fail_parent_fsync)
    with pytest.raises(subject.ProjectionError, match="publication was rolled back"):
        run(paths)
    assert not paths["output"].exists()
    assert not list(paths["output"].parent.glob(".projection.*.tmp"))


def test_cleanup_failure_does_not_mask_projection_error(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    """Cleanup trouble is attached to, but does not replace, the custody failure."""
    paths = make_fixture(tmp_path)
    original_check = subject.assert_snapshots_unchanged

    def mutate_then_check(
        snapshots: dict[Path, bytes], repo_root: Path | None = None
    ) -> None:
        paths["map"].write_bytes(paths["map"].read_bytes() + b"\n")
        original_check(snapshots, repo_root)

    def fail_cleanup(_parent_fd: int, _name: str, _staging_fd: int) -> None:
        raise OSError("injected cleanup failure")

    monkeypatch.setattr(subject, "assert_snapshots_unchanged", mutate_then_check)
    monkeypatch.setattr(subject, "cleanup_staging", fail_cleanup)
    with pytest.raises(subject.ProjectionError, match="input changed") as caught:
        run(paths)
    assert any("cleanup also failed" in note for note in caught.value.__notes__)


def test_rejects_output_parent_swap_before_publication(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    """A renamed-and-symlinked output parent cannot redirect atomic publication."""
    paths = make_fixture(tmp_path)
    original_check = subject.assert_snapshots_unchanged
    original_parent = paths["output"].parent
    moved_parent = paths["root"] / "moved-output"
    replacement = paths["root"] / "replacement-output"
    replacement.mkdir()

    def swap_parent_then_check(
        snapshots: dict[Path, bytes], repo_root: Path | None = None
    ) -> None:
        original_parent.rename(moved_parent)
        original_parent.symlink_to(replacement.name)
        original_check(snapshots, repo_root)

    monkeypatch.setattr(subject, "assert_snapshots_unchanged", swap_parent_then_check)
    with pytest.raises(subject.ProjectionError, match="output parent directory"):
        run(paths)
    assert not (replacement / paths["output"].name).exists()
    assert not (moved_parent / paths["output"].name).exists()


def test_rejects_mutated_raw_lrat_parent_artifact(tmp_path: Path) -> None:
    """The projector authenticates the raw LRAT even though it emits no LRAT bytes."""
    paths = make_fixture(tmp_path)
    raw_lrat = paths["root"] / "inputs" / "raw.lrat"
    raw_lrat.write_bytes(raw_lrat.read_bytes() + b"1 d 1 0\n")
    with pytest.raises(subject.ProjectionError, match="raw_lrat SHA-256 mismatch"):
        run(paths)


def test_rejects_run_manifest_anchor_drift(tmp_path: Path) -> None:
    """Reauthenticated parent files still require the governed run-manifest pin."""
    paths = make_fixture(tmp_path)
    conversion = json.loads(paths["conversion"].read_bytes())
    conversion["extra_authenticated_note"] = "changed"
    self_hash(conversion, "manifest_sha256")
    write(paths["conversion"], dump(conversion))
    with pytest.raises(subject.ProjectionError, match="does not anchor conversion_manifest"):
        run(paths)


def test_rejects_reauthenticated_invalid_dense_lrat(tmp_path: Path) -> None:
    """The projector replays dense RUP rather than trusting a copied true flag."""
    paths = make_fixture(tmp_path)
    dense_lrat = paths["root"] / "inputs" / "dense.lrat"
    payload = b"3 0 1 0\n"
    write(dense_lrat, payload)

    def update(receipt: dict[str, Any]) -> None:
        receipt["outputs"]["dense_core_lrat"] = artifact(
            paths["root"], dense_lrat, payload
        )

    rewrite_receipt(paths, update)
    refresh_run_manifest(paths)
    with pytest.raises(subject.ProjectionError, match="independent dense RUP replay failed"):
        run(paths)


def test_rejects_boolean_provenance_clause_id(tmp_path: Path) -> None:
    """Python's true-equals-one rule cannot satisfy an integer schema field."""
    paths = make_fixture(tmp_path)
    rows = [json.loads(line) for line in paths["provenance"].read_bytes().splitlines()]
    rows[0]["original_clause_id"] = True
    payload = b"".join(dump(row) for row in rows)
    write(paths["provenance"], payload)

    def update(conversion: dict[str, Any]) -> None:
        conversion["clause_provenance"] = artifact(
            paths["root"], paths["provenance"], payload
        )

    rewrite_conversion(paths, update)
    refresh_run_manifest(paths)
    with pytest.raises(subject.ProjectionError, match="clause IDs are not dense"):
        run(paths)


def test_rejects_wrong_fixed_claim_orientation(tmp_path: Path) -> None:
    """A reauthenticated mirror fixture cannot pass a direct-cell claim contract."""
    paths = make_fixture(tmp_path)

    def update(conversion: dict[str, Any]) -> None:
        conversion["orientation"] = "mirror"

    rewrite_conversion(paths, update)
    refresh_run_manifest(paths)
    with pytest.raises(subject.ProjectionError, match="orientation differs"):
        run(paths)
