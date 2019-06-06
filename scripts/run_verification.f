#===----- run_verification.f - script cadence irun -------------------------===#

# simulator configuration
-sv
-uvm
-64bit
-access +rwc
-timescale 1ns/1ps
-top template_top_tb

+incdir+../verification/testbench/agents
+incdir+../verification/testbench/envs
+incdir+../verification/testbench/tests

# dut filtes
../design/rtl/template.v

# testbench files
../verification/testbench/agents/template_agent_pkg.sv
../verification/testbench/envs/template_abv_checker.sv
../verification/testbench/template_top_tb.sv

