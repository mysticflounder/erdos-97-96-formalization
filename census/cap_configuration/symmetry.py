"""Finite, versioned symmetry data for cap-configuration cell universes.

This module is intentionally solver-free.  It records a complete finite
permutation group, applies that group to fixture representatives, and emits an
orbit ledger that can be reconstructed independently by an offline validator.
No symmetry record in this module carries a theorem or source-entitlement
claim.
"""

from __future__ import annotations

import re
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from typing import Any, NoReturn

from .schema import (
    CapConfigurationSchemaError,
    canonical_json_bytes,
    canonical_text,
    exact_int,
    exact_keys,
    exact_list,
    structured_hash,
)

PERMUTATION_GROUP_SCHEMA = "finite-permutation-group/v1"
ORBIT_LEDGER_SCHEMA = "cap-configuration-orbit-ledger/v1"
FIXTURE_GROUP_VERSION = "cap-configuration-fixture-slot-swap-group/v1"
FIXTURE_ACTION_VERSION = "cap-configuration-fixture-slot-action/v1"
FIXTURE_CONTROLS = ("SAT", "UNSAT", "UNKNOWN")

_SAFE_TOKEN = re.compile(r"[a-z][a-z0-9-]*")
_HEX_SHA256 = re.compile(r"[0-9a-f]{64}")


class CapConfigurationSymmetryError(ValueError):
    """Raised when a group action or orbit ledger is noncanonical."""


def _fail(message: str) -> NoReturn:
    raise CapConfigurationSymmetryError(message)


def _record(value: Any, expected: set[str], path: str) -> dict[str, Any]:
    try:
        return exact_keys(value, expected, path)
    except CapConfigurationSchemaError as exc:
        raise CapConfigurationSymmetryError(str(exc)) from exc


def _array(value: Any, path: str) -> list[Any]:
    try:
        return exact_list(value, path)
    except CapConfigurationSchemaError as exc:
        raise CapConfigurationSymmetryError(str(exc)) from exc


def _integer(value: Any, path: str, *, minimum: int | None = None) -> int:
    try:
        return exact_int(value, path, minimum=minimum)
    except CapConfigurationSchemaError as exc:
        raise CapConfigurationSymmetryError(str(exc)) from exc


def _text(value: Any, path: str) -> str:
    try:
        return canonical_text(value, path)
    except CapConfigurationSchemaError as exc:
        raise CapConfigurationSymmetryError(str(exc)) from exc


def _token(value: Any, path: str) -> str:
    if type(value) is not str or _SAFE_TOKEN.fullmatch(value) is None:
        _fail(f"{path} must be a lowercase canonical token")
    return value


@dataclass(frozen=True, slots=True)
class FixtureRepresentative:
    """One independently enumerable two-slot fixture representative."""

    control: str
    slots: tuple[int, int]

    def __post_init__(self) -> None:
        if self.control not in FIXTURE_CONTROLS:
            _fail(f"unsupported fixture control {self.control!r}")
        if (
            type(self.slots) is not tuple
            or len(self.slots) != 2
            or any(type(slot) is not int or slot not in {0, 1} for slot in self.slots)
            or sum(self.slots) != 1
        ):
            _fail("fixture slots must be a two-entry 0/1 tuple with sum one")

    def to_record(self) -> dict[str, object]:
        return {"control": self.control, "slots": list(self.slots)}

    @classmethod
    def from_record(
        cls, value: Any, *, path: str = "representative"
    ) -> FixtureRepresentative:
        record = _record(value, {"control", "slots"}, path)
        control = record["control"]
        if type(control) is not str or control not in FIXTURE_CONTROLS:
            _fail(f"{path}.control is unsupported")
        raw_slots = _array(record["slots"], f"{path}.slots")
        if len(raw_slots) != 2:
            _fail(f"{path}.slots must have length two")
        result = cls(
            control=control,
            slots=tuple(
                _integer(slot, f"{path}.slots[{index}]", minimum=0)
                for index, slot in enumerate(raw_slots)
            ),
        )
        if result.to_record() != value:
            _fail(f"{path} is not canonical")
        return result


