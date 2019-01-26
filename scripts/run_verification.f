#===----- run_verification.f - script cadence irun -------------------------===#

# simulator configuration
-sv
-64bit
-access +rwc

# dut filtes
../design/rtl/template.v

# testbench files
