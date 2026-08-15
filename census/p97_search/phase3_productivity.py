"""Opt-in P10A lemma-productivity telemetry and read-only mining.

This module is deliberately diagnostic.  Its authenticated stream records what
the existing coordinator already did; it never selects a detector, admits a
clause, validates a witness, or changes a terminal proof.  The schema miner is
also read-only and reports ``PARKED-SPEC`` proposals until a replayable finite
consumer or a kernel theorem is supplied.
"""

from __future__ import annotations

import copy
import hashlib
import json
from collections import Counter, defaultdict
from collections.abc import Callable, Iterator, Mapping, Sequence
from contextlib import contextmanager
from dataclasses import dataclass, field
from typing import Any

SCHEMA = "p97-phase3-lemma-productivity-v1"
RECORD_SCHEMA = "p97-phase3-lemma-productivity-record-v1"
MINER_SCHEMA = "p97-phase3-proof-core-miner-v1"
PARKED_SPEC = "PARKED-SPEC"
INGRESS_CONTRACT_SCHEMA = "p97-phase3-ingress-contract-v1"
LOCAL_CERTIFICATE = "LOCAL_CERTIFICATE"
UNIFORM_PRODUCER = "UNIFORM_PRODUCER"
LIFTED_CONSUMER = "LIFTED_CONSUMER"
EVIDENCE_CLASSES = frozenset({LOCAL_CERTIFICATE, UNIFORM_PRODUCER, LIFTED_CONSUMER})


class ProductivityError(ValueError):
    """Malformed or inconsistent P10A diagnostic state."""


def canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), allow_nan=False
    ).encode("utf-8")


def sha256_value(value: Any) -> str:
    return hashlib.sha256(canonical_bytes(value)).hexdigest()


def with_record_hash(
    unsigned: Mapping[str, Any], previous: str | None
) -> dict[str, Any]:
    payload = {**unsigned, "previous_record_sha256": previous}
    return {**payload, "record_sha256": sha256_value(payload)}


@dataclass(frozen=True)
class ProductivitySnapshot:
    record_count: int
    byte_count: int
    terminal_record_sha256: str | None
    file_sha256: str

    def as_dict(self) -> dict[str, Any]:
        return {
            "record_count": self.record_count,
            "byte_count": self.byte_count,
            "terminal_record_sha256": self.terminal_record_sha256,
            "file_sha256": self.file_sha256,
        }


@dataclass
class ProductivityLedger:
    """Authenticated shadow state for ``productivity.jsonl``.

    The caller updates this object only after the JSONL append has flushed and
    fsynced.  Every record is checked independently, including its own hash,
    its predecessor, its dense index, and its dense raw-SAT index.
    """

    record_count: int
    byte_count: int
    terminal_record_sha256: str | None
    _digest: Any = field(repr=False)

    @classmethod
    def from_authenticated_records(
        cls, records: Sequence[Mapping[str, Any]], scan: Any
    ) -> ProductivityLedger:
        terminal: str | None = None
        for index, record in enumerate(records):
            _validate_record(record, index=index, previous=terminal)
            terminal = str(record["record_sha256"])
        digest_copy = scan.digest_copy()
        return cls(
            record_count=len(records),
            byte_count=int(scan.byte_count),
            terminal_record_sha256=terminal,
            _digest=digest_copy,
        )

    def observe_durable_append(
        self, record: Mapping[str, Any], serialized: bytes
    ) -> None:
        _validate_record(
            record,
            index=self.record_count,
            previous=self.terminal_record_sha256,
        )
        self._digest.update(serialized)
        self.byte_count += len(serialized)
        self.record_count += 1
        self.terminal_record_sha256 = str(record["record_sha256"])

    def snapshot(self) -> ProductivitySnapshot:
        return ProductivitySnapshot(
            record_count=self.record_count,
            byte_count=self.byte_count,
            terminal_record_sha256=self.terminal_record_sha256,
            file_sha256=self._digest.copy().hexdigest(),
        )


