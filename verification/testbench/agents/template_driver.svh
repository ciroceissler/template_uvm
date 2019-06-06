`ifndef TEMPLATE_DRIVER_SVH
`define TEMPLATE_DRIVER_SVH

class template_driver extends uvm_driver #(template_sqc_item);

  template_agent_config agent_config;

  `uvm_component_utils(template_driver)

  // +--------------------------------------------------------------------------
  // | FUNCTION: constructor
  // +--------------------------------------------------------------------------
  function new(string name = "template_driver", uvm_component parent = null);
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
    driver();
  endtask : run_phase

  // +--------------------------------------------------------------------------
  // | TASK: driver
  // +--------------------------------------------------------------------------
  protected task driver();
    template_sqc_item sqc_item;

    forever begin : TEMPLATE_DRIVER_MAIN_LOOP
      seq_item_port.get_next_item(sqc_item);

      // TODO(ciroceissler): map signals

      seq_item_port.item_done();
    end : TEMPLATE_DRIVER_MAIN_LOOP

  endtask : driver

endclass : template_driver

`endif // TEMPLATE_DRIVER_SVH

