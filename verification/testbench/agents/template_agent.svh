`ifndef TEMPLATE_AGENT_SVH
`define TEMPLATE_AGENT_SVH

class template_agent extends uvm_agent;

  template_monitor      monitor;
  template_driver       driver;
  template_sequencer    sequencer;
  template_agent_config agent_config;

  `uvm_component_utils(template_agent)

  // +--------------------------------------------------------------------------
  // | FUNCTION: constructor
  // +--------------------------------------------------------------------------
  function new(string name = "template_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  // +--------------------------------------------------------------------------
  // | FUNCTION: build_phase
  // +--------------------------------------------------------------------------
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction : build_phase

  // +--------------------------------------------------------------------------
  // | FUNCTION: connect_phase
  // +--------------------------------------------------------------------------
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction : connect_phase

endclass : template_agent

`endif // TEMPLATE_AGENT_SVH

