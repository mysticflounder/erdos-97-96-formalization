from __future__ import annotations

import importlib
import importlib.util
import itertools
import json
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[3]
HERE = ROOT / "census/p97_search"
for directory in (ROOT, HERE):
    if str(directory) not in sys.path:
        sys.path.insert(0, str(directory))

sat = importlib.import_module("census.p97_search.sat_generate")
cegar = importlib.import_module("census.p97_search.phase3_structural_cegar")
cells = importlib.import_module("cells")


def _clauses_hold(
    encoding: sat.SatEncoding, assignment: dict[int, bool]
) -> bool:
    return all(
        any(
            assignment[abs(literal)] if literal > 0 else not assignment[abs(literal)]
            for literal in clause
        )
        for clause in encoding.clauses
    )


def _row_one_assignment(
    encoding: sat.SatEncoding, targets: tuple[int, ...]
) -> dict[int, bool]:
    return {
        variable: (
            key[0] == "s" and targets[int(key[1])] == int(key[2])
        )
        for variable, key in encoding.key_for.items()
    }


def _unknown_solver(
    _cnf: Path, _timeout: int, _proof: Path | None
) -> sat.SolverResult:
    return sat.SolverResult("UNKNOWN", {}, 0, "", "bounded test")


def _write_unknown_manifest(
    run_dir: Path, *, static_dual2: bool = False
) -> dict[str, object]:
    return sat.enumerate_cell(
        cells.Cell(k=1, n=3, profile=None, exact=True),
        run_dir,
        static_dual2=static_dual2,
        timeout_s=1,
        solver_runner=_unknown_solver,
    )


def _rewrite_manifest(run_dir: Path, manifest: dict[str, object]) -> None:
    (run_dir / "manifest.json").write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n"
    )


def test_projected_blocker_is_exact_on_exhaustive_tiny_cell() -> None:
    cell = cells.Cell(k=1, n=4, profile=None, exact=True)
    legacy = sat.SatEncoding(cell, blocker=True)
    projected = sat.SatEncoding(cell, blocker=True, project_blockers=True)
    legacy_projected_models: set[tuple[int, ...]] = set()
    projected_models: set[tuple[int, ...]] = set()

    choices = tuple(
        tuple(q for q in range(cell.n) if q != p) for p in range(cell.n)
    )
    for targets in itertools.product(*choices):
        incoming = tuple(
            tuple(p for p, target in enumerate(targets) if target == x)
            for x in range(cell.n)
        )
        # Existentially quantifying the legacy one-hot b[x,*] rows is exactly
        # positive shell indegree at every x.
        if all(incoming):
            legacy_projected_models.add(targets)
        assignment = _row_one_assignment(projected, targets)
        if _clauses_hold(projected, assignment):
            projected_models.add(targets)
            decoded = projected.decode(assignment)
            assert decoded.blocker is not None
            assert decoded.blocker.c == tuple(min(row) for row in incoming)

    assert projected_models == legacy_projected_models
    assert len(projected_models) == 9
    assert legacy.clause_counts["B-TOTAL"] == 16
    assert legacy.clause_counts["B-MEM"] == 12
    assert projected.clause_counts["B-INDEG"] == 4


def test_legacy_manifest_replay_accepts_missing_known_zero_clause_tags(
    tmp_path: Path,
) -> None:
    manifest = _write_unknown_manifest(tmp_path)
    manifest.pop("encoding_configuration")
    manifest.pop("semantic_assignment_schema")
    clause_tags = manifest["clause_tags"]
    assert isinstance(clause_tags, dict)
    for tag in ("B-INDEG", "DUAL2", "S-MINCUT"):
        assert clause_tags.pop(tag) == 0
    _rewrite_manifest(tmp_path, manifest)

    verified = sat.verify_run_artifacts(tmp_path)

    assert verified["clause_tags"] == clause_tags


def test_legacy_manifest_replay_rejects_unknown_clause_tag(
    tmp_path: Path,
) -> None:
    manifest = _write_unknown_manifest(tmp_path)
    clause_tags = manifest["clause_tags"]
    assert isinstance(clause_tags, dict)
    clause_tags["NOT-A-CLAUSE-TAG"] = 0
    _rewrite_manifest(tmp_path, manifest)

    with pytest.raises(sat.Phase3Error, match="manifest clause_tags mismatch"):
        sat.verify_run_artifacts(tmp_path)


def test_legacy_manifest_replay_rejects_nonzero_new_clause_tag(
    tmp_path: Path,
) -> None:
    manifest = _write_unknown_manifest(tmp_path)
    clause_tags = manifest["clause_tags"]
    assert isinstance(clause_tags, dict)
    clause_tags["B-INDEG"] = 1
    _rewrite_manifest(tmp_path, manifest)

    with pytest.raises(sat.Phase3Error, match="manifest clause_tags mismatch"):
        sat.verify_run_artifacts(tmp_path)


def test_projected_manifest_replay_requires_zero_clause_tags_to_be_present(
    tmp_path: Path,
) -> None:
    manifest = _write_unknown_manifest(tmp_path, static_dual2=True)
    clause_tags = manifest["clause_tags"]
    assert isinstance(clause_tags, dict)
    assert clause_tags.pop("B-INDEG") == 0
    _rewrite_manifest(tmp_path, manifest)

    with pytest.raises(sat.Phase3Error, match="manifest clause_tags mismatch"):
        sat.verify_run_artifacts(tmp_path)


def test_live_projected_static_clause_counts_and_versioned_configuration() -> None:
    encoding = sat.SatEncoding(
        cegar.CELL,
        blocker=True,
        cap=True,
        project_blockers=True,
        static_dual2=True,
        mincut_scope=sat.MINCUT_SCOPE_CARD_GE_TEN,
    )
    assert encoding.clause_counts["B-INDEG"] == 10
    assert encoding.clause_counts["DUAL2"] == 2520
    assert encoding.clause_counts["S-MINCUT"] == 1022
    assert len(encoding.clauses) == 8624
    assert encoding.num_vars == 114
    assert len(encoding.semantic_vars) == 111
    assert encoding.configuration() == {
        "spec_version": sat.PROJECTED_STATIC_SPEC_VERSION,
        "semantic_assignment_schema": sat.SEMANTIC_SCHEMA_PROJECTED,
        "project_blockers": True,
        "static_dual2": True,
        "mincut_scope": sat.MINCUT_SCOPE_CARD_GE_TEN,
    }


@pytest.mark.parametrize(("k", "n"), ((1, 10), (4, 9)))
def test_counterexample_card_ge_ten_mincut_scope_is_exact_k4_n10(
    k: int, n: int
) -> None:
    with pytest.raises(
        sat.Phase3Error,
        match="counterexample_card_ge_ten admits S-MINCUT only at k=4, n=10",
    ):
        sat.SatEncoding(
            cells.Cell(k=k, n=n, profile=None, exact=True),
            mincut_scope=sat.MINCUT_SCOPE_CARD_GE_TEN,
        )


def test_minimal_source_mincut_scope_remains_generic() -> None:
    generic = sat.SatEncoding(
        cells.Cell(k=1, n=4, profile=None, exact=True),
        mincut_scope=sat.MINCUT_SCOPE_MINIMAL_SOURCE,
    )
    assert generic.clause_counts["S-MINCUT"] == 14


def test_dual2_positive_control_clause_is_rejected() -> None:
    encoding = sat.SatEncoding(
        cells.Cell(k=2, n=5, profile=None, exact=True),
        static_dual2=True,
    )
    assignment = {variable: False for variable in encoding.key_for}
    for center in (2, 3, 4):
        assignment[encoding.var("s", center, 0)] = True
        assignment[encoding.var("s", center, 1)] = True
    witness_clause = tuple(
        -encoding.var("s", center, target)
        for center in (2, 3, 4)
        for target in (0, 1)
    )
    assert witness_clause in encoding.clauses
    assert not any(
        assignment[abs(literal)] if literal > 0 else not assignment[abs(literal)]
        for literal in witness_clause
    )


def test_disconnected_cut_is_rejected_but_base_constraints_spare_it() -> None:
    cell = cells.Cell(k=1, n=4, profile=None, exact=True)
    base = sat.SatEncoding(cell)
    cut_assignment = _row_one_assignment(base, (1, 0, 3, 2))
    assert _clauses_hold(base, cut_assignment)

    mincut = sat.SatEncoding(
        cell,
        mincut_scope=sat.MINCUT_SCOPE_MINIMAL_SOURCE,
    )
    cut_assignment = _row_one_assignment(mincut, (1, 0, 3, 2))
    assert not _clauses_hold(mincut, cut_assignment)
    with pytest.raises(sat.Phase3Error, match="violates S-MINCUT"):
        mincut.decode(cut_assignment)


