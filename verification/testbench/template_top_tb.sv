`include "template_agent_pkg.sv"
`include "template_if.sv"

module template_top_tb;

  timeunit      1ns;
  timeprecision 1ps;

  import uvm_pkg::*;

  `include "uvm_macros.svh"

  import template_pkg::*;

  `include "template_env_config.sv"
  `include "template_env.sv"

  `include "template_report_server.sv"
  `include "template_test_report.sv"
  `include "template_test_base.sv"
  `include "template_test_list.sv"

  // +--------------------------------------------------------------------------
  // | VARIABLES:
  // +--------------------------------------------------------------------------
  logic clk;
  logic rst;

  // +--------------------------------------------------------------------------
  // | VIF:
  // +--------------------------------------------------------------------------
  template_if template_vif (
    .clk (clk),
    .rst (rst)
  );

  // +--------------------------------------------------------------------------
  // | MODULES:
  // +--------------------------------------------------------------------------
  template uu_template (
    .clk    (clk),
    .rst    (rst),
    .data_i (template_vif.data_i),
    .data_o (template_vif.data_o)
  );

  // +--------------------------------------------------------------------------
  // | TASK: run_reset
  // +--------------------------------------------------------------------------
  task run_reset();
    #10 rst <= 1'b1;
    #10 rst <= 1'b0;
  endtask : run_reset

  // +--------------------------------------------------------------------------
  // | TASK: run_clk
  // +--------------------------------------------------------------------------
  task run_clk();
    forever begin
      #5 clk <= ~clk;
    end
  endtask : run_clk

  // +--------------------------------------------------------------------------
  // | RUN
  // +--------------------------------------------------------------------------
  initial begin
    clk = 1'b0;
    rst = 1'b0;

    fork
      run_rst();
      run_clk();
    join_none

    uvm_config_db #(virtual template_if)::set(null, "uvm_test_top", "template_vif", template_vif);

    run_test();

    end_of_test = 1;
  end

endmodule : template_tob_tb