@dataclass(frozen=True, slots=True)
class Permutation:
    """A named permutation represented by output-to-input point indices."""

    element_id: str
    image: tuple[int, ...]

    def __post_init__(self) -> None:
        _token(self.element_id, "permutation.element_id")
        if type(self.image) is not tuple or not self.image:
            _fail("permutation image must be a nonempty tuple")
        if any(type(index) is not int for index in self.image):
            _fail("permutation image entries must be integers")
        if tuple(sorted(self.image)) != tuple(range(len(self.image))):
            _fail("permutation image must contain every point exactly once")

    def act(self, values: Sequence[Any]) -> tuple[Any, ...]:
        value_tuple = tuple(values)
        if len(value_tuple) != len(self.image):
            _fail("permutation action has the wrong point width")
        return tuple(value_tuple[index] for index in self.image)

    def compose(self, inner: Permutation, *, element_id: str) -> Permutation:
        """Return ``self`` after ``inner`` using the action convention above."""

        if len(self.image) != len(inner.image):
            _fail("cannot compose permutations of different widths")
        return Permutation(
            element_id=element_id,
            image=tuple(inner.image[index] for index in self.image),
        )

    def to_record(self) -> dict[str, object]:
        return {"element_id": self.element_id, "image": list(self.image)}

    @classmethod
    def from_record(cls, value: Any, *, path: str) -> Permutation:
        record = _record(value, {"element_id", "image"}, path)
        raw_image = _array(record["image"], f"{path}.image")
        result = cls(
            element_id=_token(record["element_id"], f"{path}.element_id"),
            image=tuple(
                _integer(index, f"{path}.image[{ordinal}]", minimum=0)
                for ordinal, index in enumerate(raw_image)
            ),
        )
        if result.to_record() != value:
            _fail(f"{path} is not canonical")
        return result


@dataclass(frozen=True, slots=True)
class FinitePermutationGroup:
    """A completely enumerated finite permutation group."""

    version: str
    point_order: tuple[str, ...]
    identity_id: str
    elements: tuple[Permutation, ...]

    def __post_init__(self) -> None:
        _text(self.version, "group.version")
        if type(self.point_order) is not tuple or not self.point_order:
            _fail("group point order must be a nonempty tuple")
        for index, point in enumerate(self.point_order):
            _token(point, f"group.point_order[{index}]")
        if len(self.point_order) != len(set(self.point_order)):
            _fail("group point order contains duplicates")
        _token(self.identity_id, "group.identity_id")
        if (
            type(self.elements) is not tuple
            or not self.elements
            or any(type(element) is not Permutation for element in self.elements)
        ):
            _fail("group elements must be a nonempty tuple of permutations")
        ids = tuple(element.element_id for element in self.elements)
        if len(ids) != len(set(ids)):
            _fail("group element identifiers contain duplicates")
        if self.identity_id not in ids:
            _fail("group identity is not enumerated")
        width = len(self.point_order)
        if any(len(element.image) != width for element in self.elements):
            _fail("group element width does not match the point order")
        if self.element(self.identity_id).image != tuple(range(width)):
            _fail("declared group identity does not act identically")

        images = {element.image for element in self.elements}
        if len(images) != len(self.elements):
            _fail("group enumerates the same permutation more than once")
        for outer in self.elements:
            for inner in self.elements:
                composite = outer.compose(inner, element_id="composite").image
                if composite not in images:
                    _fail(
                        f"group is not closed under {outer.element_id} after "
                        f"{inner.element_id}"
                    )
        for element in self.elements:
            if not any(
                self.compose(element.element_id, candidate.element_id)
                == self.identity_id
                and self.compose(candidate.element_id, element.element_id)
                == self.identity_id
                for candidate in self.elements
            ):
                _fail(f"group element {element.element_id!r} has no two-sided inverse")

    def element(self, element_id: str) -> Permutation:
        for element in self.elements:
            if element.element_id == element_id:
                return element
        _fail(f"unknown group element {element_id!r}")

    def compose(self, outer_id: str, inner_id: str) -> str:
        outer = self.element(outer_id)
        inner = self.element(inner_id)
        image = outer.compose(inner, element_id="composite").image
        for element in self.elements:
            if element.image == image:
                return element.element_id
        _fail("group composition escaped the enumerated element set")

    def inverse(self, element_id: str) -> str:
        for candidate in self.elements:
            if (
                self.compose(element_id, candidate.element_id) == self.identity_id
                and self.compose(candidate.element_id, element_id) == self.identity_id
            ):
                return candidate.element_id
        _fail(f"group element {element_id!r} has no inverse")

    def to_record(self) -> dict[str, object]:
        composition = [
            {
                "inner": inner.element_id,
                "outer": outer.element_id,
                "result": self.compose(outer.element_id, inner.element_id),
            }
            for outer in self.elements
            for inner in self.elements
        ]
        inverses = [
            {
                "element_id": element.element_id,
                "inverse": self.inverse(element.element_id),
            }
            for element in self.elements
        ]
        return {
            "composition": composition,
            "elements": [element.to_record() for element in self.elements],
            "identity_id": self.identity_id,
            "inverses": inverses,
            "point_order": list(self.point_order),
            "schema": PERMUTATION_GROUP_SCHEMA,
            "version": self.version,
        }

    @classmethod
    def from_record(cls, value: Any, *, path: str = "group") -> FinitePermutationGroup:
        record = _record(
            value,
            {
                "composition",
                "elements",
                "identity_id",
                "inverses",
                "point_order",
                "schema",
                "version",
            },
            path,
        )
        if record["schema"] != PERMUTATION_GROUP_SCHEMA:
            _fail(f"{path}.schema is unsupported")
        points = tuple(
            _token(point, f"{path}.point_order[{index}]")
            for index, point in enumerate(
                _array(record["point_order"], f"{path}.point_order")
            )
        )
        elements = tuple(
            Permutation.from_record(element, path=f"{path}.elements[{index}]")
            for index, element in enumerate(
                _array(record["elements"], f"{path}.elements")
            )
        )
        result = cls(
            version=_text(record["version"], f"{path}.version"),
            point_order=points,
            identity_id=_token(record["identity_id"], f"{path}.identity_id"),
            elements=elements,
        )
        # This also validates the exact composition, inverse, and list ordering.
        if result.to_record() != value:
            _fail(f"{path} does not match its recomputed finite-group tables")
        return result


def fixture_symmetry_group() -> FinitePermutationGroup:
    """Return the frozen order-two action swapping the two fixture slots."""

    return FinitePermutationGroup(
        version=FIXTURE_GROUP_VERSION,
        point_order=("left", "right"),
        identity_id="identity",
        elements=(
            Permutation("identity", (0, 1)),
            Permutation("swap", (1, 0)),
        ),
    )


def apply_fixture_action(
    group: FinitePermutationGroup,
    element_id: str,
    representative: FixtureRepresentative | Mapping[str, Any],
) -> FixtureRepresentative:
    """Apply one group element without changing the fixture control branch."""

    parsed = (
        representative
        if type(representative) is FixtureRepresentative
        else FixtureRepresentative.from_record(representative)
    )
    slots = group.element(element_id).act(parsed.slots)
    return FixtureRepresentative(parsed.control, (slots[0], slots[1]))


def _representative_key(representative: FixtureRepresentative) -> bytes:
    return canonical_json_bytes(representative.to_record())


def build_orbit_ledger(
    representatives: Sequence[FixtureRepresentative | Mapping[str, Any]],
    *,
    group: FinitePermutationGroup | None = None,
    action_version: str = FIXTURE_ACTION_VERSION,
) -> dict[str, object]:
    """Build the exact orbit partition for an ordered representative universe."""

    if isinstance(representatives, (str, bytes)) or not isinstance(
        representatives, Sequence
    ):
        _fail("representatives must be an ordered sequence")
    parsed = tuple(
        item
        if type(item) is FixtureRepresentative
        else FixtureRepresentative.from_record(item, path=f"representatives[{index}]")
        for index, item in enumerate(representatives)
    )
    if not parsed:
        _fail("representative universe must be nonempty")
    keys = tuple(_representative_key(item) for item in parsed)
    if len(keys) != len(set(keys)):
        _fail("representative universe contains duplicates")
    bound_group = fixture_symmetry_group() if group is None else group
    if type(bound_group) is not FinitePermutationGroup:
        _fail("group must be a FinitePermutationGroup")
    _text(action_version, "action_version")

    by_key = dict(zip(keys, parsed, strict=True))
    for representative in parsed:
        for element in bound_group.elements:
            acted = apply_fixture_action(
                bound_group, element.element_id, representative
            )
            if _representative_key(acted) not in by_key:
                _fail(
                    "representative universe is not closed under "
                    f"{element.element_id!r}"
                )

    remaining = set(keys)
    orbits: list[dict[str, object]] = []
    for anchor in parsed:
        anchor_key = _representative_key(anchor)
        if anchor_key not in remaining:
            continue
        orbit_by_key = {
            _representative_key(
                apply_fixture_action(bound_group, element.element_id, anchor)
            ): apply_fixture_action(bound_group, element.element_id, anchor)
            for element in bound_group.elements
        }
        member_keys = sorted(orbit_by_key)
        members = [orbit_by_key[key] for key in member_keys]
        canonical = members[0]
        member_records: list[dict[str, object]] = []
        for member in members:
            witnesses = [
                element.element_id
                for element in bound_group.elements
                if apply_fixture_action(bound_group, element.element_id, member)
                == canonical
            ]
            if not witnesses:
                _fail("orbit member has no witness to its canonical representative")
            member_records.append(
                {
                    "representative": member.to_record(),
                    "witness_to_canonical": witnesses[0],
                }
            )
        stabilizer = [
            element.element_id
            for element in bound_group.elements
            if apply_fixture_action(bound_group, element.element_id, canonical)
            == canonical
        ]
        ordinal = len(orbits)
        orbits.append(
            {
                "canonical_representative": canonical.to_record(),
                "members": member_records,
                "orbit_id": f"fixture-orbit-{ordinal:04d}",
                "ordinal": ordinal,
                "stabilizer_elements": stabilizer,
            }
        )
        remaining.difference_update(member_keys)
    if remaining:
        _fail("orbit partition did not consume the representative universe")

    body: dict[str, object] = {
        "action_version": action_version,
        "group": bound_group.to_record(),
        "orbit_count": len(orbits),
        "orbits": orbits,
        "raw_count": len(parsed),
        "raw_representative_order": [item.to_record() for item in parsed],
        "schema": ORBIT_LEDGER_SCHEMA,
    }
    return {
        **body,
        "orbit_ledger_sha256": structured_hash(ORBIT_LEDGER_SCHEMA, body),
    }


