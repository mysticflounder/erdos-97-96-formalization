# Formalization handoff: t=8 source-row ordinal ingress

## Exact finite theorem available

Fix the directed endpoint-A2 packet with 24 ordered cap rows and base rows

```text
C0, C1, C22.
```

For a structurally legal fourth selected row `Cr`—endpoint row with one cap hit or interior row with two cap hits on opposite sides—under pair-codegree at most two, row intersection at most two, shared-pair alternation, and the lifted isosceles chord-direction identities:

```text
r = 2 ∨ r = 19 ∨ r = 20 ∨ r = 21
```

is sufficient for contradiction. For every other `r`, an exact rational strict direction witness exists in the finite model.

The all-order bank is therefore a four-way ordinal consumer, not a generic “fourth row” consumer.

## Source packet that does not work

For

```text
Q : EndpointFreshFirstApexRowSource E,
```

`Q.row.center = S.oppApex1`. It is outside its opposite cap and an endpoint of the adjacent caps. The bank closes only strict-interior ordinals. Endpoint `C0` and `C23` both have exact survivors. Thus `Q.row` cannot be identified with the missing fourth row while preserving natural cap geography.

## Best source packet

In

```text
C : ReverseHitFreshEndpointContext ...,
```

set

```text
b := H.centerAt O.deleted O.deleted_mem_A.
```

The source already supplies the correct generic interior-row interface:

```text
C.reverseBlocker_mem_capInterior
C.reverseShell_inter_cap_eq
exists_firstCap_cgn_order_between_reverseBlocker_of_reverseHit
```

These establish:

- `b` is strict interior to `capByIndex S.oppIndex1`;
- the selected shell at `O.deleted` has exactly the two cap hits `O.kept,O.deleted`;
- `b` lies strictly between those hits in cap order.

Under the `+4` equality normal form, the other two support points form the outside owner pair.

## Missing theorem

A direct ingress theorem should provide a boundary indexing and packet orientation with:

```lean
∃ j : Fin 24,
  indexedCenter j = b ∧
  indexedSelectedRow j = H.selectedAt O.deleted O.deleted_mem_A ∧
  j ∈ ({2, 19, 20, 21} : Finset (Fin 24)).
```

The literal finite numerals can be replaced by a normalized local-root-type disjunction if that fits the source architecture better.

The theorem must also transport:

- the two cap hits `O.kept,O.deleted`;
- their strict betweenness around `b`;
- the row’s two outside support points/owner pair;
- the base packet rows corresponding to `C0,C1,C22`;
- direct versus reflected boundary orientation.

## Alternative ingress

Under `TriApexAllLarge`, the selected shells at `Q.C` and `Q.J` have centers in some cap interior, but the index is existential. Their support facts are:

```text
Q.C shell: Q.C,Q.K in support
Q.J shell in crossHit: Q.J,Q.K in support
Q.J shell in freshCommonDeletion: Q.K omitted
```

A usable bridge must first align the existential cap with the banked ordered cap, then derive an ordinal or one of the normalized packet types.

## Certificate interface

The unified finite bank contains:

```text
base triple patterns:       258
four-row pattern union:  12,132
unified patterns:        12,390
unique certificate SHAs:  8,784
support size:               7–43
```

Recommended consumer:

1. public lifted first/middle/last isosceles identities;
2. nonnegative integer weights on strict chord-order inequalities;
3. signed integer weights on isosceles equalities;
4. exact coefficient cancellation;
5. nonpositive constant and positive strict-weight sum;
6. terminal `linarith`/finite-sum arithmetic.

No generated certificate uses the gauge equality.

## Regression obligations

Any generalized theorem must preserve the exact survivors at

```text
C0,C1,C3,...,C18,C22,C23.
```

In particular, these statements are false on the encoded finite surface:

```text
“some nonendpoint fourth row suffices”
“some early interior row suffices”
“some late interior row suffices”
“the endpoint continuation row Q.row supplies the bank ingress”
```

## Promotion order

1. Finish/export lifted isosceles identities.
2. Add the generic integer Farkas consumer.
3. Prove the reverse-blocker row-indexing/localization theorem.
4. Import the four-bank union.
5. Use survivor witnesses as negative regression tests.