def test_saved_survivor_decodes_under_independent_static_validation() -> None:
    source = (
        ROOT
        / "scratch/p97-distinct-distance-lane"
        / "phase3_structural_cegar_projected_sequential_global_v2_20260729"
        / "survivors.jsonl"
    )
    record = json.loads(source.read_text().splitlines()[0])
    semantic = record["semantic_assignment"]
    encoding = sat.SatEncoding(
        cegar.CELL,
        blocker=True,
        cap=True,
        project_blockers=True,
        static_dual2=True,
        mincut_scope=sat.MINCUT_SCOPE_CARD_GE_TEN,
    )
    assignment = encoding.assignment_from_record(
        {
            "semantic_assignment": {
                name: value
                for name, value in semantic.items()
                if not name.startswith("b[")
            }
        }
    )
    decoded = encoding.decode(assignment)
    assert decoded.blocker is not None
    for x, d in enumerate(decoded.blocker.c):
        assert d == min(p for p in range(10) if x in decoded.node.shell(p))


def test_current_survivor_checkpoint_projects_to_audited_multiplicities() -> None:
    source = (
        ROOT
        / "scratch/p97-distinct-distance-lane"
        / "phase3_structural_cegar_projected_sequential_global_v2_20260729"
        / "survivors.jsonl"
    )
    helper_path = (
        ROOT
        / "scratch/p97-distinct-distance-lane"
        / "materialize_phase3_projected_assignments_v2.py"
    )
    spec = importlib.util.spec_from_file_location("phase3_projector_v2", helper_path)
    assert spec is not None and spec.loader is not None
    helper = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(helper)
    result = helper.materialize(source)
    assert result["source_record_count"] == 163
    assert result["projected_record_count"] == 3
    assert sorted(
        entry["source_multiplicity"] for entry in result["entries"]
    ) == [1, 28, 134]


def test_strongly_connected_tiny_control_is_spared() -> None:
    encoding = sat.SatEncoding(
        cells.Cell(k=1, n=4, profile=None, exact=True),
        mincut_scope=sat.MINCUT_SCOPE_MINIMAL_SOURCE,
    )
    assignment = _row_one_assignment(encoding, (1, 2, 3, 0))
    assert _clauses_hold(encoding, assignment)
    encoding.decode(assignment)


def test_projected_driver_rejects_legacy_learned_bank() -> None:
    with pytest.raises(
        cegar.StructuralCegarError,
        match="learned schema/mode mismatch",
    ):
        cegar.run_driver(
            ROOT / "scratch/p97-distinct-distance-lane/never-created",
            projected_static_v2=True,
            algebraic_bootstrap=None,
        )


def test_projected_manifest_binds_schema_configuration_and_base(
    tmp_path: Path,
) -> None:
    def unknown_runner(
        _cnf: Path, _timeout: int, _proof: Path | None
    ) -> sat.SolverResult:
        return sat.SolverResult("UNKNOWN", {}, 0, "", "bounded test")

    result = cegar.run_driver(
        tmp_path,
        timeout_s=1,
        projected_static_v2=True,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        solver_runner=unknown_runner,
    )
    assert result["status"] == "UNKNOWN"
    assert result["schema"] == cegar.PROJECTED_STATIC_SCHEMA
    assert result["configuration"]["learned_record_schema"] == (
        cegar.PROJECTED_LEARNED_SCHEMA
    )
    assert result["configuration"]["survivor_record_schema"] == (
        cegar.PROJECTED_SURVIVOR_SCHEMA
    )
    assert result["configuration"]["sat_encoding"]["mincut_scope"] == (
        sat.MINCUT_SCOPE_CARD_GE_TEN
    )
    header = (tmp_path / "base.cnf").read_text().splitlines()[:2]
    assert header == [
        "c phase3-v0.2-projected-static mode=cap+blocker-projected",
        "p cnf 114 8624",
    ]


def test_projected_cli_is_explicit_opt_in() -> None:
    legacy = cegar._parse_args([])
    projected = cegar._parse_args(["--projected-static-v2", "--no-bootstrap"])
    assert legacy.projected_static_v2 is False
    assert projected.projected_static_v2 is True
