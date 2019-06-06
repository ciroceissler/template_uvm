`ifndef TEMPLATE_SQC_BASE_SVH
`define TEMPLATE_SQC_BASE_SVH

class template_sqc_base extends uvm_sequence #(template_sqc_item);

  `uvm_object_utils(template_sqc_base)

  // +--------------------------------------------------------------------------
  // | FUNCTION: constructor
  // +--------------------------------------------------------------------------
  function new(string name = "template_sqc_base");
    super.new(name);
  endfunction : new

  // +--------------------------------------------------------------------------
  // | TASK: pre_start
  // +--------------------------------------------------------------------------
  virtual task pre_start();
  endtask : pre_start

  // +--------------------------------------------------------------------------
  // | TASK: post_start
  // +--------------------------------------------------------------------------
  virtual task post_start();
  endtask : post_start

endclass : template_sqc_base

`endif // TEMPLATE_SQC_BASE_SVH

