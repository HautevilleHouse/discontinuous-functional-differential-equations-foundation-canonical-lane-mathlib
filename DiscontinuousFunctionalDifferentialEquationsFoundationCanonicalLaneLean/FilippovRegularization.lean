import canonicalLaneMathlib.AdmissibleClass

/-!
# Filippov Regularization Package
-/

namespace HautevilleHouse
namespace DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean

structure FilippovRegularizationPackage
    {P : DFDFirstPrinciplesPackage}
    (D : DifferenceInclusionApproximationPackage P) where
  setValuedMapDefined : Prop
  convexHullClosure : Prop
  upperSemicontinuity : Prop
  regularizationConsistency : Prop
  solutionCorrespondence : Prop

structure FilippovRegularizationEvidence
    {P : DFDFirstPrinciplesPackage}
    {D : DifferenceInclusionApproximationPackage P}
    (F : FilippovRegularizationPackage D) where
  setValuedMapDefinedClosed : F.setValuedMapDefined
  convexHullClosureClosed : F.convexHullClosure
  upperSemicontinuityClosed : F.upperSemicontinuity
  regularizationConsistencyClosed : F.regularizationConsistency
  solutionCorrespondenceClosed : F.solutionCorrespondence

def FilippovRegularizationClosed
    {P : DFDFirstPrinciplesPackage}
    {D : DifferenceInclusionApproximationPackage P}
    (F : FilippovRegularizationPackage D) : Prop :=
  F.setValuedMapDefined ∧ F.convexHullClosure ∧
  F.upperSemicontinuity ∧ F.regularizationConsistency ∧
  F.solutionCorrespondence

theorem filippov_regularization_closed_from_evidence
    {P : DFDFirstPrinciplesPackage}
    {D : DifferenceInclusionApproximationPackage P}
    (F : FilippovRegularizationPackage D)
    (E : FilippovRegularizationEvidence F) :
    FilippovRegularizationClosed F := by
  exact And.intro E.setValuedMapDefinedClosed
    (And.intro E.convexHullClosureClosed
      (And.intro E.upperSemicontinuityClosed
        (And.intro E.regularizationConsistencyClosed E.solutionCorrespondenceClosed)))

end DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse