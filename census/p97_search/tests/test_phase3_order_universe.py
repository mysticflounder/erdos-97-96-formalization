from __future__ import annotations

import importlib
import itertools
import json
from collections.abc import Callable
from pathlib import Path
from typing import Any

import pytest

order_universe = importlib.import_module(
    "census.p97_search.phase3_order_universe"
)
v3 = importlib.import_module(
    "census.p97_search.phase3_structural_cegar_projected_static_v3"
)

CONVEX_FIVE_SURVIVORS = (
    v3.ROOT
    / "scratch/p97-distinct-distance-lane"
    / "phase3_structural_cegar_algebraic_100000_20260729/survivors.jsonl"
)
CONVEX_FIVE_ROWS_SHA256 = (
    "a582e5a9556d8c665bb4025fa32227a5d9484cd32acf9c06adef673df5afa3c2"
)


def _retained_fact_subsets() -> tuple[tuple[tuple[int, int], ...], ...]:
    subsets: set[tuple[tuple[int, int], ...]] = set()
    for facts in v3._all_phase3_cap_annotations():
        for size in range(len(facts) + 1):
            subsets.update(itertools.combinations(facts, size))
    return tuple(sorted(subsets, key=lambda facts: (len(facts), facts)))


def _legacy_compatible_mask(
    retained: tuple[tuple[int, int], ...],
    annotations: tuple[tuple[tuple[int, int], ...], ...],
) -> int:
    retained_set = set(retained)
    annotation_block = (1 << order_universe.PHASE3_ORDERS_PER_ANNOTATION) - 1
    mask = 0
    for annotation_index, facts in enumerate(annotations):
        if retained_set.issubset(facts):
            mask |= annotation_block << (
                annotation_index * order_universe.PHASE3_ORDERS_PER_ANNOTATION
            )
    return mask


def test_universe_exactly_matches_legacy_annotation_and_order_traversal() -> None:
    universe = order_universe.phase3_order_universe()
    legacy_annotations = v3._all_phase3_cap_annotations()

    assert universe.annotations == legacy_annotations
    assert len(universe.annotations) == 630
    assert len(universe.orders) == 15_120
    assert universe.all_orders_mask.bit_count() == 15_120
    assert tuple(record.index for record in universe.orders) == tuple(range(15_120))
    seen = 0
    for annotation_mask in universe.annotation_order_masks:
        assert annotation_mask.bit_count() == 24
        assert seen & annotation_mask == 0
        seen |= annotation_mask
    assert seen == universe.all_orders_mask
    for annotation_index, facts in enumerate(legacy_annotations):
        expected = v3._cap_orders_from_facts(facts)
        records = universe.orders[
            annotation_index * 24 : (annotation_index + 1) * 24
        ]
        assert tuple((record.order_id, record.order) for record in records) == expected
        assert all(record.annotation_index == annotation_index for record in records)
        for record in records:
            assert tuple(
                record.order[record.forward_position[label]] for label in range(10)
            ) == tuple(range(10))
            reverse = tuple(reversed(record.order))
            assert tuple(
                reverse[record.reverse_position[label]] for label in range(10)
            ) == tuple(range(10))
    for label in order_universe.PHASE3_CAP_LABELS:
        for cap in order_universe.PHASE3_CAPS:
            expected = 0
            for annotation_index, facts in enumerate(legacy_annotations):
                if (label, cap) in facts:
                    expected |= universe.annotation_order_masks[annotation_index]
            fact_index = universe.fact_index((label, cap))
            assert universe.fact_order_masks[fact_index] == expected


def test_every_compatible_partial_fact_mask_matches_legacy_enumeration() -> None:
    universe = order_universe.phase3_order_universe()
    annotations = v3._all_phase3_cap_annotations()
    retained_subsets = _retained_fact_subsets()

    expected_masks = {
        retained: _legacy_compatible_mask(retained, annotations)
        for retained in retained_subsets
    }
    candidate_count = 0
    for source in annotations:
        for size in range(len(source) + 1):
            for retained in itertools.combinations(source, size):
                actual = universe.compatible_order_mask(retained)
                assert actual == expected_masks[retained]
                assert actual.bit_count() % 24 == 0
                candidate_count += 1

    assert candidate_count == 630 * 128
    assert universe.compatible_order_mask(((3, 0), (3, 1))) == 0


