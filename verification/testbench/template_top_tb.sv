`include "template_if.sv"

module template_top_tb;
  import uvm_pkg::*;
  import template_agent_pkg::*;

  `include "uvm_macros.svh"
  `include "template_test_list.svh"

  // +--------------------------------------------------------------------------
  // | VARIABLES:
  // +--------------------------------------------------------------------------
  logic clk;
  logic rst;

  // +--------------------------------------------------------------------------
  // | INTERFACES INSTATIANTION:
  // +--------------------------------------------------------------------------
  template_if uu_template_if (
    .clk (clk),
    .rst (rst)
  );

  // +--------------------------------------------------------------------------
  // | MODULES INSTATIANTION:
  // +--------------------------------------------------------------------------
  template uu_template (
    .clk    (clk),
    .rst    (rst),
    .data_i (uu_template_if.data_i),
    .data_o (uu_template_if.data_o)
  );

  // +--------------------------------------------------------------------------
  // | BLOCK: RUN_RESET
  // +--------------------------------------------------------------------------
  initial begin : RUN_RESET
    rst = 1'b0;

    #10 rst = 1'b1;
    #10 rst = 1'b0;
  end : RUN_RESET

  // +--------------------------------------------------------------------------
  // | BLOCK: INIT_CLK
  // +--------------------------------------------------------------------------
  initial begin : INIT_CLK
    clk = 1'b0;
  end : INIT_CLK

  // +--------------------------------------------------------------------------
  // | BLOCK: RUN_CLK
  // +--------------------------------------------------------------------------
  always begin : RUN_CLK
    #5 clk <= ~clk;
  end : RUN_CLK

  // +--------------------------------------------------------------------------
  // | BLOCK: RUN_TEST
  // +--------------------------------------------------------------------------
  initial begin : RUN_TEST
    uvm_config_db #(template_vif_t)::set(null, "uvm_test_top", "template_vif", uu_template_if);

    run_test();
  end : RUN_TEST

endmodule : template_top_tb

