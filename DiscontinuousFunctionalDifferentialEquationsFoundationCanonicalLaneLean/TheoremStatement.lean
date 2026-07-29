import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean

structure DFDTheoremObject where
  space : Type u
  functionClass : Type v
  discontinuitySet : Set space
  solutionExistence : Prop
  uniqueness : Prop
  stability : Prop
  conclusion : Prop

def DFDTheoremClosed (O : DFDTheoremObject) : Prop :=
  O.solutionExistence ∧ O.uniqueness ∧ O.stability

end DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse