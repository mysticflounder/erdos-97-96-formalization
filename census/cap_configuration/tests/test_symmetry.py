from __future__ import annotations

import copy

import pytest

from census.cap_configuration.schema import structured_hash
from census.cap_configuration.symmetry import (
    FIXTURE_ACTION_VERSION,
    ORBIT_LEDGER_SCHEMA,
    CapConfigurationSymmetryError,
    FinitePermutationGroup,
    FixtureRepresentative,
    apply_fixture_action,
    build_orbit_ledger,
    fixture_symmetry_group,
    validate_orbit_ledger,
)


def fixture_representatives() -> tuple[FixtureRepresentative, ...]:
    return tuple(
        FixtureRepresentative(control, slots)
        for control in ("SAT", "UNSAT", "UNKNOWN")
        for slots in ((1, 0), (0, 1))
    )


def rehash_ledger(ledger: dict[str, object]) -> None:
    body = {key: value for key, value in ledger.items() if key != "orbit_ledger_sha256"}
    ledger["orbit_ledger_sha256"] = structured_hash(ORBIT_LEDGER_SCHEMA, body)


def test_fixture_group_has_exact_identity_composition_inverses_and_closure() -> None:
    group = fixture_symmetry_group()

    assert tuple(element.element_id for element in group.elements) == (
        "identity",
        "swap",
    )
    assert group.compose("identity", "swap") == "swap"
    assert group.compose("swap", "identity") == "swap"
    assert group.compose("swap", "swap") == "identity"
    assert group.inverse("identity") == "identity"
    assert group.inverse("swap") == "swap"
    assert FinitePermutationGroup.from_record(group.to_record()) == group


def test_fixture_action_preserves_control_and_swaps_slots() -> None:
    group = fixture_symmetry_group()
    representative = FixtureRepresentative("SAT", (1, 0))

    assert apply_fixture_action(group, "identity", representative) == representative
    assert apply_fixture_action(group, "swap", representative) == FixtureRepresentative(
        "SAT", (0, 1)
    )


def test_orbit_ledger_is_deterministic_and_exactly_partitions_fixture() -> None:
    representatives = fixture_representatives()
    first = build_orbit_ledger(representatives)
    second = build_orbit_ledger(representatives)
    validated = validate_orbit_ledger(
        first,
        expected_representatives=representatives,
        expected_group=fixture_symmetry_group(),
        expected_action_version=FIXTURE_ACTION_VERSION,
    )

    assert first == second
    assert first["raw_count"] == 6
    assert first["orbit_count"] == 3
    assert validated.orbit_ids == (
        "fixture-orbit-0000",
        "fixture-orbit-0001",
        "fixture-orbit-0002",
    )
    for orbit in first["orbits"]:
        assert len(orbit["members"]) == 2
        assert orbit["canonical_representative"]["slots"] == [0, 1]
        assert orbit["stabilizer_elements"] == ["identity"]
        witnesses = {
            tuple(member["representative"]["slots"]): member["witness_to_canonical"]
            for member in orbit["members"]
        }
        assert witnesses == {(0, 1): "identity", (1, 0): "swap"}


@pytest.mark.parametrize("mutation", ["unknown", "missing", "reordered", "stale"])
def test_orbit_validator_rejects_unknown_missing_reordered_and_stale(
    mutation: str,
) -> None:
    ledger = copy.deepcopy(build_orbit_ledger(fixture_representatives()))
    if mutation == "unknown":
        ledger["unexpected"] = False
    elif mutation == "missing":
        del ledger["raw_count"]
    elif mutation == "reordered":
        ledger["orbits"].reverse()
        rehash_ledger(ledger)
    else:
        ledger["orbit_ledger_sha256"] = "0" * 64

    with pytest.raises(CapConfigurationSymmetryError):
        validate_orbit_ledger(ledger)


def test_orbit_builder_rejects_a_universe_not_closed_under_the_group() -> None:
    incomplete = (
        FixtureRepresentative("SAT", (1, 0)),
        FixtureRepresentative("UNSAT", (1, 0)),
    )

    with pytest.raises(CapConfigurationSymmetryError, match="not closed"):
        build_orbit_ledger(incomplete)


def test_group_record_rejects_reordered_enumeration_even_when_group_is_same() -> None:
    record = copy.deepcopy(fixture_symmetry_group().to_record())
    record["elements"].reverse()

    with pytest.raises(CapConfigurationSymmetryError, match="tables"):
        FinitePermutationGroup.from_record(record)
