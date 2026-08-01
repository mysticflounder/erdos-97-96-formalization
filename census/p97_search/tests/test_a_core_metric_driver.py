from __future__ import annotations

import copy
import json
from pathlib import Path

import pytest

from census.p97_search.a_core_metric_driver import (
    A_CORE_DIR,
    adapt_physical_cube,
    load_current_physical_cubes,
    run_current_physical_leaves,
)


@pytest.fixture(scope="module")
def a2_model() -> dict[str, bool]:
    cubes, _ = load_current_physical_cubes()
    return next(cube["model"] for cube in cubes if cube["run"] == "base+P+A2")


def test_real_a2_encodes_only_source_guaranteed_rows(
    a2_model: dict[str, bool],
) -> None:
    adapted = adapt_physical_cube("base+P+A2", a2_model)

    assert adapted["status"] == "READY_NAMED_PROJECTION"
    rows = adapted["metric_rows"]
    assert [row["exact"] for row in rows] == [True, True, False]
    assert [len(row["support"]) for row in rows] == [5, 4, 2]

    ledger = {entry["row_id"]: entry for entry in adapted["row_ledger"]}
    assert ledger["I_u_selected_projection"]["disposition"] == "ENCODED"
    assert ledger["row_u_full_exact_four"]["disposition"] == "OMITTED_FAIL_CLOSED"
    assert ledger["critical_double_bs1"]["exact_if_encoded"] is False
    assert ledger["f_chain_class_1"]["anonymous_slots_required"] == 3
    assert "pairwise distinct" in ledger["f_chain_class_1"][
        "anonymous_slot_distinctness"
    ]


def test_unconstrained_raw_row_bit_does_not_change_projection(
    a2_model: dict[str, bool],
) -> None:
    mutated = copy.deepcopy(a2_model)
    key = "row_u(a1)"
    mutated[key] = not mutated[key]

    original = adapt_physical_cube("base+P+A2", a2_model)
    changed = adapt_physical_cube("base+P+A2", mutated)

    assert changed["status"] == "READY_NAMED_PROJECTION"
    assert changed["metric_rows"] == original["metric_rows"]
    assert changed["orders"] == original["orders"]


def test_non_equivalence_assignment_is_rejected_fail_closed(
    a2_model: dict[str, bool],
) -> None:
    mutated = copy.deepcopy(a2_model)
    assert mutated["eq(a0,f1)"]
    assert mutated["eq(a0,v)"]
    assert mutated["eq(f1,v)"]
    mutated["eq(f1,v)"] = False

    rejected = adapt_physical_cube("base+P+A2", mutated)

    assert rejected["status"] == "REJECTED"
    assert rejected["fail_closed"] is True
    assert "not a valid equivalence relation" in rejected["error"]


def test_exact_five_collapse_is_rejected(
    a2_model: dict[str, bool],
) -> None:
    mutated = copy.deepcopy(a2_model)
    # A2 already has a0=v=f1.  Joining a0 to zd collapses two members of
    # the canonical exact-five shell before the full closure audit.
    mutated["eq(a0,zd)"] = True

    rejected = adapt_physical_cube("base+P+A2", mutated)

    assert rejected["status"] == "REJECTED"
    assert rejected["fail_closed"] is True
    assert "exact class collapsed" in rejected["error"]


def test_every_derived_order_is_a_full_vertex_permutation(
    a2_model: dict[str, bool],
) -> None:
    adapted = adapt_physical_cube("base+P+A2", a2_model)

    expected = list(range(adapted["n_vertices"]))
    assert adapted["orders"]
    assert all(sorted(order) == expected for order in adapted["orders"])


def test_driver_writes_compact_scoped_artifact(
    tmp_path: Path,
) -> None:
    def fake_probe(task: dict[str, object]) -> dict[str, object]:
        return {
            "run": task["run"],
            "order_index": task["order_index"],
            "order": task["order"],
            "status": "UNKNOWN",
            "backend_status": "UNKNOWN",
            "decisive_stage": None,
            "fail_closed": True,
            "verification": {"confirmed": False},
            "diagnostic": "test timeout",
            "raw_result_sha256": "0" * 64,
        }

    output = tmp_path / "a_core_metric_test.json"
    artifact = run_current_physical_leaves(
        output_path=output,
        workers=1,
        timeout_s=0.01,
        probe_runner=fake_probe,
    )

    loaded = json.loads(output.read_text())
    assert loaded["schema"] == artifact["schema"]
    assert loaded["totals"]["physical_leaves"] == 5
    assert loaded["totals"]["probe_orders"] > 0
    assert loaded["totals"]["status_counts"]["UNKNOWN"] == loaded["totals"][
        "probe_orders"
    ]
    assert "not an exhaustive A-leaf" in loaded["scope"]


def test_manifest_model_truth_assignment_is_checked(
    tmp_path: Path,
) -> None:
    # Copy only the small source tree needed by the loader, then corrupt one
    # manifest truth list.  The adapter must fail before geometry.
    copied = tmp_path / "a_core"
    (copied / "out").mkdir(parents=True)
    for name in ("RESULTS.md",):
        (copied / name).write_bytes((A_CORE_DIR / name).read_bytes())
    (tmp_path / "A-CORE-ENCODING-SPEC.md").write_bytes(
        (A_CORE_DIR.parent / "A-CORE-ENCODING-SPEC.md").read_bytes()
    )
    manifest = json.loads((A_CORE_DIR / "out" / "manifest.json").read_text())
    for record in manifest:
        if record["run"] in {
            "base+P+A2",
            "base+P+A3",
            "base+P+A6",
            "base+P+A7",
            "base+P+A8",
        }:
            source = A_CORE_DIR / record["model_file"]
            target = copied / record["model_file"]
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(source.read_bytes())
    physical = next(record for record in manifest if record["run"] == "base+P+A2")
    physical["model_true_atoms"] = physical["model_true_atoms"][:-1]
    (copied / "out" / "manifest.json").write_text(json.dumps(manifest))

    with pytest.raises(Exception, match="disagrees with manifest"):
        load_current_physical_cubes(copied)
