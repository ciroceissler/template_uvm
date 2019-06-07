`ifndef TEMPLATE_TEST_BASE_SVH
`define TEMPLATE_TEST_BASE_SVH

`include "template_env_config.svh"
`include "template_env.svh"

class template_test_base extends template_test_report;

  localparam string config_id = "template_env_config";

  template_sqc_api    sqc;
  template_env        env;
  template_env_config env_config;

  `uvm_component_utils(template_test_base)

  // +--------------------------------------------------------------------------
  // | FUNCTION: new
  // +--------------------------------------------------------------------------
  function new(string name = "template_test_base", uvm_component parent = null);
    super.new(name, parent);

    this.sqc = new();
    this.env = new();
  endfunction : new

  // +--------------------------------------------------------------------------
  // | FUNCTION: configure_template_agent
  // +--------------------------------------------------------------------------
  virtual function void configure_template_agent(template_agent_config agent_config);
    agent_config.active_mode = UVM_ACTIVE;
    agent_config.has_monitor = 1;
  endfunction : configure_template_agent

  // +--------------------------------------------------------------------------
  // | FUNCTION: configure_environment
  // +--------------------------------------------------------------------------
  virtual function void configure_environment();
    this.env_config = new();

    uvm_config_db #(template_env_config)::set(null, "", "template_env_config", this.env_config);
  endfunction : configure_environment

  // +--------------------------------------------------------------------------
  // | FUNCTION: connect_phase
  // +--------------------------------------------------------------------------
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    this.sqc.set_sequencer(this.env.template_ag.sequencer);
  endfunction : connect_phase

  // +--------------------------------------------------------------------------
  // | TASK: run_phase
  // +--------------------------------------------------------------------------
  virtual task run_phase(uvm_phase phase);
  endtask : run_phase

  // +--------------------------------------------------------------------------
  // | FUNCTION: check_phase
  // +--------------------------------------------------------------------------
  virtual function void check_phase(uvm_phase phase);
    $assertkill;
  endfunction : check_phase

endclass : template_test_base

`endif // TEMPLATE_TEST_BASE_SVH

