include("init.jl")
init8500()


@testset "Circuit" begin 

@test Circuit.NumCktElements() == 6103
@test Circuit.NumBuses() == 4876
@test Circuit.NumNodes() == 8541
@test Circuit.FirstPCElement() == 1
@test Circuit.NextPCElement() == 2
@test Circuit.FirstPDElement() == 1
@test Circuit.NextPDElement() == 2
@test Circuit.Sample() == 0
@test Circuit.SaveSample() == 0
@test Circuit.SetActiveBusi(2) == 0
@test Circuit.FirstElement() == 1
@test Circuit.NextElement() == 2
@test Circuit.UpdateStorage() == 0
@test Circuit.ParentPDElement() == 0
@test Circuit.EndOfTimeStepUpdate() == 0
# @test Circuit.Capacity(10.0, 20.0) ≋ 0.0    # ERROR
@test Circuit.Name() == "ieee8500"
@test Circuit.Disable(Circuit.AllElementNames()[10]) == ""
@test Circuit.Enable(Circuit.AllElementNames()[10]) == ""
@test Circuit.SetActiveElement(Circuit.AllElementNames()[10]) == "9"
@test Circuit.SetActiveBus(Circuit.AllBusNames()[10]) == "9"
@test Circuit.SetActiveClass(ActiveClass.ActiveClassName()) == "16"
@test Circuit.Losses() ≋ 1.218242333223247e6 + 2.798391857088721e6im
@test Circuit.LineLosses() ≋ 1042.0872998508387 + 1674.1606828559168im
@test Circuit.SubstationLosses() ≋ 65.18947074155649 + 752.3006305284744im
@test Circuit.TotalPower() ≋ -12004.740450109337 - 1471.1749507157301im 
@test Circuit.AllBusVolts()[end] ≋ -85.01962676301814 + 84.47523352214344im
@test Circuit.AllBusVMag()[end] ≋ 0.9980241903846725
@test Circuit.AllElementNames()[end] == "RegControl.vreg4_c"
@test Circuit.AllBusNames()[end] == "sx3784018a"
@test Circuit.AllElementLosses()[end] ≋ 0.0
@test Circuit.AllBusMagPu()[end] ≋ 0.9980241903846725
@test Circuit.AllNodeNames()[end] == "sx3784018a.2"
# @show Circuit.SystemY()
@test Circuit.AllBusDistances()[end] ≋ 0.0
@test Circuit.AllNodeDistances()[end] ≋ 0.0
# @test Circuit.AllNodeVmagByPhase()[end]    # ERROR
# @test Circuit.AllNodeVmagPUByPhase()[end]    # ERROR
# @test Circuit.AllNodeDistancesByPhase()[end]    # ERROR
# @test Circuit.AllNodeNamesByPhase()[end]    # ERROR
@test Circuit.YNodeVArray()[end] ≋ -85.01962676301814 + 84.47523352214344im
@test Circuit.YNodeOrder()[end] == "SX3784018A.2"
@test Circuit.YCurrents()[end] ≋ 0.032757937074590515 - 0.054281873453359im

end # testset