def _validate_record(
    record: Mapping[str, Any], *, index: int, previous: str | None
) -> None:
    if record.get("schema") != RECORD_SCHEMA:
        raise ProductivityError("productivity record schema mismatch")
    if record.get("index") != index:
        raise ProductivityError("productivity record indices are not dense")
    if record.get("raw_sat_index") != index:
        raise ProductivityError("productivity raw SAT indices are not dense")
    if record.get("previous_record_sha256") != previous:
        raise ProductivityError("productivity record hash chain drift")
    if not isinstance(record.get("classification"), str):
        raise ProductivityError("productivity classification is missing")
    contract = record.get("ingress_contract")
    if contract is not None:
        validate_ingress_contract(contract)
    claimed = record.get("record_sha256")
    if not isinstance(claimed, str):
        raise ProductivityError("productivity record hash is missing")
    unsigned = dict(record)
    unsigned.pop("record_sha256", None)
    if claimed != sha256_value(unsigned):
        raise ProductivityError("productivity record hash mismatch")


def validate_authenticated_chain(
    records: Sequence[Mapping[str, Any]],
    *,
    require_dense_indices: bool = True,
) -> str | None:
    """Validate a generic P97 hash-chained JSONL record sequence.

    The learned journal has its own semantic replay loader.  This helper only
    checks the common authenticated envelope so the read-only miner cannot
    silently analyze a truncated, reordered, or edited source stream.
    """

    previous: str | None = None
    for index, record in enumerate(records):
        if require_dense_indices and record.get("index") != index:
            raise ProductivityError("source record indices are not dense")
        if record.get("previous_record_sha256") != previous:
            raise ProductivityError("source record hash chain drift")
        claimed = record.get("record_sha256")
        if not isinstance(claimed, str):
            raise ProductivityError("source record hash is missing")
        unsigned = dict(record)
        unsigned.pop("record_sha256", None)
        if claimed != sha256_value(unsigned):
            raise ProductivityError("source record hash mismatch")
        previous = claimed
    return previous


_PROMOTED_CONTRACT_FIELDS = (
    "live_leaf",
    "ingress_hypotheses_sha256",
    "finite_schema",
    "cardinality_scope",
    "source_theorem",
    "producer_theorem",
    "consumer_theorem",
)


def validate_ingress_contract(contract: Mapping[str, Any]) -> None:
    """Validate the Lean-facing contract attached to productivity data.

    A local certificate is intentionally admissible without a producer or a
    lift, but it is explicitly non-promotable.  The two promoted classes must
    name the live leaf, source theorem, producer, and consumer; a lifted
    consumer must also name its general-cardinality (or bounded-obstruction)
    lift.  This keeps finite SAT output useful while preventing it from being
    mistaken for universal closure.
    """

    if not isinstance(contract, Mapping):
        raise ProductivityError("ingress contract is not an object")
    if contract.get("schema") != INGRESS_CONTRACT_SCHEMA:
        raise ProductivityError("ingress contract schema mismatch")
    evidence_class = contract.get("evidence_classification")
    if evidence_class not in EVIDENCE_CLASSES:
        raise ProductivityError("unknown ingress evidence classification")
    missing = contract.get("missing_fields")
    if not isinstance(missing, list) or not all(
        isinstance(field, str) for field in missing
    ):
        raise ProductivityError("ingress contract missing_fields is invalid")
    eligible = contract.get("promotion_eligible")
    if not isinstance(eligible, bool):
        raise ProductivityError("ingress contract promotion_eligible is invalid")
    if evidence_class == LOCAL_CERTIFICATE:
        if eligible:
            raise ProductivityError("local certificate cannot be promotable")
        return

    for required_field in _PROMOTED_CONTRACT_FIELDS:
        value = contract.get(required_field)
        if not isinstance(value, str) or not value:
            raise ProductivityError(
                f"promoted ingress contract is missing {required_field}"
            )
    hypotheses_hash = contract["ingress_hypotheses_sha256"]
    if len(hypotheses_hash) != 64 or any(
        character not in "0123456789abcdef" for character in hypotheses_hash
    ):
        raise ProductivityError(
            "promoted ingress contract has an invalid ingress hypothesis hash"
        )
    if evidence_class == LIFTED_CONSUMER:
        lift = contract.get("lift_theorem")
        if not isinstance(lift, str) or not lift:
            raise ProductivityError(
                "lifted consumer ingress contract is missing lift_theorem"
            )
    if missing or not eligible:
        raise ProductivityError("promoted ingress contract has unresolved fields")


