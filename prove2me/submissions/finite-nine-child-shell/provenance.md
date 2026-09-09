# Provenance: finite-nine shell child

The child statement is the `shell` cut from `submissions/finite-nine-modular/cuts.json`. Its source target is `Batch3N9.Problem97.finiteEndpointShellOfCounterexample`, authenticated in the retained 87-unit stream by the `shell.lean` fragment SHA-256 `80695e5a22497b0be1f1c30c51c1fe6bc48d067d74744a2750cfca385c14e4fe`. The target declaration's recorded statement SHA-256 is `0a90c92c1cde8bdfad9c1d030ed86b17478abf2da2372cbe392b260c1061ca31`.

The public wrapper changes the source codomain `FiniteEndpointShell A` to `Nonempty (FiniteEndpointShell A)` so that the theorem remains a proposition. Its proof constructs the same record and then applies `Nonempty.intro`; no geometric hypothesis or conclusion is changed.

## Published inputs

The direct definition import is `Erdos9796FiniteNine_Shell` (`ce37debe-f180-46db-96cb-4cea533473dc`, `PUBLISHED`). It imports `Erdos9796FiniteNine_CountingCore`; the sibling Forms and N8Interface bundles are public but are not needed by this first leaf.

The solution invokes exactly these accepted theorem nodes:

| theorem | Prove2Me theorem ID | status |
| --- | --- | --- |
| `Problem97.card_ge_five_of_K4` | `d3df4af2-5c9b-4779-8237-55b72a7ae55b` | `PUBLISHED` |
| `Problem97.ConvexIndep.not_collinear_of_card_ge_three` | `2bc1b598-8cf1-49ae-a11e-eff7a1601f56` | `PUBLISHED` |
| `Problem97.MEC.no_diameter_under_k4` | `211a267a-bf56-402d-bc74-7004df294cab` | `PUBLISHED` |
| `Problem97.MEC.exists_nonobtuse_circumscribed_triple` | `e7271c43-6407-4578-b67b-2074efb61aa5` | `PUBLISHED` |
| `Problem97.Dumitrescu.three_cap_decomposition` | `4dba05a7-7baa-40f6-9e99-0a6ced562a07` | `PUBLISHED` |

Their proof-bearing source audit is recorded in `submissions/counting-transfer/validation.json`: 75 nodes checked, all within `{propext, Classical.choice, Quot.sound}`. The public definition audit is recorded in `submissions/finite-nine-stage2-definitions/validation.json` with the same closure and explicit native/unsafe/external token exclusions.

## Promotion boundary

The solution SHA-256 is `cdee83f0aff4252be5c9541d7f9d2b125ecb6dd3a356946a7a94ca3aad103bb0`. It has been elaborated locally but not uploaded. The public theorem target is `a8773adc-86d1-4bff-b1e3-5380e4ae8974`; the generic uploader plan validates with digest `65d5a9fb7ba5fefd37ab42e0c9229fb630501511fecdb9706846ba73ed913bca`. An independent promotion verifier is still required before upload.
