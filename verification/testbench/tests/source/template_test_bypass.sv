class template_test_bypass extends template_test_base;

  `uvm_component_utils(template_test_bypass)

  // +--------------------------------------------------------------------------
  // | FUNCTION: new
  // +--------------------------------------------------------------------------
  function new(string name = "template_test_bypass", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  // +--------------------------------------------------------------------------
  // | FUNCTION: build_phase
  // +--------------------------------------------------------------------------
  function build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction : build_phase

  // +--------------------------------------------------------------------------
  // | FUNCTION: end_of_elaboration_phase
  // +--------------------------------------------------------------------------
  function end_of_elaboration_phase(uvm_phase phase);
  endfunction : end_of_elaboration_phase

  // +--------------------------------------------------------------------------
  // | TASK: run_phase
  // +--------------------------------------------------------------------------
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    // TODO(ciroceissler): execute test
    this.sqc.set_data(1'b1);
    this.sqc.set_data(1'b0);

    phase.drop_objection(this);
  endtask : run_phase
endclass : template_test_bypass
