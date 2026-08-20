/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ConvexPerpendicularBisectorSides
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceCnfCdefg

/-!
# Source-facing perpendicular-bisector exhaustion

The source adapter below turns six explicit selected-row incidences into a
guarded exact17 nogood.  It deliberately takes the incidence proof as an
argument: no clause family is generated without a source ingress certificate,
and no cyclic nonadjacency or opposite-side claim is assumed.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenPerpendicularBisectorExhaustion

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ConvexPerpendicularBisectorSides

private abbrev Hit := Label × Label

/-- The six positive incidences asserting that three centers contain both
endpoints of one candidate pair. -/
def perpBisectorExhaustionHits (p z c₀ c₁ c₂ : Label) : List Hit :=
  [(c₀, p), (c₀, z), (c₁, p), (c₁, z), (c₂, p), (c₂, z)]

private theorem source_point_mem {A : Finset ℝ²} (source : SourceRealization A)
    (label : Label) : source.boundary (source.labelIndex label) ∈ A :=
  boundaryLabel_mem source.boundary source.boundary_image source.labelIndex label

private theorem source_center_eq_of_two_hits {A : Finset ℝ²}
    (source : SourceRealization A) (center p z : Label)
    (hp : p ∈ source.model.selected center)
    (hz : z ∈ source.model.selected center) :
    dist (source.boundary (source.labelIndex center))
        (source.boundary (source.labelIndex p)) =
      dist (source.boundary (source.labelIndex center))
        (source.boundary (source.labelIndex z)) := by
  have hp' := source.mem_selectedRow_of_mem_model hp
  have hz' := source.mem_selectedRow_of_mem_model hz
  exact (source.selectedRow center).support_eq_radius _ hp' |>.trans
    ((source.selectedRow center).support_eq_radius _ hz').symm

/-- Six source row memberships force three distinct equidistant carrier
centers, and hence are impossible for a convex-independent source. -/
theorem false_of_source_perpBisectorExhaustionHits {A : Finset ℝ²}
    (source : SourceRealization A) (p z c₀ c₁ c₂ : Label)
    (hpz : p ≠ z) (hc₀₁ : c₀ ≠ c₁) (hc₀₂ : c₀ ≠ c₂) (hc₁₂ : c₁ ≠ c₂)
    (hall : ∀ hit ∈ perpBisectorExhaustionHits p z c₀ c₁ c₂,
      hit.2 ∈ source.model.selected hit.1) : False := by
  have heq₀ := source_center_eq_of_two_hits source c₀ p z
    (hall (c₀, p) (by simp [perpBisectorExhaustionHits]))
    (hall (c₀, z) (by simp [perpBisectorExhaustionHits]))
  have heq₁ := source_center_eq_of_two_hits source c₁ p z
    (hall (c₁, p) (by simp [perpBisectorExhaustionHits]))
    (hall (c₁, z) (by simp [perpBisectorExhaustionHits]))
  have heq₂ := source_center_eq_of_two_hits source c₂ p z
    (hall (c₂, p) (by simp [perpBisectorExhaustionHits]))
    (hall (c₂, z) (by simp [perpBisectorExhaustionHits]))
  have hpz' : source.boundary (source.labelIndex p) ≠
      source.boundary (source.labelIndex z) :=
    source.boundary_injective.ne
      ((labelIndex_injective_of_positionEmbedding source.orientation source.model.order
        source.labelIndex source.position_embedding).ne hpz)
  have hc₀₁' : source.boundary (source.labelIndex c₀) ≠
      source.boundary (source.labelIndex c₁) :=
    source.boundary_injective.ne
      ((labelIndex_injective_of_positionEmbedding source.orientation source.model.order
        source.labelIndex source.position_embedding).ne hc₀₁)
  have hc₀₂' : source.boundary (source.labelIndex c₀) ≠
      source.boundary (source.labelIndex c₂) :=
    source.boundary_injective.ne
      ((labelIndex_injective_of_positionEmbedding source.orientation source.model.order
        source.labelIndex source.position_embedding).ne hc₀₂)
  have hc₁₂' : source.boundary (source.labelIndex c₁) ≠
      source.boundary (source.labelIndex c₂) :=
    source.boundary_injective.ne
      ((labelIndex_injective_of_positionEmbedding source.orientation source.model.order
        source.labelIndex source.position_embedding).ne hc₁₂)
  exact false_of_three_distinct_equidistant_carriers source.carrier_convexIndep
    (source_point_mem source p) (source_point_mem source z)
    hpz'
    (source_point_mem source c₀) (source_point_mem source c₁)
    (source_point_mem source c₂) hc₀₁' hc₀₂' hc₁₂' heq₀ heq₁ heq₂

/-- A guarded exact17 incidence nogood admitted only with the source
perpendicular-bisector exhaustion premises. -/
theorem sourceAssign_perpBisectorExhaustionClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (p z c₀ c₁ c₂ : Label)
    (hpz : p ≠ z) (hc₀₁ : c₀ ≠ c₁) (hc₀₂ : c₀ ≠ c₂)
    (hc₁₂ : c₁ ≠ c₂) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (nogoodClause order (perpBisectorExhaustionHits p z c₀ c₁ c₂)) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_source_perpBisectorExhaustionHits source p z c₀ c₁ c₂
    hpz hc₀₁ hc₀₂ hc₁₂ hall

end ATailBlockerVExactSeventeenPerpendicularBisectorExhaustion
end Problem97
