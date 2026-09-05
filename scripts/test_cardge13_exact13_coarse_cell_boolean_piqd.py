from __future__ import annotations

import hashlib
import json
from pathlib import Path

import cardge13_exact13_coarse_cell_boolean_piqd as subject
import cardge13_exact13_global_source_cell_csp_piqd as base
import pytest


def test_catalog_is_exact_deterministic_hundred_cell_split() -> None:
    cells = subject.catalog_cells()
    assert len(cells) == 100
    assert len(set(cells)) == 100
    assert sum(cell.orientation == "direct" for cell in cells) == 50
    assert sum(cell.orientation == "mirror" for cell in cells) == 50
    for orientation in subject.ORIENTATIONS:
        for z in sorted(base.I2):
            selected = [
                cell for cell in cells if cell.orientation == orientation and cell.z == z
            ]
            assert len(selected) == 10
            assert {len(cell.k_i2) for cell in selected} == {2, 3}
            assert all(cell.z not in cell.k_i2 for cell in selected)
            assert all(set(cell.k_i2) | set(cell.l_i2) == set(base.I2) for cell in selected)


@pytest.mark.parametrize(
    "args",
    (
        ("clockwise", 8, (9, 10)),
        ("direct", 7, (9, 10)),
        ("direct", 8, (9,)),
        ("direct", 8, (9, 9)),
        ("direct", 8, (8, 9)),
        ("direct", 8, (9, 13)),
    ),
)
def test_coarse_cell_rejects_malformed_signature(
    args: tuple[str, int, tuple[int, ...]],
) -> None:
    with pytest.raises(subject.CoarseCellError):
        subject.CoarseCell(*args)


def test_extra_commands_pin_partition_and_add_missing_overlap_bounds() -> None:
    cell = subject.CoarseCell("direct", 8, (9, 10))
    commands = subject.coarse_cell_commands(cell)
    assert commands[:11] == (
        "(assert is_z_8)",
        "(assert (not m_K_8))",
        "(assert m_L_8)",
        "(assert m_K_9)",
        "(assert (not m_L_9))",
        "(assert m_K_10)",
        "(assert (not m_L_10))",
        "(assert (not m_K_11))",
        "(assert m_L_11)",
        "(assert (not m_K_12))",
        "(assert m_L_12)",
    )
    assert len(commands) == 11 + 2 * 286
    assert commands[11].startswith("(assert (or (not m_C0_0) (not m_K_0)")
    assert commands[11 + 286].startswith("(assert (or (not m_C1_0) (not m_K_0)")


def test_build_commands_selects_orientation_and_appends_cell(monkeypatch) -> None:
    seen: list[tuple[int, ...]] = []

    def fake_build(order: tuple[int, ...]):
        seen.append(order)
        return ("(set-logic QF_UF)",), ({"atoms": ("x",)},)

    monkeypatch.setattr(subject.boolean_base, "build_commands", fake_build)
    cell = subject.CoarseCell("mirror", 12, (8, 9, 10))
    monkeypatch.setattr(subject.resume, "seed_cuts", lambda paths: ((), ()))
    commands, bank = subject.build_commands(cell)
    assert seen == [base.MIRROR_ORDER]
    assert commands[0] == "(set-logic QF_UF)"
    assert commands[1:] == subject.coarse_cell_commands(cell)
    assert bank == ({"atoms": ("x",)},)


def test_build_commands_appends_seed_cuts_after_cell_constraints(monkeypatch) -> None:
    monkeypatch.setattr(
        subject.boolean_base,
        "build_commands",
        lambda order: (("(set-logic QF_UF)",), ()),
    )
    cut = "(assert (or (not a) (not b)))"
    monkeypatch.setattr(subject.resume, "seed_cuts", lambda paths: ((cut,), ()))
    cell = subject.CoarseCell("direct", 8, (9, 10))
    commands, _bank = subject.build_commands(cell, (Path("seed.json"),))
    assert commands[-1] == cut
    assert commands[-2] != cut


def test_compact_solve_record_omits_full_models_and_receipt_array() -> None:
    record = {
        "solver": "z3",
        "created": {"id": "session"},
        "assertions": [{"commands": 3}],
        "iterations": [
            {
                "index": 0,
                "solved": {
                    "status": "SAT",
                    "solve_index": 1,
                    "model": "large model",
                    "result_sha256": "a" * 64,
                    "model_replay": {"outcome": "SATISFIED"},
                },
                "cut": "(assert (or (not a) (not b)))",
            }
        ],
        "cegar_status": "REFINEMENT_BUDGET",
        "solved": {"status": "SAT", "model": "large model"},
        "receipts": {
            "count": 1,
            "session_id": "session",
            "receipts": [{"model": "large model"}],
        },
        "closed": {"closed": True},
    }
    compact = subject.compact_solve_record(record)
    assert "model" not in compact["solved"]
    assert "model" not in compact["iterations"][0]["solved"]
    assert "receipts" not in compact["receipts"]
    assert compact["iterations"][0]["cut"].startswith("(assert (or")


def test_catalog_payload_is_self_hashed_and_explicitly_nonpromotable() -> None:
    payload = subject.catalog_payload("a" * 64)
    expected = payload.pop("catalog_sha256")
    assert expected == subject.sha256_bytes(subject.canonical_json_bytes(payload))
    assert payload["cell_count"] == 100
    assert payload["claim_scope"]["source_coverage"] is False
    assert payload["claim_scope"]["theorem_promotion"] is False


def test_load_run_manifest_authenticates_sources(tmp_path: Path, monkeypatch) -> None:
    repo = tmp_path / "repo"
    repo.mkdir()
    digests: dict[str, str] = {}
    for relative in subject.DEPENDENCY_PATHS:
        path = repo / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        payload = relative.encode("ascii")
        path.write_bytes(payload)
        digests[relative] = hashlib.sha256(payload).hexdigest()
    manifest: dict[str, object] = {
        "schema": "worktree-run-manifest/v1",
        "root": "scratch/runs/lane/run-0001",
        "source_digests": digests,
    }
    unsigned = json.dumps(
        manifest, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("ascii")
    manifest["manifest_sha256"] = hashlib.sha256(unsigned).hexdigest()
    manifest_path = repo / "manifest.json"
    manifest_path.write_text(json.dumps(manifest), encoding="ascii")

    loaded, digest, run_root = subject.load_run_manifest(
        repo, Path("manifest.json")
    )
    assert loaded == manifest
    assert digest == manifest["manifest_sha256"]
    assert run_root == (repo / "scratch/runs/lane/run-0001").resolve()

    (repo / subject.DEPENDENCY_PATHS[0]).write_bytes(b"drift")
    with pytest.raises(subject.CoarseCellError, match="does not anchor"):
        subject.load_run_manifest(repo, Path("manifest.json"))


def test_require_under_run_root_rejects_root_and_escape(tmp_path: Path) -> None:
    run_root = tmp_path / "run"
    run_root.mkdir()
    assert subject.require_under_run_root(
        run_root / "artifacts/catalog.json", run_root, "catalog"
    ) == (run_root / "artifacts/catalog.json").resolve()
    with pytest.raises(subject.CoarseCellError, match="outside"):
        subject.require_under_run_root(run_root, run_root, "catalog")
    with pytest.raises(subject.CoarseCellError, match="outside"):
        subject.require_under_run_root(tmp_path / "elsewhere.json", run_root, "catalog")