def default_ingress_contract(source_record: Mapping[str, Any]) -> dict[str, Any]:
    """Create an honest diagnostic contract when a run supplies no ingress.

    The default is deliberately ``LOCAL_CERTIFICATE``.  It records the exact
    gap instead of fabricating a leaf or theorem name, so old callers remain
    runnable while their new records cannot be promoted accidentally.
    """

    source_contract = source_record.get("ingress_contract")
    if isinstance(source_contract, Mapping):
        contract = dict(source_contract)
        validate_ingress_contract(contract)
        return contract
    contract = {
        "schema": INGRESS_CONTRACT_SCHEMA,
        "evidence_classification": LOCAL_CERTIFICATE,
        "promotion_eligible": False,
        "live_leaf": "UNDECLARED",
        "ingress_hypotheses_sha256": None,
        "finite_schema": "UNDECLARED",
        "cardinality_scope": "exact source assignment only",
        "source_theorem": None,
        "producer_theorem": None,
        "lift_theorem": None,
        "consumer_theorem": None,
        "missing_fields": list(_PROMOTED_CONTRACT_FIELDS),
        "missing_field_reason": (
            "run supplied no source-level universal ingress contract"
        ),
    }
    validate_ingress_contract(contract)
    return contract


def ingress_summary(records: Sequence[Mapping[str, Any]]) -> dict[str, Any]:
    """Summarize which records can actually feed a universal proof.

    This is intentionally a report-only view.  It does not upgrade a local
    certificate, and it validates every attached contract before counting it.
    The summary is useful at the end of a bounded run because it exposes the
    smallest repeated ingress gap instead of only reporting SAT/model counts.
    """

    evidence_counts: Counter[str] = Counter()
    leaf_counts: Counter[str] = Counter()
    missing_counts: Counter[str] = Counter()
    targeted_count = 0
    promotable_count = 0
    for record in records:
        contract = default_ingress_contract(record)
        evidence = str(contract["evidence_classification"])
        leaf = str(contract["live_leaf"])
        evidence_counts[evidence] += 1
        leaf_counts[leaf] += 1
        if leaf != "UNDECLARED":
            targeted_count += 1
        if contract["promotion_eligible"]:
            promotable_count += 1
        for missing_field in contract["missing_fields"]:
            missing_counts[str(missing_field)] += 1
    return {
        "record_count": len(records),
        "targeted_record_count": targeted_count,
        "promotion_eligible_count": promotable_count,
        "evidence_classification_counts": dict(sorted(evidence_counts.items())),
        "live_leaf_counts": dict(sorted(leaf_counts.items())),
        "missing_field_counts": dict(sorted(missing_counts.items())),
    }


@dataclass
class ClassificationTelemetry:
    """Optional inclusive nanosecond timings for one classification."""

    enabled: bool = True
    timings_ns: Counter[str] = field(default_factory=Counter)

    @contextmanager
    def measure(self, name: str) -> Iterator[None]:
        if not self.enabled:
            yield
            return
        # Import lazily: the default CEGAR path does not pay for a timer until
        # the opt-in telemetry flag is enabled.
        import time

        start = time.perf_counter_ns()
        try:
            yield
        finally:
            self.timings_ns[name] += time.perf_counter_ns() - start

    def snapshot(self, total_ns: int) -> dict[str, int]:
        result = {str(key): int(value) for key, value in self.timings_ns.items()}
        result["total"] = int(total_ns)
        return dict(sorted(result.items()))


def _walk(
    value: Any, path: tuple[str, ...] = ()
) -> Iterator[tuple[tuple[str, ...], Any]]:
    yield path, value
    if isinstance(value, Mapping):
        for key in sorted(value, key=str):
            yield from _walk(value[key], (*path, str(key)))
    elif isinstance(value, (list, tuple)):
        for index, item in enumerate(value):
            yield from _walk(item, (*path, str(index)))


def _named_values(value: Any, tokens: tuple[str, ...]) -> list[Any]:
    found: list[Any] = []
    for path, item in _walk(value):
        if not path:
            continue
        name = path[-1].lower()
        if any(token in name for token in tokens):
            found.append(item)
    return found


def _normal(value: Any) -> Any:
    if isinstance(value, Mapping):
        return {str(key): _normal(value[key]) for key in sorted(value, key=str)}
    if isinstance(value, (list, tuple)):
        return [_normal(item) for item in value]
    if isinstance(value, (str, int, float, bool)) or value is None:
        return value
    return repr(value)


def _flatten_count(values: Sequence[Any]) -> int:
    total = 0
    for value in values:
        if isinstance(value, (Mapping, list, tuple, set, frozenset)):
            total += len(value)
        elif value is not None:
            total += 1
    return total


def certificate_identifiers(record: Mapping[str, Any]) -> list[str]:
    """Return only certificate/template identity hashes, not content hashes."""

    names = {
        "certificate_payload_sha256",
        "certificate_sha256",
        "payload_sha256",
        "proof_sha256",
        "template_sha256",
        "algebraic_template_sha256",
        "nogood_sha256",
    }
    result: set[str] = set()
    for path, value in _walk(record):
        if path and path[-1] in names and isinstance(value, str):
            result.add(value)
    return sorted(result)


def core_summary(record: Mapping[str, Any]) -> dict[str, int | None]:
    certificate = record.get("certificate")
    source = certificate if isinstance(certificate, Mapping) else record
    rows = _named_values(source, ("row",))
    facts = _named_values(source, ("fact", "order"))
    incidences = _named_values(
        source, ("membership", "incidence", "support", "literal")
    )
    clause = record.get("clause", record.get("blocking_clause"))
    clause_size = len(clause) if isinstance(clause, (list, tuple)) else None
    return {
        "retained_row_count": _flatten_count(rows) or None,
        "fact_or_order_count": _flatten_count(facts) or None,
        "incidence_or_support_count": _flatten_count(incidences) or None,
        "clause_size": clause_size,
        "core_size": (
            (_flatten_count(rows) + _flatten_count(facts) + _flatten_count(incidences))
            or None
        ),
    }


def make_record(
    *,
    index: int,
    raw_sat_index: int,
    assignment_sha256: str,
    classification: str,
    source_record: Mapping[str, Any],
    timings_ns: Mapping[str, int],
    antichain: Mapping[str, Any],
    bounded_elimination: Mapping[str, Any],
    previous_record_sha256: str | None,
    ingress_contract: Mapping[str, Any] | None = None,
) -> dict[str, Any]:
    producer = {
        "origin": source_record.get("origin"),
        "stage": source_record.get("stage"),
        "certificate_kind": source_record.get("certificate_kind"),
    }
    contract_source = (
        {**source_record, "ingress_contract": ingress_contract}
        if ingress_contract is not None
        else source_record
    )
    contract = default_ingress_contract(contract_source)
    unsigned = {
        "schema": RECORD_SCHEMA,
        "index": index,
        "raw_sat_index": raw_sat_index,
        "assignment_sha256": assignment_sha256,
        "classification": classification,
        "producer": producer,
        "source": {
            "record_sha256": source_record.get("record_sha256"),
            "certificate_ids": certificate_identifiers(source_record),
        },
        "ingress_contract": contract,
        "core": core_summary(source_record),
        "cost_ns": {str(key): int(value) for key, value in sorted(timings_ns.items())},
        "antichain": _normal(dict(antichain)),
        "bounded_elimination": _normal(dict(bounded_elimination)),
    }
    return with_record_hash(unsigned, previous_record_sha256)


