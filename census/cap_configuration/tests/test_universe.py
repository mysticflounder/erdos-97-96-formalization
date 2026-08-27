from __future__ import annotations

import copy
from fractions import Fraction

import pytest

from census.cap_configuration.schema import structured_hash
from census.cap_configuration.universe import (
    CAMPAIGN_IDENTITY_SCHEMA,
    CELL_SCHEMA,
    MANIFEST_SCHEMA,
    CapConfigurationUniverseError,
    build_fixture_bundle,
    canonical_cell_path,
    safe_relative_path,
    validate_cell,
    validate_manifest,
    validate_universe,
)

SOURCE_REVISION = "a" * 40
GENERATOR_SOURCES = (
    {
        "path": "census/cap_configuration/symmetry.py",
        "raw_sha256": "1" * 64,
    },
    {
        "path": "census/cap_configuration/universe.py",
        "raw_sha256": "2" * 64,
    },
)
VALIDATOR_SOURCES = (
    {
        "path": "census/cap_configuration/universe.py",
        "raw_sha256": "2" * 64,
    },
    {
        "path": "census/cap_configuration/validate.py",
        "raw_sha256": "3" * 64,
    },
)
PUBLICATION = {
    "created_utc": "2026-08-26T20:00:00Z",
    "metadata": {"operator": "offline-fixture", "sequence": 1},
}


def bundle(publication: dict[str, object] | None = None):
    return build_fixture_bundle(
        repository_revision=SOURCE_REVISION,
        generator_source_manifest=GENERATOR_SOURCES,
        validator_source_manifest=VALIDATOR_SOURCES,
        publication=PUBLICATION if publication is None else publication,
    )


def rehash_cell(cell: dict[str, object]) -> None:
    body = {key: value for key, value in cell.items() if key != "cell_sha256"}
    cell["cell_sha256"] = structured_hash(CELL_SCHEMA, body)


def rehash_manifest(manifest: dict[str, object]) -> None:
    manifest["campaign_id"] = structured_hash(
        CAMPAIGN_IDENTITY_SCHEMA, manifest["identity"]
    )
    body = {key: value for key, value in manifest.items() if key != "manifest_sha256"}
    manifest["manifest_sha256"] = structured_hash(MANIFEST_SCHEMA, body)


def test_fixture_bundle_is_byte_stable_and_validates_offline() -> None:
    first = bundle()
    second = bundle()
    validated = validate_universe(first)

    assert first == second
    assert first.stored_files() == second.stored_files()
    assert validated.raw_cell_count == 6
    assert validated.canonical_cell_count == 3
    assert validated.orbit_count == 3
    assert tuple(cell.control for cell in validated.cells) == (
        "SAT",
        "UNSAT",
        "UNKNOWN",
    )
    assert tuple(first.stored_files()) == (
        "manifest.json",
        "finite-ingress.json",
        "orbit-ledger.json",
        "cells/0000-fixture-sat-0000.json",
        "cells/0001-fixture-unsat-0001.json",
        "cells/0002-fixture-unknown-0002.json",
    )


def test_publication_is_outside_campaign_identity_but_inside_manifest_hash() -> None:
    first = bundle()
    changed = bundle(
        {
            "created_utc": "2026-08-26T20:00:01Z",
            "metadata": {"operator": "offline-fixture", "sequence": 2},
        }
    )

    assert first.manifest["campaign_id"] == changed.manifest["campaign_id"]
    assert first.manifest["manifest_sha256"] != changed.manifest["manifest_sha256"]
    assert first.cells == changed.cells


def test_fixture_claims_are_false_and_omitted_source_fact_stays_visible() -> None:
    built = bundle()
    target = built.manifest["identity"]["target"]

    assert target["kind"] == "fixture"
    assert target["mode"] == "DIAGNOSTIC_OBSTRUCTION_MINING"
    assert target["immediate_consumer"] is None
    assert target["final_consumer"] is None
    assert target["claim_flags"] == {
        "lean_closure": False,
        "source_entitlement": False,
        "theorem_coverage": False,
        "universal_lift": False,
    }
    assert built.manifest["identity"]["omitted_source_predicate_inventory"] == [
        "fixture source predicate: the two slot values sum to one"
    ]
    assert all(len(cell["omitted_source_predicates"]) == 1 for cell in built.cells)


def test_controls_are_independently_checkable_on_a_small_rational_grid() -> None:
    built = bundle()
    parsed = tuple(validate_cell(cell) for cell in built.cells)
    grid = tuple(Fraction(value) for value in (-1, 0, 1))

    satisfiable = {}
    for cell in parsed:
        satisfiable[cell.control] = any(
            all(result for _, result in cell.system.evaluate_enabled({"x": x, "y": y}))
            for x in grid
            for y in grid
        )

    assert satisfiable == {"SAT": True, "UNSAT": False, "UNKNOWN": True}
    assert built.cells[2]["fixture_expected_outcome"] == "INCONCLUSIVE_UNKNOWN_CONTROL"


@pytest.mark.parametrize(
    "value",
    ("/cells/a.json", "cells/../a.json", "cells//a.json", "cells\\a.json", "café.json"),
)
def test_relative_paths_reject_absolute_normalized_or_non_ascii_spellings(
    value: str,
) -> None:
    with pytest.raises(CapConfigurationUniverseError):
        safe_relative_path(value)


def test_canonical_cell_path_is_stable_and_rejects_bad_ids() -> None:
    assert canonical_cell_path(2, "fixture-unknown-0002") == (
        "cells/0002-fixture-unknown-0002.json"
    )
    with pytest.raises(CapConfigurationUniverseError):
        canonical_cell_path(0, "../escape")


@pytest.mark.parametrize("mutation", ["unknown", "missing", "reordered", "stale"])
def test_manifest_rejects_unknown_missing_reordered_and_stale(mutation: str) -> None:
    manifest = copy.deepcopy(bundle().manifest)
    if mutation == "unknown":
        manifest["unexpected"] = False
    elif mutation == "missing":
        del manifest["publication"]
    elif mutation == "reordered":
        manifest["identity"]["cells"].reverse()
        rehash_manifest(manifest)
    else:
        manifest["campaign_id"] = "0" * 64

    with pytest.raises(CapConfigurationUniverseError):
        validate_manifest(manifest)


@pytest.mark.parametrize("mutation", ["unknown", "missing", "semantic", "stale"])
def test_cell_rejects_unknown_missing_rehashed_semantic_and_stale(
    mutation: str,
) -> None:
    cell = copy.deepcopy(bundle().cells[0])
    if mutation == "unknown":
        cell["unexpected"] = False
    elif mutation == "missing":
        del cell["polarity"]
    elif mutation == "semantic":
        cell["incidence_mask"] = [1, 0]
        rehash_cell(cell)
    else:
        cell["cell_sha256"] = "0" * 64

    with pytest.raises(CapConfigurationUniverseError):
        validate_cell(cell)


def test_cell_rejects_rehashed_foreign_finite_ingress_identity() -> None:
    cell = copy.deepcopy(bundle().cells[0])
    cell["finite_ingress_identity"]["payload_sha256"] = "f" * 64
    rehash_cell(cell)

    with pytest.raises(
        CapConfigurationUniverseError,
        match="differs from the frozen fixture ingress",
    ):
        validate_cell(cell)


def test_universe_rejects_reordered_cells_and_cross_artifact_staleness() -> None:
    built = bundle()
    reordered = tuple(reversed(copy.deepcopy(built.cells)))
    with pytest.raises(CapConfigurationUniverseError):
        validate_universe(
            built.manifest,
            reordered,
            built.orbit_ledger,
            built.finite_ingress,
        )

    stale_manifest = copy.deepcopy(built.manifest)
    stale_manifest["identity"]["symmetry"]["orbit_ledger_sha256"] = "0" * 64
    rehash_manifest(stale_manifest)
    with pytest.raises(CapConfigurationUniverseError):
        validate_universe(
            stale_manifest,
            built.cells,
            built.orbit_ledger,
            built.finite_ingress,
        )


def test_source_manifests_must_be_nonempty_unique_and_sorted() -> None:
    reversed_sources = tuple(reversed(GENERATOR_SOURCES))
    with pytest.raises(CapConfigurationUniverseError, match="ascending"):
        build_fixture_bundle(
            repository_revision=SOURCE_REVISION,
            generator_source_manifest=reversed_sources,
            validator_source_manifest=VALIDATOR_SOURCES,
            publication=PUBLICATION,
        )


def test_pure_universe_treats_source_hashes_as_declarations_not_custody() -> None:
    declared_only = ({"path": "not-held/generator.py", "raw_sha256": "8" * 64},)
    built = build_fixture_bundle(
        repository_revision=SOURCE_REVISION,
        generator_source_manifest=declared_only,
        validator_source_manifest=(
            {"path": "not-held/validator.py", "raw_sha256": "9" * 64},
        ),
        publication=PUBLICATION,
    )

    # Pure validation binds the declarations into identity.  Campaign planning
    # must later authenticate them against the actual held source bytes.
    assert validate_universe(built).campaign_id == built.manifest["campaign_id"]