@dataclass(frozen=True, slots=True)
class ValidatedOrbitLedger:
    """Typed summary returned after exact orbit-ledger reconstruction."""

    group: FinitePermutationGroup
    action_version: str
    representatives: tuple[FixtureRepresentative, ...]
    orbit_ids: tuple[str, ...]
    orbit_ledger_sha256: str


def validate_orbit_ledger(
    value: Any,
    *,
    expected_representatives: Sequence[FixtureRepresentative | Mapping[str, Any]]
    | None = None,
    expected_group: FinitePermutationGroup | None = None,
    expected_action_version: str = FIXTURE_ACTION_VERSION,
) -> ValidatedOrbitLedger:
    """Reject any incomplete, reordered, relabeled, or stale orbit record."""

    ledger = _record(
        value,
        {
            "action_version",
            "group",
            "orbit_count",
            "orbit_ledger_sha256",
            "orbits",
            "raw_count",
            "raw_representative_order",
            "schema",
        },
        "orbit_ledger",
    )
    if ledger["schema"] != ORBIT_LEDGER_SCHEMA:
        _fail("orbit_ledger.schema is unsupported")
    digest = ledger["orbit_ledger_sha256"]
    if type(digest) is not str or _HEX_SHA256.fullmatch(digest) is None:
        _fail("orbit_ledger.orbit_ledger_sha256 must be lowercase SHA-256")
    body = {key: item for key, item in ledger.items() if key != "orbit_ledger_sha256"}
    if structured_hash(ORBIT_LEDGER_SCHEMA, body) != digest:
        _fail("orbit ledger self-hash mismatch")

    group = FinitePermutationGroup.from_record(
        ledger["group"], path="orbit_ledger.group"
    )
    if expected_group is not None and group != expected_group:
        _fail("orbit ledger group differs from the expected finite group")
    action_version = _text(ledger["action_version"], "orbit_ledger.action_version")
    if action_version != expected_action_version:
        _fail("orbit ledger action version is unsupported")
    raw_values = _array(
        ledger["raw_representative_order"],
        "orbit_ledger.raw_representative_order",
    )
    representatives = tuple(
        FixtureRepresentative.from_record(
            representative,
            path=f"orbit_ledger.raw_representative_order[{index}]",
        )
        for index, representative in enumerate(raw_values)
    )
    if _integer(ledger["raw_count"], "orbit_ledger.raw_count", minimum=1) != len(
        representatives
    ):
        _fail("orbit ledger raw count mismatch")
    if expected_representatives is not None:
        expected = tuple(
            item
            if type(item) is FixtureRepresentative
            else FixtureRepresentative.from_record(item)
            for item in expected_representatives
        )
        if representatives != expected:
            _fail(
                "orbit ledger representative order differs from the expected universe"
            )

    rebuilt = build_orbit_ledger(
        representatives,
        group=group,
        action_version=action_version,
    )
    if rebuilt != value:
        _fail("orbit ledger differs from its independently reconstructed partition")
    raw_orbits = _array(ledger["orbits"], "orbit_ledger.orbits")
    if _integer(ledger["orbit_count"], "orbit_ledger.orbit_count", minimum=1) != len(
        raw_orbits
    ):
        _fail("orbit ledger orbit count mismatch")
    orbit_ids = tuple(
        _token(
            _record(
                orbit,
                {
                    "canonical_representative",
                    "members",
                    "orbit_id",
                    "ordinal",
                    "stabilizer_elements",
                },
                f"orbit_ledger.orbits[{index}]",
            )["orbit_id"],
            f"orbit_ledger.orbits[{index}].orbit_id",
        )
        for index, orbit in enumerate(raw_orbits)
    )
    return ValidatedOrbitLedger(
        group=group,
        action_version=action_version,
        representatives=representatives,
        orbit_ids=orbit_ids,
        orbit_ledger_sha256=digest,
    )
