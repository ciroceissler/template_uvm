class template_checker extends uvm_component;

  uvm_tlm_analysis_fifo #(template_sqc_item) template_mon_sqi_afifo;

  `uvm_component_param_utils(template_checker)

  // +--------------------------------------------------------------------------
  // | FUNCTION: constructor
  // +--------------------------------------------------------------------------
  function new(string name = "template_env", uvm_component parent = null);
    super.new(name, parent);

    this.template_mon_sqi_afifo = new("template_mon_sqi_afifo", this);
  endfunction : new

  // +--------------------------------------------------------------------------
  // | FUNCTION: build_phase
  // +--------------------------------------------------------------------------
  virtual function build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction : build_phase

  // +--------------------------------------------------------------------------
  // | TASK: run_phase 
  // +--------------------------------------------------------------------------
  task run_phase(uvm_phase phase);
    // TODO(ciroceissler): all
  endtask : run_phase 

  // +--------------------------------------------------------------------------
  // | FUNCTION: check_phase
  // +--------------------------------------------------------------------------
  virtual function check_phase(uvm_phase phase);
  endfunction : check_phase

endclass : template_checker