def _signature_parts(record: Mapping[str, Any]) -> dict[str, Any]:
    certificate = record.get("certificate")
    source = certificate if isinstance(certificate, Mapping) else record
    rows = _named_values(source, ("row",))
    facts = _named_values(source, ("fact",))
    orders = _named_values(source, ("order",))
    incidences = _named_values(source, ("membership", "incidence"))
    relations = _named_values(source, ("equal", "inequal", "closure"))
    return {
        "producer": {
            "origin": record.get("origin"),
            "stage": record.get("stage"),
            "certificate_kind": record.get("certificate_kind"),
        },
        "rows": _normal(rows),
        "facts": _normal(facts),
        "orders": _normal(orders),
        "incidences": _normal(incidences),
        "relations": _normal(relations),
    }


def _negative_control(
    record: Mapping[str, Any],
    replay_certificate: Callable[[Mapping[str, Any]], Any] | None,
) -> dict[str, Any]:
    certificate = record.get("certificate")
    if replay_certificate is None or not isinstance(certificate, Mapping):
        return {"status": "NOT_APPLICABLE", "removed_items": 0}
    rows = certificate.get("rows")
    if not isinstance(rows, list) or len(rows) <= 1:
        return {"status": "NOT_APPLICABLE", "removed_items": 0}
    attempted = 0
    replayed = 0
    for position in range(len(rows)):
        mutated = copy.deepcopy(certificate)
        mutated["rows"] = [item for i, item in enumerate(rows) if i != position]
        attempted += 1
        rejected = False
        try:
            replay_certificate(mutated)
        except Exception:  # noqa: BLE001 - rejection is the expected result
            rejected = True
        if not rejected:
            replayed += 1
    return {
        "status": "PASS" if replayed == 0 else "FAIL_UNUSED_CORE_ITEM",
        "removed_items": attempted,
        "replayed_after_removal": replayed,
    }


def mine_records(
    records: Sequence[Mapping[str, Any]],
    *,
    source_file_sha256: str | None = None,
    replay_certificate: Callable[[Mapping[str, Any]], Any] | None = None,
    max_parents: int = 256,
) -> dict[str, Any]:
    """Mine repeated normalized cores without changing any source artifact."""

    if max_parents <= 0:
        raise ProductivityError("max_parents must be positive")
    groups: dict[str, list[dict[str, Any]]] = defaultdict(list)
    controls: list[dict[str, Any]] = []
    for record in records:
        parts = _signature_parts(record)
        signature = sha256_value(parts)
        groups[signature].append(
            {
                "record_sha256": record.get("record_sha256"),
                "raw_sat_index": record.get("raw_sat_index"),
                "signature": parts,
            }
        )
        if len(controls) < max_parents:
            controls.append(
                {
                    "record_sha256": record.get("record_sha256"),
                    "negative_control": _negative_control(record, replay_certificate),
                }
            )
    repeated = [
        {
            "signature_sha256": signature,
            "multiplicity": len(items),
            "parents": items,
            "status": PARKED_SPEC,
            "intended_consumer": None,
        }
        for signature, items in sorted(groups.items())
        if len(items) >= 2
    ]
    report_unsigned = {
        "schema": MINER_SCHEMA,
        "status": PARKED_SPEC,
        "ingress": ingress_summary(records),
        "source": {
            "record_count": len(records),
            "source_file_sha256": source_file_sha256,
            "first_record_sha256": (
                records[0].get("record_sha256") if records else None
            ),
            "last_record_sha256": (
                records[-1].get("record_sha256") if records else None
            ),
        },
        "normalization": {
            "schema": "p97-phase3-proof-core-normalization-v1",
            "fields": [
                "producer",
                "rows",
                "facts",
                "orders",
                "incidences",
                "relations",
            ],
            "label_erasure": False,
        },
        "repeated_core_groups": repeated,
        "negative_controls": controls,
        "promotion": {
            "status": PARKED_SPEC,
            "requires": [
                "replayable finite consumer",
                "explicit coordinator wiring",
                "kernel theorem or independently audited finite proof",
            ],
        },
    }
    return {
        **report_unsigned,
        "report_sha256": sha256_value(report_unsigned),
    }