def test_exhaustive_boolean_coverage_predicate_matches_explicit_masks() -> None:
    universe = order_universe.phase3_order_universe()
    annotations = v3._all_phase3_cap_annotations()
    covered_masks = (
        0,
        universe.all_orders_mask,
        sum(1 << record.index for record in universe.orders if record.index % 7),
        sum(
            universe.annotation_order_masks[index]
            for index, facts in enumerate(annotations)
            if (3, 0) in facts
        ),
    )

    for retained in _retained_fact_subsets():
        compatible = _legacy_compatible_mask(retained, annotations)
        for covered in covered_masks:
            expected = compatible != 0 and (compatible & ~covered) == 0
            sound, annotation_count, order_count = (
                universe.compatible_orders_are_covered(retained, covered)
            )
            assert sound is expected
            assert order_count == compatible.bit_count()
            assert annotation_count * 24 == order_count


def test_compiled_cyclic_subsequence_masks_match_legacy_predicate() -> None:
    universe = order_universe.phase3_order_universe()
    role_cases = (
        (),
        (0,),
        (0, 1, 2, 3, 4),
        (4, 1, 8, 2, 9),
        (9, 8, 7, 6, 5),
        (0, 0),
        (-1, 2),
        (0, 10),
    )
    for roles in role_cases:
        for reverse in (False, True):
            expected = universe.covered_order_mask(
                lambda record, roles=roles, reverse=reverse: v3._cyclic_subsequence(
                    tuple(reversed(record.order)) if reverse else record.order,
                    roles,
                )
            )
            assert (
                order_universe.cyclic_subsequence_order_mask(
                    roles, reverse=reverse
                )
                == expected
            )


def _feature_result(
    monkeypatch: pytest.MonkeyPatch,
    enabled: bool,
    function: Callable[[], Any],
) -> Any:
    monkeypatch.setattr(v3, "_PHASE3_ORDER_BITSETS_ENABLED", enabled)
    return function()


