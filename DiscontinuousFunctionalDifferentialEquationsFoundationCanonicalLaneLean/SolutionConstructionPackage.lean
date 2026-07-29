import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean

structure SolutionConstructionPackage where
  stepMethod : Type u
  existenceProof : Prop
  uniquenessProof : Prop
  continuousDependence : Prop

structure SolutionConstructionEvidence (S : SolutionConstructionPackage) where
  existenceProofClosed : S.existenceProof
  uniquenessProofClosed : S.uniquenessProof
  continuousDependenceClosed : S.continuousDependence

def SolutionConstructionClosed (S : SolutionConstructionPackage) : Prop :=
  S.existenceProof ∧ S.uniquenessProof ∧ S.continuousDependence

theorem solution_construction_closed_from_evidence (S : SolutionConstructionPackage) (E : SolutionConstructionEvidence S) :
    SolutionConstructionClosed S := by
  exact And.intro E.existenceProofClosed (And.intro E.uniquenessProofClosed E.continuousDependenceClosed)

end DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse