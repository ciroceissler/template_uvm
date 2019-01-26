class template_test_base extends template_test_report;

  localparam string config_id = "template_env_config";

  template_sqc        sqc;
  template_env        env;
  template_env_config env_config;

  `uvm_component_utils(template_test_base)

  // +--------------------------------------------------------------------------
  // | FUNCTION: new
  // +--------------------------------------------------------------------------
  function new(string name = "template_test_base", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  // +--------------------------------------------------------------------------
  // | FUNCTION: configure_template_agent
  // +--------------------------------------------------------------------------
  virtual function void configure_template_agent(template_agent_config agent_config);
    agent_config.active_mode = UVM_ACTIVE;
    agent_config.has_mon     = 1;
  endfunction : configure_template_agent

  // +--------------------------------------------------------------------------
  // | FUNCTION: configure_environment
  // +--------------------------------------------------------------------------
  virtual function void configure_environment();
-----------------------------------------------------------------------
  // | TASK: run_phase
  // +--------------------------------------------------------------------------
  virtual task run_phase(uvm_phase phase);
  endtask : run_phase

  // +--------------------------------------------------------------------------
  // | TASK: check_phase
  // +--------------------------------------------------------------------------
  task check_phase(uvm_phase phase);
    $assertkill;
  endtask : check_phase

endclass : template_test_base