def test_cap_coverage_and_minimization_are_identical_with_bitsets(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    facts = v3._all_phase3_cap_annotations()[0]
    descriptors = ({"proof_sha256": "p", "core": {"only": 0}},)

    def coverage() -> Any:
        return v3._compatible_cap_coverage(
            (), descriptors, core_roles=("only",)
        )

    legacy_coverage = _feature_result(monkeypatch, False, coverage)
    bitset_coverage = _feature_result(monkeypatch, True, coverage)
    assert bitset_coverage == legacy_coverage

    def minimize() -> Any:
        return v3._minimize_cap_facts(
            facts, descriptors, core_roles=("only",)
        )

    legacy_minimum = _feature_result(monkeypatch, False, minimize)
    bitset_minimum = _feature_result(monkeypatch, True, minimize)
    assert bitset_minimum == legacy_minimum

    contradictory = ((3, 0), (3, 1))
    for enabled in (False, True):
        monkeypatch.setattr(v3, "_PHASE3_ORDER_BITSETS_ENABLED", enabled)
        with pytest.raises(
            v3.StructuralCegarError,
            match="retained cap facts have no compatible annotation",
        ):
            v3._compatible_cap_coverage(
                contradictory, descriptors, core_roles=("only",)
            )


def _convex_five_assignment() -> dict[int, bool]:
    encoding = v3._phase3_encoding(projected_static_v3=False)
    with CONVEX_FIVE_SURVIVORS.open(encoding="utf-8") as handle:
        for line in handle:
            candidate = json.loads(line)
            if candidate.get("metric_rows_sha256") == CONVEX_FIVE_ROWS_SHA256:
                record = candidate
                break
        else:
            raise AssertionError("fixed convex-five assignment is absent")
    assignment = encoding.assignment_from_record(record)
    obj = encoding.decode(assignment)
    encoding.validate(obj, assignment)
    assert v3._combined_detection(encoding, v3._metric_rows(obj)) is None
    return assignment


def _directory_snapshot(root: Path) -> dict[str, tuple[str, bytes | None]]:
    snapshot: dict[str, tuple[str, bytes | None]] = {}
    for path in sorted(root.rglob("*")):
        relative = path.relative_to(root).as_posix()
        if path.is_dir():
            snapshot[relative] = ("directory", None)
        elif path.is_file():
            snapshot[relative] = ("file", path.read_bytes())
        else:
            raise AssertionError(f"unexpected artifact kind: {path}")
    return snapshot


def _run_cap_order_transcript(
    out: Path,
    assignment: dict[int, bool],
) -> dict[str, Any]:
    calls = 0

    def solver(_cnf: Path, _timeout: int, proof: Path | None) -> Any:
        nonlocal calls
        calls += 1
        if calls == 1:
            assert proof is None
            return v3.sat.SolverResult(
                "SAT", assignment, 10, "s SATISFIABLE\n", ""
            )
        if calls == 2:
            assert proof is None
            return v3.sat.SolverResult(
                "UNSAT", {}, 20, "s UNSATISFIABLE\n", ""
            )
        assert calls == 3
        assert proof is not None
        proof.write_bytes(b"0\n")
        return v3.sat.SolverResult("UNSAT", {}, 20, "s UNSATISFIABLE\n", "")

    result = v3.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=False,
        solver_runner=solver,
        checker_runner=lambda *_args: v3.sat.CheckerResult(
            True, 0, "s VERIFIED\n", ""
        ),
    )
    assert calls == 3
    assert result["terminal_drat_verified"] is True
    learned = v3._strict_json_lines(out / "learned-certificates.jsonl")
    assert len(learned) == 1
    assert learned[0]["stage"] == v3.CAP_ORDER_STAGE
    return result


def test_complete_cap_order_run_tree_is_identical_with_bitsets(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
) -> None:
    assignment = _convex_five_assignment()

    monkeypatch.setattr(v3, "_PHASE3_ORDER_BITSETS_ENABLED", False)
    legacy_out = tmp_path / "legacy"
    legacy_result = _run_cap_order_transcript(legacy_out, assignment)

    monkeypatch.setattr(v3, "_PHASE3_ORDER_BITSETS_ENABLED", True)
    bitset_out = tmp_path / "bitset"
    bitset_result = _run_cap_order_transcript(bitset_out, assignment)

    assert bitset_result == legacy_result
    assert _directory_snapshot(bitset_out) == _directory_snapshot(legacy_out)

    certificate = v3._strict_json_lines(legacy_out / "learned-certificates.jsonl")[
        0
    ]["certificate"]
    source_facts = tuple(
        tuple(fact) for fact in certificate["cap_annotation"]["f"]
    )
    descriptors = v3._cap_order_descriptors(
        certificate["closure_certificates"],
        ("a", "x", "b", "c", "y"),
    )
    bitset_covered = v3._cap_order_covered_mask(descriptors)
    legacy_covered = 0
    order_index = 0
    for facts in v3._all_phase3_cap_annotations():
        for _order_id, order in v3._cap_orders_from_facts(facts):
            if any(
                v3._cyclic_subsequence(order, roles)
                or v3._cyclic_subsequence(tuple(reversed(order)), roles)
                for _proof_sha256, roles in descriptors
            ):
                legacy_covered |= 1 << order_index
            order_index += 1
    assert bitset_covered == legacy_covered

    universe = order_universe.phase3_order_universe()
    for size in range(len(source_facts) + 1):
        for retained in itertools.combinations(source_facts, size):
            compatible = _legacy_compatible_mask(retained, universe.annotations)
            expected = compatible != 0 and (compatible & ~legacy_covered) == 0
            sound, _annotation_count, _order_count = (
                universe.compatible_orders_are_covered(retained, bitset_covered)
            )
            assert sound is expected
