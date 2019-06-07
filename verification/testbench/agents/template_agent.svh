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

    this.driver    = template_driver::type_id::create("template_driver", this);
    this.monitor   = template_monitor::type_id::create("template_monitor", this);
    this.sequencer = template_sequencer::type_id::create("template_sequencer", this);

  endfunction : build_phase

  // +--------------------------------------------------------------------------
  // | FUNCTION: connect_phase
  // +--------------------------------------------------------------------------
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    this.driver.seq_item_port.connect(this.sequencer.seq_item_export);
  endfunction : connect_phase

endclass : template_agent

`endif // TEMPLATE_AGENT_SVH

