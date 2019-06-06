`include "uvm_macros.svh"

interface template_if #(OUTPUT_SKEW = 1ps) (
  input clk,
  input rst
);

  import uvm_pkg::*;

  logic data_i;
  logic data_o;

  clocking drv_cb @(posedge clk);
    default input #1step output #OUTPUT_SKEW;

    input data_i;
    inout data_o;
  endclocking : drv_cb

  clocking mon_cb @(posedge clk);
    default input #1step output #OUTPUT_SKEW;

    input data_i;
    input data_o;
  endclocking : mon_cb

  clocking rsp_cb @(posedge clk);
    default input #1step output #OUTPUT_SKEW;

    inout data_i;
    input data_o;
  endclocking : rsp_cb

  modport drv_mp(clocking drv_cb, input rst);
  modport mon_mp(clocking mon_cb, input rst);
  modport rsp_mp(clocking rsp_cb, input rst);

endinterface : template_if

