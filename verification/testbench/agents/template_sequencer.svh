`ifndef TEMPLATE_SEQUENCER_SVH
`define TEMPLATE_SEQUENCER_SVH

class template_sequencer extends uvm_sequencer #(template_sqc_item);

  `uvm_component_utils(template_sequencer)

  // +--------------------------------------------------------------------------
  // | FUNCTION: constructor
  // +--------------------------------------------------------------------------
  function new(string name = "template_sequencer", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

endclass : template_sequencer

`endif // TEMPLATE_SEQUENCER_SVH

