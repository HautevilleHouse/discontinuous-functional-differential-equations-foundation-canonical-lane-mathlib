import canonicalLaneMathlib.AdmissibleClass

/-!
# Endpoint Classification Package
-/

namespace HautevilleHouse
namespace DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean

structure EndpointClassificationPackage
    {P : DFDFirstPrinciplesPackage}
    {D : DifferenceInclusionApproximationPackage P}
    {F : FilippovRegularizationPackage D} where
  endpointFunctionDefined : Prop
  continuityProperties : Prop
  existenceOfLimit : Prop
  classificationResult : Prop

structure EndpointClassificationEvidence
    {P : DFDFirstPrinciplesPackage}
    {D : DifferenceInclusionApproximationPackage P}
    {F : FilippovRegularizationPackage D}
    (E : EndpointClassificationPackage F) where
  endpointFunctionDefinedClosed : E.endpointFunctionDefined
  continuityPropertiesClosed : E.continuityProperties
  existenceOfLimitClosed : E.existenceOfLimit
  classificationResultClosed : E.classificationResult

def EndpointClassificationClosed
    {P : DFDFirstPrinciplesPackage}
    {D : DifferenceInclusionApproximationPackage P}
    {F : FilippovRegularizationPackage D}
    (E : EndpointClassificationPackage F) : Prop :=
  E.endpointFunctionDefined ∧ E.continuityProperties ∧
  E.existenceOfLimit ∧ E.classificationResult

theorem endpoint_classification_closed_from_evidence
    {P : DFDFirstPrinciplesPackage}
    {D : DifferenceInclusionApproximationPackage P}
    {F : FilippovRegularizationPackage D}
    (E : EndpointClassificationPackage F)
    (Ev : EndpointClassificationEvidence E) : EndpointClassificationClosed E := by
  exact And.intro Ev.endpointFunctionDefinedClosed
    (And.intro Ev.continuityPropertiesClosed
      (And.intro Ev.existenceOfLimitClosed Ev.classificationResultClosed))

end DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse