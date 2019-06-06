#===----- run_design.f - script cadence irun -------------------------------===#

# simulator configuration
-sv
-64bit
-access +rwc

# dut filtes
../design/rtl/template.v

# testbench files
../design/testbench/template_tb.sv

