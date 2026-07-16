#!/usr/bin/env python3
"""Emit a relation-bucketed Lean replay of the exact QQ Kx certificate.

The earlier microsharded replay kept source declarations small, but one
``linear_combination`` still unfolded a 6,591-term relation.  This generator
also shards the *proof relation*.  It does so in three deterministic layers:

* split each exact cofactor into chunks whose expanded generator product has
  bounded support;
* represent every chunk, product, and merge node in one fixed partition of
  the 9,372 possible monomials;
* certify parent = left + right one bucket at a time, then lift those local
  identities through a fixed 32-ary aggregate tree without unfolding the
  polynomial leaves.

Consequently, only a bounded leaf chunk is ever normalized by ``ring``.  All
later zero proofs use opaque child-zero facts and the bucketed merge identity.
This file and its outputs are scratch-only.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import re
import sys
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Mapping, Sequence


HERE = Path(__file__).resolve().parent
OLD_GENERATOR = HERE / "generate_lambda_kx_microsharded_lean.py"
OUTPUT = HERE / "LambdaKxBucketedCertificate.lean"
MANIFEST = HERE / "LambdaKxBucketedCertificate.manifest.json"

EXPECTED_OLD_GENERATOR_SHA256 = (
    "a1c00acb9487f14bf9c630ab12728f077eb70637ce72846bdc16e53491d47615"
)
MAX_CHUNK_COFACTOR_TERMS = 256
MAX_CHUNK_PRODUCT_SUPPORT = 1024
MAX_BUCKET_ATOMS = 96
MAX_BUCKET_EXPRESSION_BYTES = 12_000
MAX_AGGREGATE_CHILDREN = 32
MAX_EMITTED_COMMAND_BYTES = 16_384


def file_sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def bytes_sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def require_hash(path: Path, expected: str, label: str) -> None:
    actual = file_sha256(path)
    if actual != expected:
        raise ValueError(f"{label} drift: expected {expected}, found {actual}")


def load_old_generator():
    require_hash(
        OLD_GENERATOR,
        EXPECTED_OLD_GENERATOR_SHA256,
        "lambda microsharded generator",
    )
    spec = importlib.util.spec_from_file_location(
        "lambda_kx_microsharded_helpers_for_bucketed", OLD_GENERATOR
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load helpers from {OLD_GENERATOR}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


OLD = load_old_generator()
MICRO = OLD.MICRO
STAGED = OLD.STAGED
Monomial = bytes
SparsePolynomial = dict[Monomial, Fraction]


def polynomial_sha256(polynomial: SparsePolynomial) -> str:
    return STAGED.polynomial_sha256(polynomial)


def declaration_call(name: str, variables: Sequence[str]) -> str:
    return f"{name} {' '.join(variables)}"


def signed_atom_bytes(
    monomial: Monomial, coefficient: Fraction, variables: Sequence[str]
) -> int:
    body = MICRO.lean_term(monomial, abs(coefficient), variables)
    atom = f"(-{body})" if coefficient < 0 else body
    return len(atom.encode("utf-8"))


def singleton_product(
    monomial: Monomial,
    coefficient: Fraction,
    generator: SparsePolynomial,
) -> SparsePolynomial:
    return STAGED.multiply_sparse({monomial: coefficient}, generator)


@dataclass(frozen=True)
class Chunk:
    chunk_id: int
    generator_index: int
    cofactor: SparsePolynomial
    product: SparsePolynomial


@dataclass(frozen=True)
class ProofNode:
    node_id: int
    label: str
    polynomial: SparsePolynomial
    left_id: int | None
    right_id: int | None
    chunk_id: int | None
    generator_index: int | None

    @property
    def is_leaf(self) -> bool:
        return self.chunk_id is not None


def split_cofactor_chunks(
    generator_index: int,
    cofactor: SparsePolynomial,
    generator: SparsePolynomial,
    next_chunk_id: int,
) -> tuple[list[Chunk], int]:
    chunks: list[Chunk] = []
    current_cofactor: SparsePolynomial = {}
    current_product: SparsePolynomial = {}

    def flush() -> None:
        nonlocal next_chunk_id, current_cofactor, current_product
        if not current_cofactor:
            return
        exact = STAGED.multiply_sparse(current_cofactor, generator)
        if exact != current_product:
            raise ValueError("incremental chunk product drift")
        if len(current_cofactor) > MAX_CHUNK_COFACTOR_TERMS:
            raise ValueError("cofactor chunk term limit exceeded")
        if len(current_product) > MAX_CHUNK_PRODUCT_SUPPORT:
            raise ValueError("cofactor chunk product support limit exceeded")
        chunks.append(
            Chunk(
                chunk_id=next_chunk_id,
                generator_index=generator_index,
                cofactor=dict(current_cofactor),
                product=dict(current_product),
            )
        )
        next_chunk_id += 1
        current_cofactor = {}
        current_product = {}

    for monomial, coefficient in STAGED.sorted_terms(cofactor):
        contribution = singleton_product(monomial, coefficient, generator)
        candidate_product = STAGED.add_sparse(current_product, contribution)
        if current_cofactor and (
            len(current_cofactor) >= MAX_CHUNK_COFACTOR_TERMS
            or len(candidate_product) > MAX_CHUNK_PRODUCT_SUPPORT
        ):
            flush()
            candidate_product = contribution
        current_cofactor[monomial] = coefficient
        current_product = candidate_product
    flush()
    rebuilt_cofactor: SparsePolynomial = {}
    rebuilt_product: SparsePolynomial = {}
    for chunk in chunks:
        rebuilt_cofactor = STAGED.add_sparse(rebuilt_cofactor, chunk.cofactor)
        rebuilt_product = STAGED.add_sparse(rebuilt_product, chunk.product)
    if rebuilt_cofactor != cofactor:
        raise ValueError(f"cofactor chunk partition drift at generator {generator_index}")
    if rebuilt_product != STAGED.multiply_sparse(cofactor, generator):
        raise ValueError(f"product chunk partition drift at generator {generator_index}")
    return chunks, next_chunk_id


def balanced_merge_ids(ids: Sequence[int]) -> list[tuple[int, int]]:
    """Return a deterministic bottom-up pairing schedule over existing ids."""

    if not ids:
        raise ValueError("cannot merge an empty node stream")
    live = list(ids)
    schedule: list[tuple[int, int]] = []
    while len(live) > 1:
        next_live: list[int] = []
        for position in range(0, len(live), 2):
            if position + 1 == len(live):
                next_live.append(live[position])
            else:
                left_id = live[position]
                right_id = live[position + 1]
                schedule.append((left_id, right_id))
                # A negative placeholder is replaced by the caller in order.
                next_live.append(-(len(schedule)))
        live = next_live
    return schedule


def build_nodes(
    chunks: Sequence[Chunk],
    products: Sequence[SparsePolynomial],
    merge_plan: Mapping[str, object],
) -> tuple[dict[int, ProofNode], list[int], int, list[dict[str, object]]]:
    nodes: dict[int, ProofNode] = {}
    topo: list[int] = []
    chunk_node_ids_by_generator: dict[int, list[int]] = {
        index: [] for index in range(len(products))
    }
    next_node_id = 0
    for chunk in chunks:
        node = ProofNode(
            node_id=next_node_id,
            label=f"chunk{chunk.chunk_id}",
            polynomial=dict(chunk.product),
            left_id=None,
            right_id=None,
            chunk_id=chunk.chunk_id,
            generator_index=chunk.generator_index,
        )
        nodes[next_node_id] = node
        topo.append(next_node_id)
        chunk_node_ids_by_generator[chunk.generator_index].append(next_node_id)
        next_node_id += 1

    product_roots: list[int] = []
    merge_records: list[dict[str, object]] = []
    for generator_index in range(len(products)):
        live = list(chunk_node_ids_by_generator[generator_index])
        if not live:
            raise ValueError(f"generator {generator_index} has no chunks")
        level = 0
        while len(live) > 1:
            next_live: list[int] = []
            for position in range(0, len(live), 2):
                if position + 1 == len(live):
                    next_live.append(live[position])
                    continue
                left_id = live[position]
                right_id = live[position + 1]
                polynomial = STAGED.add_sparse(
                    nodes[left_id].polynomial, nodes[right_id].polynomial
                )
                node = ProofNode(
                    node_id=next_node_id,
                    label=f"product{generator_index}L{level}N{position // 2}",
                    polynomial=polynomial,
                    left_id=left_id,
                    right_id=right_id,
                    chunk_id=None,
                    generator_index=generator_index,
                )
                nodes[next_node_id] = node
                topo.append(next_node_id)
                merge_records.append(
                    {
                        "node_id": next_node_id,
                        "kind": "within_product",
                        "generator_index": generator_index,
                        "left_id": left_id,
                        "right_id": right_id,
                        "support_size": len(polynomial),
                    }
                )
                next_live.append(next_node_id)
                next_node_id += 1
            live = next_live
            level += 1
        root_id = live[0]
        if nodes[root_id].polynomial != products[generator_index]:
            raise ValueError(f"product root drift at generator {generator_index}")
        product_roots.append(root_id)

    old_to_new = {index: product_roots[index] for index in range(len(products))}
    for old_merge in merge_plan["merges"]:
        old_node_id = int(old_merge["node_id"])
        left_id = old_to_new[int(old_merge["left_node_id"])]
        right_id = old_to_new[int(old_merge["right_node_id"])]
        polynomial = STAGED.add_sparse(
            nodes[left_id].polynomial, nodes[right_id].polynomial
        )
        node = ProofNode(
            node_id=next_node_id,
            label=f"certificate{old_node_id}",
            polynomial=polynomial,
            left_id=left_id,
            right_id=right_id,
            chunk_id=None,
            generator_index=None,
        )
        nodes[next_node_id] = node
        topo.append(next_node_id)
        merge_records.append(
            {
                "node_id": next_node_id,
                "kind": "certificate",
                "old_node_id": old_node_id,
                "left_id": left_id,
                "right_id": right_id,
                "support_size": len(polynomial),
            }
        )
        old_to_new[old_node_id] = next_node_id
        next_node_id += 1
    root_id = old_to_new[int(merge_plan["merges"][-1]["node_id"])]
    return nodes, topo, root_id, merge_records


def sorted_monomials(polynomials: Sequence[SparsePolynomial]) -> list[Monomial]:
    union: SparsePolynomial = {}
    for polynomial in polynomials:
        for monomial in polynomial:
            union[monomial] = Fraction(1)
    return [monomial for monomial, _ in STAGED.sorted_terms(union)]


def build_buckets(
    nodes: Mapping[int, ProofNode], variables: Sequence[str]
) -> tuple[list[tuple[Monomial, ...]], dict[Monomial, int], dict[str, object]]:
    monomials = sorted_monomials([node.polynomial for node in nodes.values()])
    worst_atom_bytes = {monomial: 0 for monomial in monomials}
    for node in nodes.values():
        for monomial, coefficient in node.polynomial.items():
            worst_atom_bytes[monomial] = max(
                worst_atom_bytes[monomial],
                signed_atom_bytes(monomial, coefficient, variables),
            )

    buckets: list[tuple[Monomial, ...]] = []
    current: list[Monomial] = []
    current_bytes = 0
    for monomial in monomials:
        atom_bytes = worst_atom_bytes[monomial]
        addition_bytes = 5 if current else 0
        if current and (
            len(current) >= MAX_BUCKET_ATOMS
            or current_bytes + addition_bytes + atom_bytes
            > MAX_BUCKET_EXPRESSION_BYTES
        ):
            buckets.append(tuple(current))
            current = []
            current_bytes = 0
            addition_bytes = 0
        if atom_bytes > MAX_BUCKET_EXPRESSION_BYTES:
            raise ValueError("single monomial atom exceeds bucket byte budget")
        current.append(monomial)
        current_bytes += addition_bytes + atom_bytes
    if current:
        buckets.append(tuple(current))
    monomial_bucket = {
        monomial: bucket_index
        for bucket_index, bucket in enumerate(buckets)
        for monomial in bucket
    }
    if len(monomial_bucket) != len(monomials):
        raise ValueError("global bucket partition drift")
    stats = {
        "bucket_count": len(buckets),
        "monomial_count": len(monomials),
        "max_bucket_monomials": max(map(len, buckets)),
        "max_bucket_worst_expression_bytes": max(
            sum(worst_atom_bytes[m] for m in bucket) + 5 * (len(bucket) - 1)
            for bucket in buckets
        ),
    }
    return buckets, monomial_bucket, stats


def polynomial_buckets(
    polynomial: SparsePolynomial,
    bucket_count: int,
    monomial_bucket: Mapping[Monomial, int],
) -> tuple[SparsePolynomial, ...]:
    answer: list[SparsePolynomial] = [{} for _ in range(bucket_count)]
    for monomial, coefficient in polynomial.items():
        answer[monomial_bucket[monomial]][monomial] = coefficient
    rebuilt: SparsePolynomial = {}
    for bucket in answer:
        rebuilt = STAGED.add_sparse(rebuilt, bucket)
    if rebuilt != polynomial:
        raise ValueError("bucket projection drift")
    return tuple(answer)


@dataclass(frozen=True)
class AggregateShapeNode:
    level: int
    index: int
    child_keys: tuple[tuple[str, int, int], ...]

    @property
    def key(self) -> tuple[str, int, int]:
        return ("aggregate", self.level, self.index)


def build_aggregate_shape(bucket_count: int) -> tuple[list[AggregateShapeNode], tuple[str, int, int]]:
    current = [("bucket", 0, index) for index in range(bucket_count)]
    nodes: list[AggregateShapeNode] = []
    level = 0
    while len(current) > 1:
        next_keys: list[tuple[str, int, int]] = []
        for index in range(0, len(current), MAX_AGGREGATE_CHILDREN):
            node = AggregateShapeNode(
                level=level,
                index=index // MAX_AGGREGATE_CHILDREN,
                child_keys=tuple(current[index : index + MAX_AGGREGATE_CHILDREN]),
            )
            nodes.append(node)
            next_keys.append(node.key)
        current = next_keys
        level += 1
    if len(current) != 1:
        raise ValueError("aggregate shape has no root")
    return nodes, current[0]


@dataclass(frozen=True)
class BucketFamily:
    node_id: int
    prefix: str
    polynomial: SparsePolynomial
    buckets: tuple[SparsePolynomial, ...]
    part_names: tuple[str | None, ...]
    aggregate_names: Mapping[tuple[str, int, int], str]
    root_name: str


def key_call(
    family: BucketFamily,
    key: tuple[str, int, int],
    variables: Sequence[str],
) -> str:
    kind, _level, index = key
    if kind == "bucket":
        name = family.part_names[index]
        return "0" if name is None else declaration_call(name, variables)
    return declaration_call(family.aggregate_names[key], variables)


def emit_bucket_family(
    writer,
    *,
    node: ProofNode,
    bucket_polynomials: tuple[SparsePolynomial, ...],
    aggregate_shape: Sequence[AggregateShapeNode],
    root_key: tuple[str, int, int],
    variables: Sequence[str],
) -> tuple[BucketFamily, dict[str, object]]:
    prefix = f"lambdaKxBucketNode{node.node_id}"
    binder = f"({' '.join(variables)} : ℝ)"
    part_names: list[str | None] = []
    active_part_bytes: list[int] = []
    active_part_terms: list[int] = []
    for bucket_index, polynomial in enumerate(bucket_polynomials):
        if not polynomial:
            part_names.append(None)
            continue
        expression = OLD.render_polynomial(polynomial, variables)
        expression_bytes = len(expression.encode("utf-8"))
        if len(polynomial) > MAX_BUCKET_ATOMS:
            raise ValueError("bucket atom limit exceeded")
        if expression_bytes > MAX_BUCKET_EXPRESSION_BYTES:
            raise ValueError("bucket expression limit exceeded")
        name = f"{prefix}Part{bucket_index}"
        part_names.append(name)
        active_part_bytes.append(expression_bytes)
        active_part_terms.append(len(polynomial))
        writer.command(
            f"definition:{name}",
            f"@[simp] private def {name} {binder} : ℝ :=\n  {expression}",
        )

    provisional = BucketFamily(
        node_id=node.node_id,
        prefix=prefix,
        polynomial=node.polynomial,
        buckets=bucket_polynomials,
        part_names=tuple(part_names),
        aggregate_names={},
        root_name="",
    )
    aggregate_names: dict[tuple[str, int, int], str] = {}
    for shape_node in aggregate_shape:
        key = shape_node.key
        name = (
            f"{prefix}Value"
            if key == root_key
            else f"{prefix}AggL{shape_node.level}Part{shape_node.index}"
        )
        aggregate_names[key] = name
        # All child aggregate names have already been installed at lower levels.
        temporary = BucketFamily(
            node_id=node.node_id,
            prefix=prefix,
            polynomial=node.polynomial,
            buckets=bucket_polynomials,
            part_names=tuple(part_names),
            aggregate_names=aggregate_names,
            root_name=name if key == root_key else "",
        )
        calls = [
            key_call(temporary, child_key, variables)
            for child_key in shape_node.child_keys
        ]
        writer.command(
            f"definition:{name}",
            f"@[simp] private def {name} {binder} : ℝ :=\n  {MICRO.balanced_sum(calls)}",
        )
    root_name = aggregate_names[root_key]
    family = BucketFamily(
        node_id=node.node_id,
        prefix=prefix,
        polynomial=node.polynomial,
        buckets=bucket_polynomials,
        part_names=tuple(part_names),
        aggregate_names=aggregate_names,
        root_name=root_name,
    )
    return family, {
        "node_id": node.node_id,
        "label": node.label,
        "support_size": len(node.polynomial),
        "active_bucket_count": sum(name is not None for name in part_names),
        "max_active_bucket_terms": max(active_part_terms, default=0),
        "max_active_bucket_bytes": max(active_part_bytes, default=0),
        "polynomial_sha256": polynomial_sha256(node.polynomial),
    }


def emit_merge_identity(
    writer,
    *,
    node: ProofNode,
    parent: BucketFamily,
    left: BucketFamily,
    right: BucketFamily,
    aggregate_shape: Sequence[AggregateShapeNode],
    variables: Sequence[str],
) -> tuple[str, dict[str, object]]:
    if node.left_id != left.node_id or node.right_id != right.node_id:
        raise ValueError("merge family/node alignment drift")
    if STAGED.add_sparse(left.polynomial, right.polynomial) != parent.polynomial:
        raise ValueError("merge polynomial identity drift")
    arguments = " ".join(variables)
    binder = f"({arguments} : ℝ)"
    facts: dict[tuple[str, int, int], str | None] = {}
    bucket_theorem_count = 0
    for bucket_index, (target_poly, left_poly, right_poly) in enumerate(
        zip(parent.buckets, left.buckets, right.buckets, strict=True)
    ):
        if STAGED.add_sparse(left_poly, right_poly) != target_poly:
            raise ValueError(f"bucket merge identity drift at node {node.node_id}")
        key = ("bucket", 0, bucket_index)
        if not target_poly and not left_poly and not right_poly:
            facts[key] = None
            continue
        theorem_name = f"lambdaKxBucketMerge{node.node_id}Part{bucket_index}"
        definition_names = tuple(
            name
            for name in (
                parent.part_names[bucket_index],
                left.part_names[bucket_index],
                right.part_names[bucket_index],
            )
            if name is not None
        )
        lines = [
            f"private theorem {theorem_name} {binder} :",
            f"    {key_call(parent, key, variables)} =",
            f"      {key_call(left, key, variables)} + {key_call(right, key, variables)} := by",
        ]
        if definition_names:
            lines.append(
                f"  simp only [{', '.join(definition_names)}] <;> ring"
            )
        else:
            lines.append("  ring")
        writer.command(f"theorem:{theorem_name}", "\n".join(lines))
        facts[key] = theorem_name
        bucket_theorem_count += 1

    aggregate_theorem_count = 0
    for shape_node in aggregate_shape:
        key = shape_node.key
        theorem_name = (
            f"lambdaKxBucketMerge{node.node_id}Value"
            if parent.aggregate_names[key] == parent.root_name
            else f"lambdaKxBucketMerge{node.node_id}AggL{shape_node.level}Part{shape_node.index}"
        )
        child_theorems = [
            facts[child_key]
            for child_key in shape_node.child_keys
            if facts[child_key] is not None
        ]
        lines = [
            f"private theorem {theorem_name} {binder} :",
            f"    {key_call(parent, key, variables)} =",
            f"      {key_call(left, key, variables)} + {key_call(right, key, variables)} := by",
        ]
        if not child_theorems:
            lines.append(
                "  simp only ["
                + ", ".join(
                    (
                        parent.aggregate_names[key],
                        left.aggregate_names[key],
                        right.aggregate_names[key],
                    )
                )
                + "] <;> ring"
            )
        else:
            for index, child_theorem in enumerate(child_theorems):
                lines.append(f"  have h{index} := {child_theorem} {arguments}")
            lines.append(
                "  simp only ["
                + ", ".join(
                    (
                        parent.aggregate_names[key],
                        left.aggregate_names[key],
                        right.aggregate_names[key],
                    )
                )
                + "]"
            )
            lines.append("  linear_combination (norm := ring)")
            for index in range(len(child_theorems)):
                lines.append(("    " if index == 0 else "    + ") + f"h{index}")
        writer.command(f"theorem:{theorem_name}", "\n".join(lines))
        facts[key] = theorem_name
        aggregate_theorem_count += 1
    final_name = facts[aggregate_shape[-1].key]
    if final_name is None:
        raise ValueError("merge identity root unexpectedly trivial")
    return final_name, {
        "node_id": node.node_id,
        "bucket_theorem_count": bucket_theorem_count,
        "aggregate_theorem_count": aggregate_theorem_count,
        "root_theorem": final_name,
    }


def emit_leaf_zero(
    writer,
    *,
    node: ProofNode,
    family: BucketFamily,
    chunk: Chunk,
    cofactor_family,
    variables: Sequence[str],
    names: Sequence[str],
    generators: Sequence[str],
) -> str:
    if not node.is_leaf or node.chunk_id != chunk.chunk_id:
        raise ValueError("leaf/chunk alignment drift")
    generator_index = chunk.generator_index
    arguments = " ".join(variables)
    binder = f"({arguments} : ℝ)"
    theorem_name = f"lambdaKxBucketLeaf{node.node_id}Zero"
    hname = f"h{names[generator_index]}"
    lines = [
        f"private theorem {theorem_name} {binder}",
        f"    ({hname} : {generators[generator_index]} = 0) :",
        f"    {declaration_call(family.root_name, variables)} = 0 := by",
        "  linear_combination",
        "    (norm := (simp ["
        + family.root_name
        + ", "
        + cofactor_family.aggregate
        + "]; ring))",
        f"    ({declaration_call(cofactor_family.aggregate, variables)}) * {hname}",
    ]
    writer.command(f"theorem:{theorem_name}", "\n".join(lines))
    return theorem_name


def emit_zero_of_children(
    writer,
    *,
    node: ProofNode,
    parent: BucketFamily,
    left: BucketFamily,
    right: BucketFamily,
    merge_theorem: str,
    variables: Sequence[str],
) -> str:
    arguments = " ".join(variables)
    binder = f"({arguments} : ℝ)"
    theorem_name = f"lambdaKxBucketNode{node.node_id}ZeroOfChildren"
    lines = [
        f"private theorem {theorem_name} {binder}",
        f"    (hleft : {declaration_call(left.root_name, variables)} = 0)",
        f"    (hright : {declaration_call(right.root_name, variables)} = 0) :",
        f"    {declaration_call(parent.root_name, variables)} = 0 := by",
        f"  rw [{merge_theorem} {arguments}, hleft, hright]",
        "  norm_num",
    ]
    writer.command(f"theorem:{theorem_name}", "\n".join(lines))
    return theorem_name


def source_scan(source: bytes) -> None:
    text = source.decode("utf-8")
    for label, pattern in {
        "sorry": r"\bsorry\b",
        "admit": r"\badmit\b",
        "native_decide": r"\bnative_decide\b",
        "axiom declaration": r"(?m)^\s*axiom\s+",
    }.items():
        if re.search(pattern, text):
            raise ValueError(f"generated source contains prohibited {label}")


def build() -> tuple[bytes, dict[str, object]]:
    OLD.require_hash(OLD.CERTIFICATE, OLD.EXPECTED_CERTIFICATE_SHA256, "QQ certificate")
    certificate = json.loads(OLD.CERTIFICATE.read_text(encoding="utf-8"))
    if certificate["schema"] != OLD.EXPECTED_SCHEMA:
        raise ValueError("certificate schema drift")
    if certificate["content_sha256"] != OLD.EXPECTED_CONTENT_SHA256:
        raise ValueError("certificate content hash drift")
    variables = [str(value) for value in certificate["variable_order"]]
    names = [str(value) for value in certificate["generator_names"]]
    generators = [str(value) for value in certificate["generators"]]
    variable_index = {name: index for index, name in enumerate(variables)}
    cofactors = [
        OLD.parse_flat_polynomial(text, variables, variable_index)
        for text in certificate["cofactors"]
    ]
    generator_polynomials = [
        OLD.parse_source_polynomial(text, variables) for text in generators
    ]
    products = [
        STAGED.multiply_sparse(cofactor, generator)
        for cofactor, generator in zip(
            cofactors, generator_polynomials, strict=True
        )
    ]
    total: SparsePolynomial = {}
    for product in products:
        total = STAGED.add_sparse(total, product)
    if total != OLD.target_polynomial(variables):
        raise ValueError("exact QQ certificate replay drift")
    original_merge_plan = OLD.greedy_merge(products)

    chunks: list[Chunk] = []
    next_chunk_id = 0
    chunk_counts: list[int] = []
    for generator_index, (cofactor, generator) in enumerate(
        zip(cofactors, generator_polynomials, strict=True)
    ):
        generator_chunks, next_chunk_id = split_cofactor_chunks(
            generator_index,
            cofactor,
            generator,
            next_chunk_id,
        )
        chunks.extend(generator_chunks)
        chunk_counts.append(len(generator_chunks))
    nodes, topo, root_id, merge_records = build_nodes(
        chunks, products, original_merge_plan
    )
    if nodes[root_id].polynomial != OLD.target_polynomial(variables):
        raise ValueError("bucketed node root is not Kx")
    buckets, monomial_bucket, bucket_stats = build_buckets(nodes, variables)
    aggregate_shape, aggregate_root_key = build_aggregate_shape(len(buckets))
    node_bucket_polynomials = {
        node_id: polynomial_buckets(
            node.polynomial, len(buckets), monomial_bucket
        )
        for node_id, node in nodes.items()
    }

    writer = MICRO.CommandWriter()
    writer.command("import", "import Mathlib")
    writer.prose(
        "/-! Relation-bucketed kernel replay of the exact generic-reflection Kx certificate. -/"
    )
    writer.command(
        "namespace", "namespace Problem97.ATailBankCleanLambdaKxBucketed"
    )
    writer.prose(
        "\n".join(
            (
                f"-- Exact QQ certificate SHA256: {OLD.EXPECTED_CERTIFICATE_SHA256}",
                f"-- Exact content SHA256: {OLD.EXPECTED_CONTENT_SHA256}",
                f"-- Cofactor chunks: {len(chunks)}",
                f"-- Fixed monomial buckets: {len(buckets)}",
                f"-- Chunk product support bound: {MAX_CHUNK_PRODUCT_SUPPORT}",
                f"-- Bucket expression bound: {MAX_BUCKET_EXPRESSION_BYTES} bytes",
            )
        )
    )
    writer.command("option:maxHeartbeats", "set_option maxHeartbeats 80000000")
    writer.command("option:maxRecDepth", "set_option maxRecDepth 100000")
    writer.command("option:unused", "set_option linter.unusedVariables false")
    writer.command("noncomputable", "noncomputable section")
    writer.command(
        "progress:start",
        '#eval IO.println "lambda Kx bucketed replay: header elaborated"',
    )

    chunk_by_id = {chunk.chunk_id: chunk for chunk in chunks}
    cofactor_families = {}
    node_families: dict[int, BucketFamily] = {}
    family_records = []
    leaf_zero_theorems: dict[int, str] = {}
    merge_theorems: dict[int, str] = {}
    node_zero_theorems: dict[int, str] = {}
    merge_identity_records = []

    # Emit in topological order so every merge theorem can refer to its child
    # definitions and identities without forward declarations.
    for node_id in topo:
        node = nodes[node_id]
        if node.is_leaf:
            chunk = chunk_by_id[node.chunk_id]
            cofactor_family = MICRO.emit_polynomial_family(
                writer,
                prefix=f"lambdaKxBucketCofactor{chunk.chunk_id}",
                polynomial=chunk.cofactor,
                variables=variables,
            )
            cofactor_families[chunk.chunk_id] = cofactor_family
        family, family_record = emit_bucket_family(
            writer,
            node=node,
            bucket_polynomials=node_bucket_polynomials[node_id],
            aggregate_shape=aggregate_shape,
            root_key=aggregate_root_key,
            variables=variables,
        )
        node_families[node_id] = family
        family_records.append(family_record)
        if node.is_leaf:
            chunk = chunk_by_id[node.chunk_id]
            leaf_zero_theorems[node_id] = emit_leaf_zero(
                writer,
                node=node,
                family=family,
                chunk=chunk,
                cofactor_family=cofactor_families[chunk.chunk_id],
                variables=variables,
                names=names,
                generators=generators,
            )
        else:
            if node.left_id is None or node.right_id is None:
                raise ValueError("internal node missing child")
            left = node_families[node.left_id]
            right = node_families[node.right_id]
            merge_theorem, merge_record = emit_merge_identity(
                writer,
                node=node,
                parent=family,
                left=left,
                right=right,
                aggregate_shape=aggregate_shape,
                variables=variables,
            )
            merge_theorems[node_id] = merge_theorem
            merge_identity_records.append(merge_record)
            node_zero_theorems[node_id] = emit_zero_of_children(
                writer,
                node=node,
                parent=family,
                left=left,
                right=right,
                merge_theorem=merge_theorem,
                variables=variables,
            )

    # One small theorem per original generator assembles its bounded chunk
    # tree.  This keeps the final 12-row theorem command well below 16 KiB.
    arguments = " ".join(variables)
    binder = f"({arguments} : ℝ)"
    chunk_node_ids_by_generator: dict[int, list[int]] = {
        index: [] for index in range(len(generators))
    }
    for node_id in topo:
        node = nodes[node_id]
        if node.is_leaf:
            chunk_node_ids_by_generator[node.generator_index].append(node_id)
    product_root_ids: dict[int, int] = {}
    for generator_index in range(len(generators)):
        candidates = [
            node_id
            for node_id in topo
            if nodes[node_id].generator_index == generator_index
        ]
        roots = [
            node_id
            for node_id in candidates
            if not any(
                parent.left_id == node_id or parent.right_id == node_id
                for parent in (nodes[other] for other in candidates)
            )
        ]
        if len(roots) != 1:
            raise ValueError(f"product root reconstruction drift at {generator_index}")
        product_root_ids[generator_index] = roots[0]
        theorem_name = f"lambdaKxBucketProduct{generator_index}Zero"
        hname = f"h{names[generator_index]}"
        lines = [
            f"private theorem {theorem_name} {binder}",
            f"    ({hname} : {generators[generator_index]} = 0) :",
            f"    {declaration_call(node_families[roots[0]].root_name, variables)} = 0 := by",
        ]
        local_zero_names: dict[int, str] = {}
        for node_id in candidates:
            node = nodes[node_id]
            local_name = f"hz{node_id}"
            if node.is_leaf:
                lines.append(
                    f"  have {local_name} := {leaf_zero_theorems[node_id]} {arguments} {hname}"
                )
            else:
                lines.append(
                    f"  have {local_name} := {node_zero_theorems[node_id]} {arguments} "
                    f"{local_zero_names[node.left_id]} {local_zero_names[node.right_id]}"
                )
            local_zero_names[node_id] = local_name
        lines.append(f"  exact {local_zero_names[roots[0]]}")
        writer.command(f"theorem:{theorem_name}", "\n".join(lines))
        writer.command(
            f"progress:product{generator_index}",
            f'#eval IO.println "lambda Kx bucketed replay: product {generator_index} checked"',
        )

    certificate_nodes = [
        int(record["node_id"])
        for record in merge_records
        if record["kind"] == "certificate"
    ]
    hypotheses = [
        f"    (h{name} : {generator} = 0)"
        for name, generator in zip(names, generators, strict=True)
    ]
    lines = [
        "theorem lambda_kx_zero",
        f"    ({arguments} : ℝ)",
        *hypotheses,
        "    : Kx = 0 := by",
    ]
    zero_names: dict[int, str] = {}
    for generator_index in range(len(generators)):
        node_id = product_root_ids[generator_index]
        local_name = f"hp{generator_index}"
        lines.append(
            f"  have {local_name} := lambdaKxBucketProduct{generator_index}Zero "
            f"{arguments} h{names[generator_index]}"
        )
        zero_names[node_id] = local_name
    for node_id in certificate_nodes:
        node = nodes[node_id]
        local_name = f"hc{node_id}"
        lines.append(
            f"  have {local_name} := {node_zero_theorems[node_id]} {arguments} "
            f"{zero_names[node.left_id]} {zero_names[node.right_id]}"
        )
        zero_names[node_id] = local_name
    lines.extend(
        (
            f"  have hroot := {zero_names[root_id]}",
            f"  simpa [{node_families[root_id].root_name}] using hroot",
        )
    )
    writer.command("theorem:lambda_kx_zero", "\n".join(lines))
    hypothesis_arguments = " ".join(f"h{name}" for name in names)
    writer.command(
        "theorem:lambda_incompatible",
        "\n".join(
            (
                "theorem generic_double_reflection_lambda_incompatible",
                f"    ({arguments} : ℝ)",
                *hypotheses,
                "    : False := by",
                f"  have hKx : Kx = 0 := lambda_kx_zero {arguments} {hypothesis_arguments}",
                "  have hKy : Ky = 0 := by",
                "    nlinarith [sq_nonneg Ky]",
                "  have hGXK0 : Xx ^ 2 + Xy ^ 2 = 0 := by",
                "    simpa [hKx, hKy] using hGXK",
                "  have hXx : Xx = 0 := by",
                "    nlinarith [sq_nonneg Xx, sq_nonneg Xy]",
                "  have hXy : Xy = 0 := by",
                "    nlinarith [sq_nonneg Xx, sq_nonneg Xy]",
                "  have hXZ0 : Zx ^ 2 + Zy ^ 2 = 0 := by",
                "    simpa [hKx, hXx, hXy] using hXZ",
                "  have hZx : Zx = 0 := by",
                "    nlinarith [sq_nonneg Zx, sq_nonneg Zy]",
                "  have hZAG0 : -2 * Zx + 1 = 0 := by",
                "    simpa [hKx, hKy] using hZAG",
                "  nlinarith",
            )
        ),
    )
    writer.command("axioms:kx", "#print axioms lambda_kx_zero")
    writer.command(
        "axioms:incompatible",
        "#print axioms generic_double_reflection_lambda_incompatible",
    )
    writer.command("section:end", "end")
    writer.command(
        "namespace:end", "end Problem97.ATailBankCleanLambdaKxBucketed"
    )
    source = writer.source()
    source_scan(source)
    oversized = [
        command
        for command in writer.commands
        if int(command["bytes"]) > MAX_EMITTED_COMMAND_BYTES
    ]
    if oversized:
        raise ValueError(f"oversized emitted commands: {oversized[:3]}")

    manifest = {
        "schema": "p97-bank-clean-lambda-kx-bucketed-lean-v1",
        "generator_sha256": file_sha256(Path(__file__)),
        "input_certificate_sha256": OLD.EXPECTED_CERTIFICATE_SHA256,
        "input_content_sha256": OLD.EXPECTED_CONTENT_SHA256,
        "exact_external_replay": True,
        "target": "Kx",
        "variable_order": variables,
        "generator_names": names,
        "limits": {
            "chunk_cofactor_terms": MAX_CHUNK_COFACTOR_TERMS,
            "chunk_product_support": MAX_CHUNK_PRODUCT_SUPPORT,
            "bucket_atoms": MAX_BUCKET_ATOMS,
            "bucket_expression_bytes": MAX_BUCKET_EXPRESSION_BYTES,
            "aggregate_children": MAX_AGGREGATE_CHILDREN,
            "emitted_command_bytes": MAX_EMITTED_COMMAND_BYTES,
        },
        "chunk_count": len(chunks),
        "chunk_counts_by_generator": chunk_counts,
        "max_chunk_cofactor_terms": max(len(chunk.cofactor) for chunk in chunks),
        "max_chunk_product_support": max(len(chunk.product) for chunk in chunks),
        "bucket_stats": bucket_stats,
        "aggregate_shape_node_count": len(aggregate_shape),
        "node_count": len(nodes),
        "merge_count": len(merge_records),
        "families": family_records,
        "merge_identities": merge_identity_records,
        "root_node_id": root_id,
        "root_polynomial_sha256": polynomial_sha256(nodes[root_id].polynomial),
        "command_count": len(writer.commands),
        "max_command_bytes": max(int(command["bytes"]) for command in writer.commands),
        "source_bytes": len(source),
        "source_sha256": bytes_sha256(source),
        "prohibited_source_tokens": [],
        "epistemic_status": (
            "exact QQ identity replay and deterministic bounded Lean source; "
            "kernel check pending"
        ),
    }
    return source, manifest


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    arguments = parser.parse_args()
    source, manifest = build()
    manifest_bytes = (
        json.dumps(manifest, indent=2, sort_keys=True) + "\n"
    ).encode("utf-8")
    if arguments.check:
        if OUTPUT.read_bytes() != source:
            raise SystemExit(f"generated Lean source drift: {OUTPUT}")
        if MANIFEST.read_bytes() != manifest_bytes:
            raise SystemExit(f"generated manifest drift: {MANIFEST}")
        print("bucketed lambda Kx generation check: PASS")
        print("source sha256", manifest["source_sha256"])
        print("commands", manifest["command_count"])
        print("max command bytes", manifest["max_command_bytes"])
        return
    OUTPUT.write_bytes(source)
    MANIFEST.write_bytes(manifest_bytes)
    print(OUTPUT)
    print(MANIFEST)
    print("chunks", manifest["chunk_count"])
    print("buckets", manifest["bucket_stats"]["bucket_count"])
    print("nodes", manifest["node_count"])
    print("source bytes", manifest["source_bytes"])
    print("source sha256", manifest["source_sha256"])
    print("commands", manifest["command_count"])
    print("max command bytes", manifest["max_command_bytes"])


if __name__ == "__main__":
    main()
