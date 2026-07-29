import canonicalLaneMathlib.AdmissibleClass

/-!
# Difference Inclusion Approximation Package
-/

namespace HautevilleHouse
namespace DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean

structure DifferenceInclusionApproximationPackage
    (P : DFDFirstPrinciplesPackage) where
  stepSizeSelection : Prop
  inclusionApproximation : Prop
  consistencyCondition : Prop
  convergenceProperty : Prop
  errorEstimate : Prop

structure DifferenceInclusionApproximationEvidence
    {P : DFDFirstPrinciplesPackage}
    (D : DifferenceInclusionApproximationPackage P) where
  stepSizeSelectionClosed : D.stepSizeSelection
  inclusionApproximationClosed : D.inclusionApproximation
  consistencyConditionClosed : D.consistencyCondition
  convergencePropertyClosed : D.convergenceProperty
  errorEstimateClosed : D.errorEstimate

def DifferenceInclusionApproximationClosed
    {P : DFDFirstPrinciplesPackage}
    (D : DifferenceInclusionApproximationPackage P) : Prop :=
  D.stepSizeSelection ∧ D.inclusionApproximation ∧
  D.consistencyCondition ∧ D.convergenceProperty ∧
  D.errorEstimate

theorem difference_inclusion_approximation_closed_from_evidence
    {P : DFDFirstPrinciplesPackage}
    (D : DifferenceInclusionApproximationPackage P)
    (E : DifferenceInclusionApproximationEvidence D) :
    DifferenceInclusionApproximationClosed D := by
  exact And.intro E.stepSizeSelectionClosed
    (And.intro E.inclusionApproximationClosed
      (And.intro E.consistencyConditionClosed
        (And.intro E.convergencePropertyClosed E.errorEstimateClosed)))

end DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse