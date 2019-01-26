`ifndef fail_to_str
  `define fail_to_str(x) `"assertion x failed`"
`endif

`ifndef assert_and_cover
  `define assert_and_cover(__name)                         \
    a_``__name : assert property (__name)                  \
      else `uvm_error("assertion ", `fail_to_str(__name) ) \
    c_``__name : cover property (__name)
`endif

module template_abv_checker (
  input       clk,
  input       rst,
  template_if vif
);

  import uvm_pkg::*;

  `include "uvm_macros.svh"

  timeunit      1ns;
  timeprecision 1ps;

  property p_bypass;
    disable iff (rst)
      @(posedge clk)
        vif.data_i |-> vif.data_o;
  endproperty

  `assert_and_cover(p_bypass)

endmodule : template_abv_checker
