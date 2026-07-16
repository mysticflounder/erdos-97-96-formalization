#!/usr/bin/env python3
"""Emit a deterministic module-split replay of the bucketed Kx certificate.

Each original generator gets one bounded product module.  Those modules export
only the canonical bucket family at the product root and its zero theorem.
The coordinator imports the twelve roots and checks the eleven-node certificate
merge tree.  This keeps Lean's front-end snapshot tree far below the size of
the all-in-one 18k-command source while preserving the identical exact QQ
identity and bucket proofs.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Mapping, Sequence


HERE = Path(__file__).resolve().parent
BUCKETED_GENERATOR = HERE / "generate_lambda_kx_bucketed_lean.py"
OUTPUT_DIR = HERE / "LambdaKxBucketed"
COORDINATOR = OUTPUT_DIR / "Certificate.lean"
MANIFEST = HERE / "LambdaKxBucketedModules.manifest.json"

EXPECTED_BUCKETED_GENERATOR_SHA256 = (
    "205313fc910f0cdb1b6f0033131022337bb739a6d8b4ba44db6aa2f8665eb730"
)
MODULE_NAMESPACE = "Problem97.ATailBankCleanLambdaKxBucketedModules"
MODULE_PREFIX = "LambdaKxBucketed"


def file_sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def bytes_sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def load_bucketed_generator():
    actual = file_sha256(BUCKETED_GENERATOR)
    if actual != EXPECTED_BUCKETED_GENERATOR_SHA256:
        raise ValueError(
            "bucketed generator drift: expected "
            f"{EXPECTED_BUCKETED_GENERATOR_SHA256}, found {actual}"
        )
    spec = importlib.util.spec_from_file_location(
        "lambda_kx_bucketed_helpers_for_modules", BUCKETED_GENERATOR
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load helpers from {BUCKETED_GENERATOR}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


B = load_bucketed_generator()
OLD = B.OLD
MICRO = B.MICRO
STAGED = B.STAGED
SparsePolynomial = B.SparsePolynomial


@dataclass(frozen=True)
class Plan:
    variables: tuple[str, ...]
    names: tuple[str, ...]
    generators: tuple[str, ...]
    cofactors: tuple[SparsePolynomial, ...]
    generator_polynomials: tuple[SparsePolynomial, ...]
    products: tuple[SparsePolynomial, ...]
    chunks: tuple[B.Chunk, ...]
    nodes: Mapping[int, B.ProofNode]
    topo: tuple[int, ...]
    root_id: int
    merge_records: tuple[Mapping[str, object], ...]
    buckets: tuple[tuple[bytes, ...], ...]
    monomial_bucket: Mapping[bytes, int]
    bucket_stats: Mapping[str, object]
    aggregate_shape: tuple[B.AggregateShapeNode, ...]
    aggregate_root_key: tuple[str, int, int]
    node_bucket_polynomials: Mapping[int, tuple[SparsePolynomial, ...]]
    product_root_ids: Mapping[int, int]


def build_plan() -> Plan:
    OLD.require_hash(
        OLD.CERTIFICATE, OLD.EXPECTED_CERTIFICATE_SHA256, "QQ certificate"
    )
    certificate = json.loads(OLD.CERTIFICATE.read_text(encoding="utf-8"))
    if certificate["schema"] != OLD.EXPECTED_SCHEMA:
        raise ValueError("certificate schema drift")
    if certificate["content_sha256"] != OLD.EXPECTED_CONTENT_SHA256:
        raise ValueError("certificate content drift")
    variables = tuple(str(value) for value in certificate["variable_order"])
    names = tuple(str(value) for value in certificate["generator_names"])
    generators = tuple(str(value) for value in certificate["generators"])
    variable_index = {name: index for index, name in enumerate(variables)}
    cofactors = tuple(
        OLD.parse_flat_polynomial(text, variables, variable_index)
        for text in certificate["cofactors"]
    )
    generator_polynomials = tuple(
        OLD.parse_source_polynomial(text, variables) for text in generators
    )
    products = tuple(
        STAGED.multiply_sparse(cofactor, generator)
        for cofactor, generator in zip(
            cofactors, generator_polynomials, strict=True
        )
    )
    total: SparsePolynomial = {}
    for product in products:
        total = STAGED.add_sparse(total, product)
    if total != OLD.target_polynomial(variables):
        raise ValueError("exact QQ certificate replay drift")

    chunks: list[B.Chunk] = []
    next_chunk_id = 0
    for generator_index, (cofactor, generator) in enumerate(
        zip(cofactors, generator_polynomials, strict=True)
    ):
        new_chunks, next_chunk_id = B.split_cofactor_chunks(
            generator_index, cofactor, generator, next_chunk_id
        )
        chunks.extend(new_chunks)
    original_merge_plan = OLD.greedy_merge(products)
    nodes, topo, root_id, merge_records = B.build_nodes(
        chunks, products, original_merge_plan
    )
    if nodes[root_id].polynomial != OLD.target_polynomial(variables):
        raise ValueError("module plan root is not Kx")
    buckets, monomial_bucket, bucket_stats = B.build_buckets(nodes, variables)
    aggregate_shape, aggregate_root_key = B.build_aggregate_shape(len(buckets))
    node_bucket_polynomials = {
        node_id: B.polynomial_buckets(
            node.polynomial, len(buckets), monomial_bucket
        )
        for node_id, node in nodes.items()
    }

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
            raise ValueError(f"product root drift at generator {generator_index}")
        product_root_ids[generator_index] = roots[0]
    return Plan(
        variables=variables,
        names=names,
        generators=generators,
        cofactors=cofactors,
        generator_polynomials=generator_polynomials,
        products=products,
        chunks=tuple(chunks),
        nodes=nodes,
        topo=tuple(topo),
        root_id=root_id,
        merge_records=tuple(merge_records),
        buckets=tuple(buckets),
        monomial_bucket=monomial_bucket,
        bucket_stats=bucket_stats,
        aggregate_shape=tuple(aggregate_shape),
        aggregate_root_key=aggregate_root_key,
        node_bucket_polynomials=node_bucket_polynomials,
        product_root_ids=product_root_ids,
    )


def public_product_prefix(generator_index: int) -> str:
    return f"lambdaKxProduct{generator_index}"


def aggregate_public_name(
    prefix: str,
    shape_node: B.AggregateShapeNode,
    root_key: tuple[str, int, int],
) -> str:
    return (
        f"{prefix}Value"
        if shape_node.key == root_key
        else f"{prefix}AggL{shape_node.level}Part{shape_node.index}"
    )


def emit_public_bucket_family(
    writer,
    *,
    node: B.ProofNode,
    bucket_polynomials: tuple[SparsePolynomial, ...],
    aggregate_shape: Sequence[B.AggregateShapeNode],
    root_key: tuple[str, int, int],
    variables: Sequence[str],
    prefix: str,
) -> tuple[B.BucketFamily, dict[str, object]]:
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
        if len(polynomial) > B.MAX_BUCKET_ATOMS:
            raise ValueError("public bucket atom limit exceeded")
        if expression_bytes > B.MAX_BUCKET_EXPRESSION_BYTES:
            raise ValueError("public bucket byte limit exceeded")
        name = f"{prefix}Part{bucket_index}"
        part_names.append(name)
        active_part_bytes.append(expression_bytes)
        active_part_terms.append(len(polynomial))
        writer.command(
            f"definition:{name}",
            f"@[simp] def {name} {binder} : ℝ :=\n  {expression}",
        )

    aggregate_names: dict[tuple[str, int, int], str] = {}
    for shape_node in aggregate_shape:
        name = aggregate_public_name(prefix, shape_node, root_key)
        aggregate_names[shape_node.key] = name
        temporary = B.BucketFamily(
            node_id=node.node_id,
            prefix=prefix,
            polynomial=node.polynomial,
            buckets=bucket_polynomials,
            part_names=tuple(part_names),
            aggregate_names=aggregate_names,
            root_name=name if shape_node.key == root_key else "",
        )
        calls = [
            B.key_call(temporary, child_key, variables)
            for child_key in shape_node.child_keys
        ]
        writer.command(
            f"definition:{name}",
            f"@[simp] def {name} {binder} : ℝ :=\n  {MICRO.balanced_sum(calls)}",
        )
    root_name = aggregate_names[root_key]
    family = B.BucketFamily(
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
        "public": True,
        "support_size": len(node.polynomial),
        "active_bucket_count": sum(name is not None for name in part_names),
        "max_active_bucket_terms": max(active_part_terms, default=0),
        "max_active_bucket_bytes": max(active_part_bytes, default=0),
        "polynomial_sha256": B.polynomial_sha256(node.polynomial),
    }


def public_product_family(plan: Plan, generator_index: int) -> B.BucketFamily:
    node_id = plan.product_root_ids[generator_index]
    node = plan.nodes[node_id]
    bucket_polynomials = plan.node_bucket_polynomials[node_id]
    prefix = public_product_prefix(generator_index)
    part_names = tuple(
        None if not polynomial else f"{prefix}Part{bucket_index}"
        for bucket_index, polynomial in enumerate(bucket_polynomials)
    )
    aggregate_names = {
        shape_node.key: aggregate_public_name(
            prefix, shape_node, plan.aggregate_root_key
        )
        for shape_node in plan.aggregate_shape
    }
    return B.BucketFamily(
        node_id=node_id,
        prefix=prefix,
        polynomial=node.polynomial,
        buckets=bucket_polynomials,
        part_names=part_names,
        aggregate_names=aggregate_names,
        root_name=aggregate_names[plan.aggregate_root_key],
    )


def header(writer, *, imports: Sequence[str], title: str) -> None:
    for module in imports:
        writer.command(f"import:{module}", f"import {module}")
    writer.prose(f"/-! {title} -/")
    writer.command("namespace", f"namespace {MODULE_NAMESPACE}")
    writer.command("option:maxHeartbeats", "set_option maxHeartbeats 80000000")
    writer.command("option:maxRecDepth", "set_option maxRecDepth 100000")
    writer.command("option:unused", "set_option linter.unusedVariables false")
    writer.command("noncomputable", "noncomputable section")


def finish_source(writer) -> tuple[bytes, dict[str, object]]:
    writer.command("section:end", "end")
    writer.command("namespace:end", f"end {MODULE_NAMESPACE}")
    source = writer.source()
    B.source_scan(source)
    oversized = [
        command
        for command in writer.commands
        if int(command["bytes"]) > B.MAX_EMITTED_COMMAND_BYTES
    ]
    if oversized:
        raise ValueError(f"oversized module commands: {oversized[:3]}")
    return source, {
        "source_bytes": len(source),
        "source_sha256": bytes_sha256(source),
        "command_count": len(writer.commands),
        "max_command_bytes": max(int(command["bytes"]) for command in writer.commands),
    }


def emit_product_module(
    plan: Plan, generator_index: int
) -> tuple[bytes, dict[str, object]]:
    writer = MICRO.CommandWriter()
    header(
        writer,
        imports=("Mathlib",),
        title=(
            "Bounded bucket replay for lambda Kx product "
            f"{generator_index} ({plan.names[generator_index]})."
        ),
    )
    writer.command(
        "progress:start",
        f'#eval IO.println "lambda Kx product {generator_index}: header elaborated"',
    )
    variables = plan.variables
    arguments = " ".join(variables)
    binder = f"({arguments} : ℝ)"
    root_id = plan.product_root_ids[generator_index]
    candidates = [
        node_id
        for node_id in plan.topo
        if plan.nodes[node_id].generator_index == generator_index
    ]
    chunks = {chunk.chunk_id: chunk for chunk in plan.chunks}
    node_families: dict[int, B.BucketFamily] = {}
    leaf_zero_theorems: dict[int, str] = {}
    node_zero_theorems: dict[int, str] = {}
    family_records = []
    merge_records = []

    for node_id in candidates:
        node = plan.nodes[node_id]
        if node.is_leaf:
            chunk = chunks[node.chunk_id]
            cofactor_family = MICRO.emit_polynomial_family(
                writer,
                prefix=f"lambdaKxModuleCofactor{chunk.chunk_id}",
                polynomial=chunk.cofactor,
                variables=variables,
            )
        if node_id == root_id:
            family, family_record = emit_public_bucket_family(
                writer,
                node=node,
                bucket_polynomials=plan.node_bucket_polynomials[node_id],
                aggregate_shape=plan.aggregate_shape,
                root_key=plan.aggregate_root_key,
                variables=variables,
                prefix=public_product_prefix(generator_index),
            )
        else:
            family, family_record = B.emit_bucket_family(
                writer,
                node=node,
                bucket_polynomials=plan.node_bucket_polynomials[node_id],
                aggregate_shape=plan.aggregate_shape,
                root_key=plan.aggregate_root_key,
                variables=variables,
            )
        node_families[node_id] = family
        family_records.append(family_record)
        if node.is_leaf:
            leaf_zero_theorems[node_id] = B.emit_leaf_zero(
                writer,
                node=node,
                family=family,
                chunk=chunk,
                cofactor_family=cofactor_family,
                variables=variables,
                names=plan.names,
                generators=plan.generators,
            )
        else:
            left = node_families[node.left_id]
            right = node_families[node.right_id]
            merge_theorem, merge_record = B.emit_merge_identity(
                writer,
                node=node,
                parent=family,
                left=left,
                right=right,
                aggregate_shape=plan.aggregate_shape,
                variables=variables,
            )
            merge_records.append(merge_record)
            node_zero_theorems[node_id] = B.emit_zero_of_children(
                writer,
                node=node,
                parent=family,
                left=left,
                right=right,
                merge_theorem=merge_theorem,
                variables=variables,
            )

    theorem_name = f"lambdaKxProduct{generator_index}Zero"
    hname = f"h{plan.names[generator_index]}"
    lines = [
        f"theorem {theorem_name} {binder}",
        f"    ({hname} : {plan.generators[generator_index]} = 0) :",
        f"    {B.declaration_call(node_families[root_id].root_name, variables)} = 0 := by",
    ]
    local_zero_names: dict[int, str] = {}
    for node_id in candidates:
        node = plan.nodes[node_id]
        local_name = f"hz{node_id}"
        if node.is_leaf:
            lines.append(
                f"  have {local_name} := {leaf_zero_theorems[node_id]} "
                f"{arguments} {hname}"
            )
        else:
            lines.append(
                f"  have {local_name} := {node_zero_theorems[node_id]} "
                f"{arguments} {local_zero_names[node.left_id]} "
                f"{local_zero_names[node.right_id]}"
            )
        local_zero_names[node_id] = local_name
    lines.append(f"  exact {local_zero_names[root_id]}")
    writer.command(f"theorem:{theorem_name}", "\n".join(lines))
    writer.command("axioms", f"#print axioms {theorem_name}")
    writer.command(
        "progress:end",
        f'#eval IO.println "lambda Kx product {generator_index}: checked"',
    )
    source, stats = finish_source(writer)
    stats.update(
        {
            "module": f"{MODULE_PREFIX}.Product{generator_index}",
            "file": f"Product{generator_index}.lean",
            "generator_index": generator_index,
            "generator_name": plan.names[generator_index],
            "node_count": len(candidates),
            "chunk_count": sum(plan.nodes[node_id].is_leaf for node_id in candidates),
            "root_node_id": root_id,
            "families": family_records,
            "merge_identities": merge_records,
        }
    )
    return source, stats


def emit_coordinator(plan: Plan) -> tuple[bytes, dict[str, object]]:
    writer = MICRO.CommandWriter()
    imports = tuple(
        f"{MODULE_PREFIX}.Product{index}"
        for index in range(len(plan.generators))
    )
    header(
        writer,
        imports=imports,
        title="Coordinator for the exact twelve-product lambda Kx certificate.",
    )
    writer.command(
        "progress:start",
        '#eval IO.println "lambda Kx coordinator: products imported"',
    )
    variables = plan.variables
    arguments = " ".join(variables)
    node_families: dict[int, B.BucketFamily] = {
        plan.product_root_ids[index]: public_product_family(plan, index)
        for index in range(len(plan.generators))
    }
    node_zero_theorems: dict[int, str] = {}
    family_records = []
    merge_identity_records = []
    certificate_node_ids = [
        int(record["node_id"])
        for record in plan.merge_records
        if record["kind"] == "certificate"
    ]
    for node_id in certificate_node_ids:
        node = plan.nodes[node_id]
        family, family_record = B.emit_bucket_family(
            writer,
            node=node,
            bucket_polynomials=plan.node_bucket_polynomials[node_id],
            aggregate_shape=plan.aggregate_shape,
            root_key=plan.aggregate_root_key,
            variables=variables,
        )
        node_families[node_id] = family
        family_records.append(family_record)
        left = node_families[node.left_id]
        right = node_families[node.right_id]
        merge_theorem, merge_record = B.emit_merge_identity(
            writer,
            node=node,
            parent=family,
            left=left,
            right=right,
            aggregate_shape=plan.aggregate_shape,
            variables=variables,
        )
        merge_identity_records.append(merge_record)
        node_zero_theorems[node_id] = B.emit_zero_of_children(
            writer,
            node=node,
            parent=family,
            left=left,
            right=right,
            merge_theorem=merge_theorem,
            variables=variables,
        )
        writer.command(
            f"progress:node{node_id}",
            f'#eval IO.println "lambda Kx coordinator: node {node_id} checked"',
        )

    hypotheses = [
        f"    (h{name} : {generator} = 0)"
        for name, generator in zip(plan.names, plan.generators, strict=True)
    ]
    lines = [
        "theorem lambda_kx_zero",
        f"    ({arguments} : ℝ)",
        *hypotheses,
        "    : Kx = 0 := by",
    ]
    zero_names: dict[int, str] = {}
    for generator_index in range(len(plan.generators)):
        node_id = plan.product_root_ids[generator_index]
        local_name = f"hp{generator_index}"
        lines.append(
            f"  have {local_name} := lambdaKxProduct{generator_index}Zero "
            f"{arguments} h{plan.names[generator_index]}"
        )
        zero_names[node_id] = local_name
    for node_id in certificate_node_ids:
        node = plan.nodes[node_id]
        local_name = f"hc{node_id}"
        lines.append(
            f"  have {local_name} := {node_zero_theorems[node_id]} {arguments} "
            f"{zero_names[node.left_id]} {zero_names[node.right_id]}"
        )
        zero_names[node_id] = local_name
    lines.extend(
        (
            f"  have hroot := {zero_names[plan.root_id]}",
            f"  simpa [{node_families[plan.root_id].root_name}] using hroot",
        )
    )
    writer.command("theorem:lambda_kx_zero", "\n".join(lines))
    hypothesis_arguments = " ".join(f"h{name}" for name in plan.names)
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
    source, stats = finish_source(writer)
    stats.update(
        {
            "module": f"{MODULE_PREFIX}.Certificate",
            "file": "Certificate.lean",
            "certificate_node_count": len(certificate_node_ids),
            "families": family_records,
            "merge_identities": merge_identity_records,
        }
    )
    return source, stats


def build() -> tuple[dict[Path, bytes], dict[str, object]]:
    plan = build_plan()
    outputs: dict[Path, bytes] = {}
    module_records: list[dict[str, object]] = []
    for generator_index in range(len(plan.generators)):
        source, record = emit_product_module(plan, generator_index)
        path = OUTPUT_DIR / f"Product{generator_index}.lean"
        outputs[path] = source
        module_records.append(record)
    coordinator, coordinator_record = emit_coordinator(plan)
    outputs[COORDINATOR] = coordinator
    module_records.append(coordinator_record)
    module_records_by_name = {
        str(record["module"]): record for record in module_records
    }
    build_order = [
        f"{MODULE_PREFIX}.Product{index}"
        for index in range(len(plan.generators))
    ] + [f"{MODULE_PREFIX}.Certificate"]
    manifest = {
        "schema": "p97-bank-clean-lambda-kx-bucketed-modules-v1",
        "generator_sha256": file_sha256(Path(__file__)),
        "bucketed_generator_sha256": EXPECTED_BUCKETED_GENERATOR_SHA256,
        "input_certificate_sha256": OLD.EXPECTED_CERTIFICATE_SHA256,
        "input_content_sha256": OLD.EXPECTED_CONTENT_SHA256,
        "exact_external_replay": True,
        "target": "Kx",
        "namespace": MODULE_NAMESPACE,
        "module_prefix": MODULE_PREFIX,
        "build_order": build_order,
        "bucket_stats": plan.bucket_stats,
        "chunk_count": len(plan.chunks),
        "node_count": len(plan.nodes),
        "root_node_id": plan.root_id,
        "modules": [module_records_by_name[name] for name in build_order],
        "total_source_bytes": sum(len(source) for source in outputs.values()),
        "max_module_source_bytes": max(len(source) for source in outputs.values()),
        "total_command_count": sum(
            int(record["command_count"]) for record in module_records
        ),
        "max_module_command_count": max(
            int(record["command_count"]) for record in module_records
        ),
        "max_command_bytes": max(
            int(record["max_command_bytes"]) for record in module_records
        ),
        "epistemic_status": (
            "exact deterministic module-split Lean source; kernel build pending"
        ),
    }
    return outputs, manifest


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    arguments = parser.parse_args()
    outputs, manifest = build()
    manifest_bytes = (
        json.dumps(manifest, indent=2, sort_keys=True) + "\n"
    ).encode("utf-8")
    if arguments.check:
        for path, expected in outputs.items():
            if path.read_bytes() != expected:
                raise SystemExit(f"generated module drift: {path}")
        if MANIFEST.read_bytes() != manifest_bytes:
            raise SystemExit(f"generated module manifest drift: {MANIFEST}")
        print("bucketed lambda Kx module generation check: PASS")
        print("modules", len(outputs))
        print("max module bytes", manifest["max_module_source_bytes"])
        print("max module commands", manifest["max_module_command_count"])
        print("max command bytes", manifest["max_command_bytes"])
        return
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    for path, source in outputs.items():
        path.write_bytes(source)
    MANIFEST.write_bytes(manifest_bytes)
    print(MANIFEST)
    print("modules", len(outputs))
    print("total bytes", manifest["total_source_bytes"])
    print("max module bytes", manifest["max_module_source_bytes"])
    print("max module commands", manifest["max_module_command_count"])
    print("max command bytes", manifest["max_command_bytes"])


if __name__ == "__main__":
    main()
