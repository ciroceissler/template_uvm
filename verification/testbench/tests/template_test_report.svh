`ifndef TEMPLATE_TEST_REPORT_SVH
`define TEMPLATE_TEST_REPORT_SVH

virtual class template_test_report extends uvm_test;

  uvm_table_printer      printer;
  template_report_server report_server;

  // +--------------------------------------------------------------------------
  // | FUNCTION: new
  // +--------------------------------------------------------------------------
  function new(string name = "template_test_report", uvm_component parent=null);
    super.new(name, parent);

    this.report_server = new();
  endfunction : new

  // +--------------------------------------------------------------------------
  // | FUNCTION: build_phase
  // +--------------------------------------------------------------------------
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction : build_phase

  // +--------------------------------------------------------------------------
  // | FUNCTION: end_of_elaboration_phase
  // +--------------------------------------------------------------------------
  virtual function void end_of_elaboration_phase(uvm_phase phase);
    `uvm_info(get_type_name(), $sformatf("printing test topology :\n%s", this.sprint(printer)), UVM_FULL)
  endfunction : end_of_elaboration_phase

  // +--------------------------------------------------------------------------
  // | TASK: report_phase
  // +--------------------------------------------------------------------------
  function void report_phase(uvm_phase phase);
    if (this.report_server.get_severity_count(UVM_ERROR)) begin
      `uvm_error(get_type_name(), "FAIL : simulation completed with errors!")
    end
    else begin
      `uvm_info(get_type_name(), "PASS : simulation completed without errors!", UVM_NONE)
    end
  endfunction : report_phase

endclass : template_test_report

`endif // TEMPLATE_TEST_REPORT_SVH

