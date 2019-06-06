`ifndef TEMPLATE_MONITOR_SVH
`define TEMPLATE_MONITOR_SVH

class template_monitor extends uvm_monitor;

  template_agent_config agent_config;

  `uvm_component_utils(template_monitor)

  // +--------------------------------------------------------------------------
  // | FUNCTION: constructor
  // +--------------------------------------------------------------------------
  function new(string name = "template_monitor", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  // +--------------------------------------------------------------------------
  // | FUNCTION: build_phase
  // +--------------------------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction : build_phase

  // +--------------------------------------------------------------------------
  // | TASK: run_phase
  // +--------------------------------------------------------------------------
  task run_phase(uvm_phase phase);
    monitor();
  endtask : run_phase

  // +--------------------------------------------------------------------------
  // | TASK: monitor 
  // +--------------------------------------------------------------------------
  protected task monitor();

    forever begin : TEMPLATE_MONITOR_MAIN_LOOP
      #1; // TODO(ciroceissler): remove
    end : TEMPLATE_MONITOR_MAIN_LOOP

  endtask : monitor

endclass : template_monitor

`endif // TEMPLATE_MONITOR_SVH

